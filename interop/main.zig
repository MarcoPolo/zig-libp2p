const std = @import("std");
const os = std.os;
const okredis = @import("./okredis/src/okredis.zig");
const MsQuic = @import("msquic");
const libp2p = @import("libp2p");
const multiaddr = libp2p.multiaddr;
const MemoryPool = libp2p.util.MemoryPool;
const crypto = libp2p.crypto;
const CredentialConfigHelper = @import("libp2p-msquic").crypto.CredentialConfigHelper;
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
        target: [:0]const u8 = "",
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

        const app_name: [:0]const u8 = "interop";
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
        std.log.debug("Connection status: {any}", .{status});

        return .{ .stream_context = stream_context, .conn = conn };
    }

    fn newListener(self: *@This()) ListenerContext {
        return ListenerContext.init(self.allocator, self.msquic, &self.registration, self);
    }

    const ListenerContext = struct {
        ping: *Ping,
        port: ?u16 = null,
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

        pub fn listen(self: *@This(), addr: [:0]const u8, port: u16) !void {
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

            std.log.debug("size is: {}", .{@sizeOf(MsQuic.QUIC_ADDR)});
            // var buf = try self.allocator.alloc(u8, 100);
            var s: u32 = @sizeOf(MsQuic.QUIC_ADDR);
            _ = self.msquic.GetParam.?(
                self.handle,
                MsQuic.QUIC_PARAM_LISTENER_LOCAL_ADDRESS,
                &s,
                &quic_addr,
            );
            std.log.debug("Port is: {}", .{MsQuic.QuicAddrGetPort(&quic_addr)});
            self.port = MsQuic.QuicAddrGetPort(&quic_addr);
        }

        fn listenerCallback(listener: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_LISTENER_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
            _ = listener;
            const self = @ptrCast(*ListenerContext, @alignCast(@alignOf(ListenerContext), self_ptr));

            log.debug("Listener event: {any}", .{event.*.Type});
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
            const self = @ptrCast(*StreamContext, @alignCast(@alignOf(StreamContext), self_ptr));
            log.info("stream event: from={any} {}\n", .{ stream, event.*.Type });

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

                            var i: u32 = 0;
                            for (buffers.Buffers[0..buffers.BufferCount]) |buf| {
                                in_bufs[i] = buf.Buffer[0..buf.Length];
                                i += 1;
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
            MsQuic.QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED => {
                // The peer has sent a certificate.
                var peer_cert_opaq = event.*.unnamed_0.PEER_CERTIFICATE_RECEIVED.Certificate orelse {
                    std.debug.print("conn={any} Peer certificate is null\n", .{connection});
                    return MsQuic.QuicStatus.InternalError;
                };

                var peer_cert_buf = @ptrCast(*MsQuic.QUIC_BUFFER, @alignCast(@alignOf(MsQuic.QUIC_BUFFER), peer_cert_opaq));
                var peer_cert = peer_cert_buf.Buffer[0..peer_cert_buf.Length];
                std.debug.print("conn={any} Peer certificate has len={}\n", .{ connection, peer_cert.len });
                var peer_x509 = crypto.X509.initFromDer(peer_cert) catch |err| {
                    std.debug.print("conn={any} Failed to parse peer certificate: {any}\n", .{ connection, err });
                    return MsQuic.QuicStatus.InternalError;
                };
                defer peer_x509.deinit();

                // var peer_pub_key = crypto.Libp2pTLSCert.verify(peer_x509, self.transport.allocator) catch |err| {
                //     std.debug.print("Failed to validate conn, closing: {any}\n", .{err});
                //     self.transport.msquic.getQuicAPI().ConnectionShutdown.?(connection, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT, 0);
                //     return MsQuic.QuicStatus.InternalError;
                // };
            },
            else => {},
        }

        return 0;
    }
};

fn runDialer(allocator: Allocator, redis_client: *okredis.Client) !void {
    const FixBuf = okredis.types.FixBuf;
    std.log.debug("waiting", .{});
    const listenerAddrResp = try redis_client.send([2]FixBuf(128), .{ "BLPOP", "listenerAddr", "0" });
    const listenerAddr = listenerAddrResp[1].toSlice();
    const ma = try multiaddr.decodeMultiaddr(allocator, listenerAddr);
    defer ma.deinit(allocator);

    std.log.debug("ma ip {s}:{}", .{ ma.target, ma.port });
    std.log.debug("ma ip {any}", .{ma.target});
    std.log.debug("ma ip {any}", .{"127.0.0.1"});
    std.log.debug("ma {any}", .{ma});

    // TODO this has a weird panic when we fail to connect. We should have better errors

    var client = try Ping.init(allocator, .{
        // .target = "localhost",
        .target = ma.target,
        .target_port = ma.port,
    });
    defer client.deinit();

    var ping_stream_and_conn = try client.ping();
    var ping_stream = ping_stream_and_conn.stream_context;
    var ping_conn = ping_stream_and_conn.conn;
    defer client.msquic.ConnectionShutdown.?(ping_conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);
    defer std.log.debug("shut down", .{});

    var times: u8 = 1;
    while (times > 0) : (times -= 1) {
        std.time.sleep(100 * std.time.ns_per_ms);
        try ping_stream.pingOnce();

        var w = std.io.getStdOut().writer();
        var handshake_plus_one_rtt: f32 = 0;
        var ping_rtt: f32 = 0;
        w.print("{{\"handshakePlusOneRTTMillis\":{},\"pingRTTMilllis\":{}}}", .{ handshake_plus_one_rtt, ping_rtt }) catch unreachable;
    }
    try ping_stream.close();
    log.info("Shutting down", .{});
}

fn runListener(allocator: Allocator, redis_client: *okredis.Client, ip: [:0]const u8, timeout_secs: usize) !void {
    var server = try Ping.init(allocator, .{ .only_reply = true });
    defer server.deinit();
    var listener = server.newListener();
    try listener.listen(ip, 0);
    defer listener.deinit();
    const serverPeerID = try (try server.host_key.toPubKey().toPeerID()).Ed25519.toLegacyString(allocator);
    defer allocator.free(serverPeerID);
    std.log.debug("server key = {s}", .{serverPeerID});
    const listener_multiaddr_string = try std.fmt.allocPrint(allocator, "/ip4/{s}/udp/{}/quic-v1/p2p/{s}", .{ ip, listener.port.?, serverPeerID });
    defer allocator.free(listener_multiaddr_string);
    std.log.debug("multiaddr = {s} going to push", .{listener_multiaddr_string});
    try redis_client.send(void, .{ "RPUSH", "listenerAddr", listener_multiaddr_string });
    std.debug.print("pushed multiaddr = {s}\n", .{listener_multiaddr_string});

    std.time.sleep(timeout_secs * std.time.ns_per_s);
}

pub fn main() anyerror!void {
    // const allocator = std.testing.allocator;
    const allocator = std.heap.c_allocator;
    // std.debug.print("\n", .{});
    // std.debug.print("Crypto is: {any}\n", .{@typeInfo(@TypeOf(crypto))});
    // std.debug.print("Starting ping\n", .{});
    // var client = try Ping.init(allocator, .{
    //     .target = "127.0.0.1",
    //     .target_port = 9195,
    // });
    // defer client.deinit();

    // try client.ping();
    // std.debug.print("waiting ping\n", .{});
    // std.time.sleep(10 * std.time.ns_per_s);

    const redisAddrEnv = std.os.getenv("redis_addr") orelse "redis:6379";

    const timeout_secs = std.fmt.parseInt(usize, std.os.getenv("test_timeout_seconds") orelse "180", 10) catch unreachable;

    const ip: [:0]const u8 = try std.fmt.allocPrintZ(allocator, "{s}", .{std.os.getenv("ip") orelse "0.0.0.0"});
    defer allocator.free(ip);

    const is_dialer = std.mem.eql(u8, std.os.getenv("is_dialer") orelse "", "true");

    // TODO accept from env
    var redis_parts = std.mem.split(u8, redisAddrEnv, ":");
    const redis_host = redis_parts.next().?;
    var redis_port = try std.fmt.parseInt(u16, redis_parts.next().?, 10);

    const redis_conn = try std.net.tcpConnectToHost(allocator, redis_host, redis_port);
    // var redis_conn = try std.net.tcpConnectToAddress(redis_addr);
    var redis_client: okredis.Client = undefined;
    try redis_client.init(redis_conn);
    defer redis_client.close();

    if (is_dialer) {
        try runDialer(allocator, &redis_client);
    } else {
        try runListener(allocator, &redis_client, ip, timeout_secs);
    }
    // std.debug.print("done waiting\n", .{});
}

test {
    std.testing.log_level = .debug;
    const allocator = std.testing.allocator;

    const timeout_secs: usize = 3;

    const redis_conn = try std.net.tcpConnectToHost(allocator, "localhost", 6379);
    var redis_client: okredis.Client = undefined;
    try redis_client.init(redis_conn);
    defer redis_client.close();

    try redis_client.send(void, .{ "DEL", "listenerAddr" });

    const redis_conn2 = try std.net.tcpConnectToHost(allocator, "localhost", 6379);
    var redis_client2: okredis.Client = undefined;
    try redis_client2.init(redis_conn2);
    defer redis_client2.close();

    var listener_thread = try std.Thread.spawn(.{}, runListener, .{ allocator, &redis_client, "127.0.0.1", timeout_secs });
    var dialer_thread = try std.Thread.spawn(.{}, runDialer, .{ allocator, &redis_client2 });
    listener_thread.detach();
    dialer_thread.join();
    std.time.sleep(timeout_secs * std.time.ns_per_s);
}
