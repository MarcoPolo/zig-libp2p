const std = @import("std");
const MsQuic = @import("msquic");
const libp2p = @import("libp2p");
const MemoryPool = libp2p.util.MemoryPool;
const crypto = libp2p.crypto;
const CredentialConfigHelper = @import("libp2p-msquic").crypto.CredentialConfigHelper;
// const MsQuic = @import("msquic/msquic-wrapper.zig");
const log = std.log;

const StreamStateMachine = libp2p.stream.StreamStateMachine;

const Allocator = std.mem.Allocator;
const QuicStatus = MsQuic.QuicStatus;
const ArrayList = std.ArrayList;
const Instant = std.time.Instant;
const Semaphore = std.Thread.Semaphore;

const ping_protocol_id = "/ipfs/ping/1.0.0";

const Ping = struct {
    allocator: Allocator,

    host_key: crypto.OpenSSLKey.ED25519KeyPair,
    msquic: *MsQuic.QUIC_API_TABLE,
    registration: MsQuic.HQUIC,
    configuration: MsQuic.HQUIC,
    settings: Settings,

    const Settings = struct {
        only_reply: bool = false,
        target: []const u8 = "",
        target_port: u16 = 0,
    };

    var libp2p_proto_name = "libp2p".*;
    const alpn = MsQuic.QUIC_BUFFER{
        .Length = @sizeOf(@TypeOf(libp2p_proto_name)) - 1,
        .Buffer = @ptrCast([*c]u8, libp2p_proto_name[0..]),
    };

    pub fn init(allocator: Allocator, ping_settings: Settings) !@This() {
        const host_key = try crypto.OpenSSLKey.ED25519KeyPair.new();
        var msquic: *MsQuic.QUIC_API_TABLE = undefined;
        const msquic_ptr = @ptrCast([*c]?*const anyopaque, &msquic);
        if (QuicStatus.isError(MsQuic.MsQuicOpenVersion(MsQuic.QUIC_API_VERSION_2, msquic_ptr))) {
            return error.MsQuicOpenFailed;
        }
        errdefer MsQuic.MsQuicClose(msquic);

        const app_name: [:0]const u8 = "ping-protocol-example";
        const reg_config = MsQuic.QUIC_REGISTRATION_CONFIG{
            .AppName = @ptrCast([*c]const u8, app_name),
            .ExecutionProfile = MsQuic.QUIC_EXECUTION_PROFILE_LOW_LATENCY,
        };
        var registration: MsQuic.HQUIC = undefined;

        if (QuicStatus.isError(msquic.RegistrationOpen.?(&reg_config, &registration))) {
            return error.RegistrationFailed;
        }
        errdefer msquic.RegistrationClose.?(registration);

        // Start configuration
        var configuration: MsQuic.HQUIC = undefined;
        var settings = std.mem.zeroes(MsQuic.QuicSettings);

        settings.IdleTimeoutMs = 5000;
        settings.IsSet.flags.IdleTimeoutMs = true;

        // Configures the server's resumption level to allow for resumption and
        // 0-RTT.
        settings.bitfields.ServerResumptionLevel = MsQuic.QUIC_SERVER_RESUME_AND_ZERORTT;
        settings.IsSet.flags.ServerResumptionLevel = true;

        // Configures the server's settings to allow for the peer to open a single
        // bidirectional stream. By default connections are not configured to allow
        // any streams from the peer.
        settings.PeerBidiStreamCount = 128;
        settings.IsSet.flags.PeerBidiStreamCount = true;

        var cred_config = std.mem.zeroes(MsQuic.QUIC_CREDENTIAL_CONFIG);

        var cred_config_helper = CredentialConfigHelper.init(&cred_config);

        try cred_config_helper.setupCert(host_key);

        if (MsQuic.QuicStatus.isError(msquic.ConfigurationOpen.?(registration, &alpn, 1, &settings, @sizeOf(@TypeOf(settings)), null, &configuration))) {
            return error.ConfigurationFailed;
        }
        errdefer msquic.ConfigurationClose.?(configuration);

        const status = msquic.ConfigurationLoadCredential.?(configuration, cred_config_helper.cred_config);
        if (MsQuic.QuicStatus.isError(status)) {
            std.debug.print("Failed to load credential: {}\n", .{status});
            return error.ConfigurationLoadCredentialFailed;
        }

        return Ping{
            .host_key = host_key,
            .allocator = allocator,
            .msquic = msquic,
            .registration = registration,
            .configuration = configuration,
            .settings = ping_settings,
        };
    }
    pub fn deinit(self: *@This()) void {
        defer MsQuic.MsQuicClose(self.msquic);
        defer self.msquic.RegistrationClose.?(self.registration);
        defer self.msquic.ConfigurationClose.?(self.configuration);
    }

    pub const ConnAndStream = struct {
        conn: MsQuic.HQUIC,
        stream_context: *StreamContext,
    };

    pub fn ping(self: *@This()) !ConnAndStream {
        var conn: MsQuic.HQUIC = undefined;
        if (QuicStatus.isError(self.msquic.ConnectionOpen.?(self.registration, Ping.connectionCallback, self, &conn))) {
            return error.FailedToOpenConn;
        }

        errdefer {
            self.msquic.ConnectionShutdown.?(conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);
        }

        var stream_context = try self.allocator.create(StreamContext);
        stream_context.* = StreamContext.init(self.allocator, self.msquic, true);
        errdefer {
            stream_context.deinit();
            self.allocator.destroy(stream_context);
        }

        var status = self.msquic.StreamOpen.?(
            conn,
            MsQuic.QUIC_STREAM_OPEN_FLAG_NONE,
            StreamContext.streamCallback,
            stream_context,
            &stream_context.handle,
        );

        if (MsQuic.QuicStatus.isError(status)) {
            return error.StreamOpenFailed;
        }

        status = self.msquic.StreamStart.?(stream_context.handle, MsQuic.QUIC_STREAM_START_FLAG_NONE);
        if (MsQuic.QuicStatus.isError(status)) {
            return error.StreamStartFailed;
        }

        try stream_context.startPinging();

        status = self.msquic.ConnectionStart.?(
            conn,
            self.configuration,
            MsQuic.QUIC_ADDRESS_FAMILY_UNSPEC,
            @ptrCast([*c]const u8, self.settings.target),
            self.settings.target_port,
        );

        if (MsQuic.QuicStatus.isError(status)) {
            return error.ConnectionStartFailed;
        }

        return .{ .stream_context = stream_context, .conn = conn };
    }

    fn newListener(self: *@This()) ListenerContext {
        return ListenerContext.init(self.allocator, self.msquic, &self.registration, self);
    }

    const ListenerContext = struct {
        ping: *Ping,
        allocator: Allocator,
        msquic: *MsQuic.QUIC_API_TABLE,
        handle: MsQuic.HQUIC = undefined,
        registration: *MsQuic.HQUIC,

        pub fn init(allocator: Allocator, msquic: *MsQuic.QUIC_API_TABLE, registration: *MsQuic.HQUIC, p: *Ping) @This() {
            const self = ListenerContext{
                .ping = p,
                .allocator = allocator,
                .msquic = msquic,
                .registration = registration,
            };
            return self;
        }
        pub fn deinit(self: *@This()) void {
            self.msquic.ListenerClose.?(self.handle);
        }

        pub fn listen(self: *@This(), addr: []const u8, port: u16) !void {
            var status = self.msquic.ListenerOpen.?(
                self.registration.*,
                ListenerContext.listenerCallback,
                self,
                &self.handle,
            );

            if (QuicStatus.isError(status)) {
                return error.ListenOpenFailed;
            }
            errdefer self.msquic.ListenerClose.?(self.handle);

            var quic_addr = std.mem.zeroes(MsQuic.QUIC_ADDR);
            MsQuic.QuicAddrSetFamily(&quic_addr, MsQuic.QUIC_ADDRESS_FAMILY_UNSPEC);
            MsQuic.QuicAddrSetPort(&quic_addr, port);
            var addr_with_sentinel = try std.mem.concatWithSentinel(self.allocator, u8, &[_][]const u8{addr}, 0);
            defer self.allocator.free(addr_with_sentinel);

            _ = MsQuic.QuicAddr4FromString(@ptrCast([*c]const u8, addr_with_sentinel), &quic_addr);
            status = self.msquic.ListenerStart.?(
                self.handle,
                &alpn,
                1,
                &quic_addr,
            );
            if (QuicStatus.isError(status)) {
                return error.ListenerStartFailed;
            }
        }

        fn listenerCallback(listener: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_LISTENER_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
            _ = listener;
            const self = @ptrCast(*ListenerContext, @alignCast(@alignOf(ListenerContext), self_ptr));
            switch (event.*.Type) {
                MsQuic.QUIC_LISTENER_EVENT_NEW_CONNECTION => {
                    var conn = event.*.unnamed_0.NEW_CONNECTION.Connection;
                    self.msquic.SetCallbackHandler.?(
                        conn,
                        @intToPtr(*anyopaque, @ptrToInt(&Ping.connectionCallback)),
                        self.ping,
                    );
                    if (QuicStatus.isError(self.msquic.ConnectionSetConfiguration.?(conn, self.ping.configuration))) {
                        return QuicStatus.ConnectionRefused;
                    }
                    log.info("New connection", .{});
                },
                MsQuic.QUIC_LISTENER_EVENT_STOP_COMPLETE => {
                    log.info("Listener stopped", .{});
                },
                else => {},
            }

            return QuicStatus.Success;
        }
    };

    const StreamContext = struct {
        allocator: Allocator,
        msquic: *MsQuic.QUIC_API_TABLE,
        handle: MsQuic.HQUIC = undefined,

        state: StreamStateMachine,

        send_ctx_pool: MemoryPool(SendCtx),

        start_time: ?std.time.Instant = null,

        const SendCtx = struct {
            quic_buf: MsQuic.QUIC_BUFFER,
            send_buf: [1024]u8,
        };

        pub fn init(allocator: Allocator, msquic: *MsQuic.QUIC_API_TABLE, is_initiator: bool) @This() {
            return .{
                .state = StreamStateMachine.init(allocator, ([_][]const u8{ping_protocol_id})[0..], is_initiator),
                .allocator = allocator,
                .msquic = msquic,
                .send_ctx_pool = MemoryPool(SendCtx).init(allocator),
            };
        }

        pub fn deinit(self: *@This()) void {
            self.state.deinit();
            self.send_ctx_pool.deinit();
            self.allocator.destroy(self);
        }

        fn startPinging(self: *@This()) !void {
            var in_bufs = [_][]const u8{undefined} ** 0;
            try self.driveMultistream(in_bufs[0..0]);
        }

        fn driveMultistream(self: *@This(), in_bufs: [][]const u8) !void {
            var send_bufs = ([_][]u8{undefined} ** 1024);
            var event_buf = StreamStateMachine.Events{
                .sends = send_bufs[0..],
            };

            var send_ctx = try self.send_ctx_pool.create();
            const events = self.state.processIn(in_bufs, send_ctx.send_buf[0..], event_buf) catch |err| blk: {
                log.debug("err : {any}", .{err});
                break :blk StreamStateMachine.Events{ .sends = &[0][]u8{} };
            };

            var total_send_len: u32 = 0;
            for (events.sends) |send| {
                total_send_len += @intCast(u32, send.len);
            }
            std.debug.print(" len: {}\n", .{events.sends.len});
            std.debug.print("Sends len: {}\n", .{total_send_len});
            send_ctx.quic_buf = MsQuic.QUIC_BUFFER{
                .Length = total_send_len,
                .Buffer = &send_ctx.send_buf,
            };
            std.debug.print("is_initiator: {}\n", .{self.state.is_initiator});
            std.debug.print("Sending: {s}\n", .{send_ctx.send_buf[0..total_send_len]});
            _ = self.msquic.StreamSend.?(
                self.handle,
                &send_ctx.quic_buf,
                1,
                MsQuic.QUIC_SEND_FLAG_NONE,
                send_ctx,
            );
        }

        pub fn pingOnce(self: *@This()) !void {
            self.start_time = std.time.Instant.now() catch {
                @panic("no time");
            };

            // Start ping
            var send_ctx = try self.send_ctx_pool.create();
            std.mem.copy(u8, &send_ctx.send_buf, "HELLO WORLD THIS IS 32 BYTES...!");
            send_ctx.quic_buf = MsQuic.QUIC_BUFFER{
                .Length = @intCast(u32, 32),
                .Buffer = &send_ctx.send_buf,
            };
            log.debug("Sending ping: \n", .{});
            _ = self.msquic.StreamSend.?(
                self.handle,
                &send_ctx.quic_buf,
                1,
                MsQuic.QUIC_SEND_FLAG_NONE,
                send_ctx,
            );
        }

        pub fn close(self: *@This()) !void {
            var send_ctx = try self.send_ctx_pool.create();
            send_ctx.quic_buf = MsQuic.QUIC_BUFFER{
                .Length = @intCast(u32, 0),
                .Buffer = &send_ctx.send_buf,
            };
            std.debug.print("Sending ping: \n", .{});
            _ = self.msquic.StreamSend.?(
                self.handle,
                &send_ctx.quic_buf,
                0,
                MsQuic.QUIC_SEND_FLAG_FIN,
                send_ctx,
            );
        }

        fn handlePingResp(self: *@This()) void {
            if (self.start_time) |start_time| {
                const end = std.time.Instant.now() catch {
                    @panic("no time");
                };
                const dur = end.since(start_time);
                log.info("Ping took: {} us", .{
                    dur / 1000,
                });
                std.debug.print("Ping took: {} us\n", .{
                    dur / 1000,
                });
            }
        }

        fn pong(self: *@This(), bufs: []const MsQuic.QUIC_BUFFER) !MsQuic.QUIC_STATUS {
            var send_ctx = try self.send_ctx_pool.create();

            var bytes_written: usize = 0;
            var upto: usize = 32;
            for (bufs) |qbuf| {
                if (bytes_written == 32) {
                    break;
                }
                if (qbuf.Length < upto) {
                    upto = qbuf.Length;
                }
                std.mem.copy(u8, send_ctx.send_buf[bytes_written..32], qbuf.Buffer[0..upto]);
                bytes_written += upto;
                upto -= qbuf.Length;
            }
            if (bytes_written != 32) {
                log.debug("!!! aborting stream!!", .{});
                return self.msquic.StreamShutdown.?(self.handle, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT, 0);
            }

            send_ctx.quic_buf = MsQuic.QUIC_BUFFER{
                .Length = @intCast(u32, 32),
                .Buffer = &send_ctx.send_buf,
            };

            _ = self.msquic.StreamSend.?(
                self.handle,
                &send_ctx.quic_buf,
                1,
                MsQuic.QUIC_SEND_FLAG_NONE,
                send_ctx,
            );
            return QuicStatus.Success;
        }

        fn streamCallback(stream: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
            log.info("stream event: from={any} {}\n", .{ stream, event.*.Type });
            const self = @ptrCast(*StreamContext, @alignCast(@alignOf(StreamContext), self_ptr));

            switch (event.*.Type) {
                MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                    switch (self.state.state) {
                        .using_protocol => |protocol| {
                            if (std.mem.eql(u8, protocol, ping_protocol_id)) {
                                if (self.state.is_initiator) {
                                    self.handlePingResp();
                                } else {
                                    const buffers = event.*.unnamed_0.RECEIVE;
                                    return self.pong(buffers.Buffers[0..buffers.BufferCount]) catch {
                                        return QuicStatus.OutOfMemory;
                                    };
                                }
                            }
                        },
                        .negotiating_multistream => {
                            const buffers = event.*.unnamed_0.RECEIVE;
                            var in_bufs = [_][]const u8{undefined} ** 32;

                            for (buffers.Buffers[0..buffers.BufferCount]) |buf, i| {
                                in_bufs[i] = buf.Buffer[0..buf.Length];
                            }
                            self.driveMultistream(&in_bufs) catch {
                                return QuicStatus.OutOfMemory;
                            };

                            switch (self.state.state) {
                                .using_protocol => |protocol| {
                                    if (std.mem.eql(u8, protocol, ping_protocol_id)) {
                                        if (self.state.is_initiator) {
                                            self.pingOnce() catch {
                                                return QuicStatus.OutOfMemory;
                                            };
                                        }
                                    }
                                },
                                else => {},
                            }
                        },
                    }
                },

                MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                    if (event.*.unnamed_0.SEND_COMPLETE.ClientContext) |ctx| {
                        const send_ctx = @ptrCast(*SendCtx, @alignCast(@alignOf(SendCtx), ctx));
                        self.send_ctx_pool.destroy(send_ctx);
                    }
                },
                MsQuic.QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE => {
                    log.debug("QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE", .{});
                },

                MsQuic.QUIC_STREAM_EVENT_PEER_SEND_ABORTED, MsQuic.QUIC_STREAM_EVENT_PEER_RECEIVE_ABORTED => {
                    log.info("Peer aborted stream\n", .{});
                    _ = self.msquic.StreamShutdown.?(stream, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT, 0);
                },

                MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                    self.deinit();
                },

                else => {},
            }

            return 0;
        }
    };

    fn connectionCallback(connection: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
        const self = @ptrCast(*Ping, @alignCast(@alignOf(Ping), self_ptr));
        log.info("Connection event: from={any} {}\n", .{ connection, event.*.Type });

        switch (event.*.Type) {
            MsQuic.QUIC_CONNECTION_EVENT_CONNECTED => {
                log.info("Connected", .{});
            },
            MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => {
                if (!event.*.unnamed_0.SHUTDOWN_COMPLETE.AppCloseInProgress) {
                    self.msquic.ConnectionClose.?(connection);
                }
            },
            MsQuic.QUIC_CONNECTION_EVENT_PEER_STREAM_STARTED => {
                var stream_context = self.allocator.create(StreamContext) catch {
                    return QuicStatus.OutOfMemory;
                };
                stream_context.* = StreamContext.init(self.allocator, self.msquic, false);
                stream_context.handle = event.*.unnamed_0.PEER_STREAM_STARTED.Stream;

                self.msquic.SetCallbackHandler.?(
                    stream_context.handle,
                    @intToPtr(*anyopaque, @ptrToInt(&StreamContext.streamCallback)),
                    stream_context,
                );
            },
            else => {},
        }

        return 0;
    }
};

pub fn main() anyerror!void {
    const allocator = std.heap.c_allocator;
    std.debug.print("\n", .{});
    std.debug.print("Crypto is: {any}\n", .{@typeInfo(@TypeOf(crypto))});
    std.debug.print("Starting ping\n", .{});
    var client = try Ping.init(allocator, .{
        .target = "127.0.0.1",
        .target_port = 9195,
    });
    defer client.deinit();

    try client.ping();
    std.debug.print("waiting ping\n", .{});
    std.time.sleep(10 * std.time.ns_per_s);
    std.debug.print("done waiting\n", .{});
}

test {
    _ = @import("libp2p");
}

test "ping go" {
    std.testing.log_level = .debug;

    const allocator = std.testing.allocator;
    std.debug.print("\n", .{});
    std.debug.print("Crypto is: {any}\n", .{@typeInfo(@TypeOf(crypto))});
    std.debug.print("Starting ping\n", .{});
    var client = try Ping.init(allocator, .{
        .target = "127.0.0.1",
        .target_port = 9195,
    });
    defer client.deinit();

    var ping_stream_and_conn = try client.ping();
    var ping_stream = ping_stream_and_conn.stream_context;
    var ping_conn = ping_stream_and_conn.conn;
    defer client.msquic.ConnectionShutdown.?(ping_conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);

    var times: u8 = 100;
    while (times > 0) : (times -= 1) {
        std.time.sleep(100 * std.time.ns_per_ms);
        try ping_stream.pingOnce();
    }
    try ping_stream.close();
    log.info("Shutting down", .{});
}

test "ping with server" {
    std.testing.log_level = .debug;

    const allocator = std.testing.allocator;
    var server = try Ping.init(allocator, .{ .only_reply = true });
    defer server.deinit();
    var listener = server.newListener();
    try listener.listen("127.0.0.1", 9197);
    defer listener.deinit();

    std.debug.print("\n", .{});
    std.debug.print("Crypto is: {any}\n", .{@typeInfo(@TypeOf(crypto))});
    std.debug.print("Starting ping\n", .{});
    var client = try Ping.init(allocator, .{
        .target = "127.0.0.1",
        .target_port = 9197,
    });
    defer client.deinit();

    var ping_stream_and_conn = try client.ping();
    var ping_stream = ping_stream_and_conn.stream_context;
    var ping_conn = ping_stream_and_conn.conn;
    defer client.msquic.ConnectionShutdown.?(ping_conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);

    var times: u8 = 100;
    while (times > 0) : (times -= 1) {
        std.time.sleep(100 * std.time.ns_per_ms);
        try ping_stream.pingOnce();
    }
    try ping_stream.close();
    log.info("Shutting down", .{});
}
