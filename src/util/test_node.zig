const std = @import("std");
const os = std.os;
const okredis = @import("okredis");
const MsQuic = @import("msquic");
const libp2p = @import("libp2p");
const multiaddr = libp2p.multiaddr;
const MemoryPool = libp2p.util.MemoryPool;
const crypto = libp2p.crypto;
const CredentialConfigHelper = @import("libp2p-msquic").crypto.CredentialConfigHelper;
const getPeerPubKey = @import("libp2p-msquic").crypto.getPeerPubKey;
const log = std.log;
const MSS = libp2p.protocols.MSS;

const Allocator = std.mem.Allocator;
const QuicStatus = MsQuic.QuicStatus;
const ArrayList = std.ArrayList;
const Instant = std.time.Instant;
const Semaphore = std.Thread.Semaphore;

const ifaddrs = @cImport({
    @cInclude("ifaddrs.h");
});

const stdout = std.io.getStdOut();

pub fn TestNode(
    comptime StreamContext: type,
    comptime InitStreamContextFn: fn (allocator: Allocator, msquic: *MsQuic.QUIC_API_TABLE, stream: MsQuic.HQUIC, protocol: []const u8, is_initiator: bool, quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER)) error{OutOfMemory}!StreamContext,
) type {
    return struct {
        const Self = @This();

        allocator: Allocator,

        host_key: crypto.OpenSSLKey.ED25519KeyPair,
        msquic: *MsQuic.QUIC_API_TABLE,
        registration: MsQuic.HQUIC,
        configuration: MsQuic.HQUIC,
        quic_buffer_pool: MemoryPool(MsQuic.QUIC_BUFFER),

        supported_protos: [][]const u8,

        const DialSettings = struct {
            target: [:0]const u8 = "",
            target_port: u16 = 0,
            proto: []const u8,
        };

        pub fn init(allocator: Allocator, supported_protos: [][]const u8) !@This() {
            const host_key = try crypto.OpenSSLKey.ED25519KeyPair.new();
            var msquic: *MsQuic.QUIC_API_TABLE = undefined;
            const msquic_ptr = @ptrCast([*c]?*const anyopaque, &msquic);
            if (QuicStatus.isError(MsQuic.MsQuicOpenVersion(MsQuic.QUIC_API_VERSION_2, msquic_ptr))) {
                return error.MsQuicOpenFailed;
            }
            errdefer MsQuic.MsQuicClose(msquic);

            const app_name: [:0]const u8 = "test_node";
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

            if (MsQuic.QuicStatus.isError(msquic.ConfigurationOpen.?(registration, &libp2p.alpn, 1, &settings, @sizeOf(@TypeOf(settings)), null, &configuration))) {
                return error.ConfigurationFailed;
            }
            errdefer msquic.ConfigurationClose.?(configuration);

            const status = msquic.ConfigurationLoadCredential.?(configuration, cred_config_helper.cred_config);
            if (MsQuic.QuicStatus.isError(status)) {
                std.debug.print("Failed to load credential: {}\n", .{status});
                return error.ConfigurationLoadCredentialFailed;
            }

            return Self{
                .host_key = host_key,
                .allocator = allocator,
                .msquic = msquic,
                .registration = registration,
                .configuration = configuration,
                .quic_buffer_pool = MemoryPool(MsQuic.QUIC_BUFFER).init(allocator),
                .supported_protos = supported_protos,
            };
        }
        pub fn deinit(self: *@This()) void {
            defer MsQuic.MsQuicClose(self.msquic);
            defer self.msquic.RegistrationClose.?(self.registration);
            defer self.msquic.ConfigurationClose.?(self.configuration);
            defer self.quic_buffer_pool.deinit();
        }

        pub const ConnAndStream = struct {
            conn: MsQuic.HQUIC,
            stream_context: *StreamContext,
        };

        pub fn dialAndStartStream(self: *@This(), dial_settings: DialSettings) !ConnAndStream {
            var conn: MsQuic.HQUIC = undefined;
            if (QuicStatus.isError(self.msquic.ConnectionOpen.?(self.registration, Self.outboundConnectionCallback, self, &conn))) {
                return error.FailedToOpenConn;
            }

            errdefer self.msquic.ConnectionShutdown.?(conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);

            var stream_context = try self.allocator.create(StreamContext);
            stream_context.* = try InitStreamContextFn(self.allocator, self.msquic, undefined, dial_settings.proto, true, &self.quic_buffer_pool);
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

            try stream_context.ping.initiate(stream_context.handle);

            var quic_addr_to_dial: MsQuic.QUIC_ADDR = undefined;
            var res = MsQuic.QuicAddrFromString(dial_settings.target.ptr, dial_settings.target_port, &quic_addr_to_dial);
            if (res != 1) {
                std.debug.panic("Failed to parse address: {}", .{res});
            }

            // We set the remote address here instead of in connection start so that we don't set the IP address as SNI.
            const set_param_result = self.msquic.SetParam.?(
                conn,
                MsQuic.QUIC_PARAM_CONN_REMOTE_ADDRESS,
                @sizeOf(MsQuic.QUIC_ADDR),
                &quic_addr_to_dial,
            );
            if (set_param_result != 0) {
                log.err("Failed to set remote address param: {}", .{set_param_result});
                unreachable;
            }

            status = self.msquic.ConnectionStart.?(
                conn,
                self.configuration,
                MsQuic.QUIC_ADDRESS_FAMILY_UNSPEC,
                null,
                dial_settings.target_port,
            );

            if (MsQuic.QuicStatus.isError(status)) {
                return error.ConnectionStartFailed;
            }
            std.log.debug("Connection status: {any}", .{status});

            return .{ .stream_context = stream_context, .conn = conn };
        }

        fn newListener(self: *@This()) ListenerContext {
            return ListenerContext.init(self.allocator, self.msquic, &self.registration, self, &self.quic_buffer_pool);
        }

        const ListenerContext = struct {
            app: *Self,
            port: ?u16 = null,
            allocator: Allocator,
            msquic: *MsQuic.QUIC_API_TABLE,
            handle: MsQuic.HQUIC = undefined,
            listening_addrs: std.ArrayList([]const u8),
            registration: *MsQuic.HQUIC,
            quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),

            pub fn init(allocator: Allocator, msquic: *MsQuic.QUIC_API_TABLE, registration: *MsQuic.HQUIC, app: *Self, quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER)) @This() {
                const self = ListenerContext{
                    .app = app,
                    .allocator = allocator,
                    .msquic = msquic,
                    .registration = registration,
                    .quic_buffer_pool = quic_buffer_pool,
                    .listening_addrs = std.ArrayList([]const u8).init(allocator),
                };
                return self;
            }
            pub fn deinit(self: *@This()) void {
                for (self.listening_addrs.items) |addr| {
                    self.allocator.free(addr);
                }
                self.listening_addrs.deinit();
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
                    &libp2p.alpn,
                    1,
                    &quic_addr,
                );
                if (QuicStatus.isError(status)) {
                    return error.ListenerStartFailed;
                }

                var s: u32 = @sizeOf(MsQuic.QUIC_ADDR);
                _ = self.msquic.GetParam.?(
                    self.handle,
                    MsQuic.QUIC_PARAM_LISTENER_LOCAL_ADDRESS,
                    &s,
                    &quic_addr,
                );
                self.port = MsQuic.QuicAddrGetPort(&quic_addr);
                var addr_str: MsQuic.QUIC_ADDR_STR = std.mem.zeroes(MsQuic.QUIC_ADDR_STR);

                _ = MsQuic.QuicAddrToString(&quic_addr, &addr_str);
                const port_sep = std.mem.lastIndexOf(u8, &addr_str.Address, ":") orelse addr_str.Address.len;
                if (std.mem.eql(u8, addr_str.Address[0..port_sep], "0.0.0.0")) {
                    var res: [*c]ifaddrs.struct_ifaddrs = undefined;
                    if (ifaddrs.getifaddrs(&res) != 0) {
                        std.log.info("Failed to get ifaddrs", .{});
                    }
                    defer ifaddrs.freeifaddrs(res);

                    var cursor = res;
                    while (true) {
                        if (cursor == null) break;
                        var sa = @ptrCast(*align(4) std.c.sockaddr, @alignCast(4, cursor.*.ifa_addr.?));
                        if (sa.family == std.os.AF.INET) {
                            const listen_addr = try std.fmt.allocPrint(self.allocator, "{}", .{std.net.Address.initPosix(sa)});
                            const listen_addr_port_sep = std.mem.lastIndexOf(u8, listen_addr, ":") orelse listen_addr.len;
                            try self.listening_addrs.append(listen_addr[0..listen_addr_port_sep]);
                        }
                        cursor = cursor.*.ifa_next;
                    }
                } else {
                    const listen_addr = try std.fmt.allocPrint(self.allocator, "{s}", .{addr_str.Address[0..port_sep]});
                    try self.listening_addrs.append(listen_addr);
                }

                log.info("Listening on {s} {s}  ", .{
                    addr_str.Address,
                    self.listening_addrs.items,
                });
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
                            @intToPtr(*anyopaque, @ptrToInt(&ListenerContext.inboundConnectionCallback)),
                            self,
                        );
                        if (QuicStatus.isError(self.msquic.ConnectionSetConfiguration.?(conn, self.app.configuration))) {
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

            fn inboundConnectionCallback(connection: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
                const self = @ptrCast(*ListenerContext, @alignCast(@alignOf(ListenerContext), self_ptr));
                log.debug("inbound connection event: from={any} {}\n", .{ connection, event.*.Type });

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
                        var stream_context = self.allocator.create(InboundStreamContext) catch {
                            return QuicStatus.OutOfMemory;
                        };
                        stream_context.* = InboundStreamContext.init(self.allocator, self.msquic, self.quic_buffer_pool);
                        const stream_handle = event.*.unnamed_0.PEER_STREAM_STARTED.Stream;

                        self.msquic.SetCallbackHandler.?(
                            stream_handle,
                            @intToPtr(*anyopaque, @ptrToInt(&InboundStreamContext.handleStreamEvent)),
                            stream_context,
                        );
                        stream_context.mss.initiate(stream_handle, stream_context) catch {
                            return QuicStatus.OutOfMemory;
                        };
                    },
                    MsQuic.QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED => {
                        // The peer has sent a certificate.
                        var peer_key = getPeerPubKey(self.allocator, event.*.unnamed_0.PEER_CERTIFICATE_RECEIVED.Certificate) catch |err| {
                            std.debug.print("conn={any} Failed to get peer certificate: {any}\n", .{ connection, err });
                            self.msquic.ConnectionShutdown.?(connection, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT, 0);
                            return MsQuic.QuicStatus.InternalError;
                        };
                        defer peer_key.deinit(self.allocator);
                    },
                    else => {},
                }

                return 0;
            }
        };

        const InboundStreamContext = struct {
            const MultistreamSelect = MSS.MultistreamSelect(*InboundStreamContext, handleMSSEvent);
            state: State = .negotiating_multistream,
            mss: MultistreamSelect,
            allocator: Allocator,
            msquic: *MsQuic.QUIC_API_TABLE,
            quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),
            const State = enum {
                ready,
                negotiating_multistream,
                failed_multistream,
            };

            pub fn init(allocator: Allocator, msquic: *MsQuic.QUIC_API_TABLE, quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER), supported_protos: [][]const u8) @This() {
                return @This(){
                    .allocator = allocator,
                    .msquic = msquic,
                    .mss = MultistreamSelect.init(allocator, msquic, supported_protos, false, quic_buffer_pool),
                    .quic_buffer_pool = quic_buffer_pool,
                };
            }

            pub fn deinit(self: *@This()) void {
                self.mss.deinit();
            }

            pub fn handleMSSEvent(self: *InboundStreamContext, stream: MsQuic.HQUIC, mssEvent: MSS.MultistreamEvent) c_uint {
                switch (mssEvent) {
                    .optimistically_negotiated => {
                        // Shouldn't happen on inbound streams
                        unreachable;
                    },
                    .negotiated => |proto| {
                        self.state = .ready;
                        var app_stream_context = self.allocator.create(StreamContext) catch {
                            return QuicStatus.OutOfMemory;
                        };

                        // Transfering ownership. Clean ourselves up.
                        defer self.allocator.destroy(self);
                        defer self.deinit();

                        app_stream_context.* = InitStreamContextFn(self.allocator, self.msquic, stream, proto, false, self.quic_buffer_pool);

                        self.msquic.SetCallbackHandler.?(
                            stream,
                            @intToPtr(*anyopaque, @ptrToInt(&StreamContext.streamCallback)),
                            app_stream_context,
                        );

                        return QuicStatus.Success;
                    },
                    .failed => |err| {
                        self.state = .failed_multistream;
                        log.err("Failed to negotiate proto: {any}", .{err});
                    },
                }

                return QuicStatus.Success;
            }

            fn handleStreamEvent(stream: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
                const self = @ptrCast(*InboundStreamContext, @alignCast(@alignOf(InboundStreamContext), self_ptr));
                std.debug.assert(self.state == .negotiating_multistream);
                return self.mss.handleEvent(stream, event);
            }
        };

        fn outboundConnectionCallback(connection: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
            const self = @ptrCast(*Self, @alignCast(@alignOf(Self), self_ptr));
            log.debug("Connection event: from={any} {}\n", .{ connection, event.*.Type });

            switch (event.*.Type) {
                MsQuic.QUIC_CONNECTION_EVENT_CONNECTED => {
                    log.debug("Connected", .{});
                },
                MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => {
                    if (!event.*.unnamed_0.SHUTDOWN_COMPLETE.AppCloseInProgress) {
                        self.msquic.ConnectionClose.?(connection);
                    }
                },
                MsQuic.QUIC_CONNECTION_EVENT_PEER_STREAM_STARTED => {
                    var stream_context = self.allocator.create(InboundStreamContext) catch {
                        return QuicStatus.OutOfMemory;
                    };
                    stream_context.* = InboundStreamContext.init(self.allocator, self.msquic, &self.quic_buffer_pool, self.supported_protos);
                    const stream_handle = event.*.unnamed_0.PEER_STREAM_STARTED.Stream;

                    self.msquic.SetCallbackHandler.?(
                        stream_handle,
                        @intToPtr(*anyopaque, @ptrToInt(&InboundStreamContext.handleStreamEvent)),
                        stream_context,
                    );
                    stream_context.mss.initiate(stream_handle, stream_context) catch {
                        return QuicStatus.OutOfMemory;
                    };
                },

                MsQuic.QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED => {
                    // The peer has sent a certificate.
                    var peer_key = getPeerPubKey(self.allocator, event.*.unnamed_0.PEER_CERTIFICATE_RECEIVED.Certificate) catch |err| {
                        std.debug.print("conn={any} Failed to get peer certificate: {any}\n", .{ connection, err });
                        self.msquic.ConnectionShutdown.?(connection, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT, 0);
                        return MsQuic.QuicStatus.InternalError;
                    };
                    defer peer_key.deinit(self.allocator);
                },
                else => {},
            }

            return 0;
        }
    };
}

fn runDialer(allocator: Allocator, comptime Node: anytype, supported_protos: [][]const u8, proto_to_dial: []const u8, listener_multiaddr: *const []const u8, addr_semaphore: *Semaphore) !void {
    var done_semaphore = Semaphore{};
    addr_semaphore.wait();

    const ma = try multiaddr.decodeMultiaddr(allocator, listener_multiaddr.*);
    defer ma.deinit(allocator);

    var client = try Node.init(allocator, supported_protos);
    defer client.deinit();

    var stream_and_conn = try client.dialAndStartStream(.{
        .target = ma.target,
        .target_port = ma.target_port,
        .proto = proto_to_dial,
    });
    defer client.msquic.ConnectionShutdown.?(stream_and_conn.conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);
    // Wait for done
    done_semaphore.wait();
    log.info("Shutting down", .{});
}

fn runListener(allocator: Allocator, comptime Node: anytype, supported_protos: [][]const u8, ip: [:0]const u8, out_listener_multiaddr: *[]const u8, addr_semaphore: *Semaphore, shutdown_semaphore: *Semaphore) !void {
    var server = try Node.init(allocator, supported_protos);
    defer server.deinit();
    var listener = server.newListener();
    try listener.listen(ip, 0);
    defer listener.deinit();
    const serverPeerID = try (try server.host_key.toPubKey().toPeerID()).Ed25519.toLegacyString(allocator);
    defer allocator.free(serverPeerID);

    var listener_multiaddr_string: ?[]const u8 = null;
    for (listener.listening_addrs.items) |addr| {
        if (!std.mem.eql(u8, addr, "127.0.0.1")) {
            listener_multiaddr_string = try std.fmt.allocPrint(allocator, "/ip4/{s}/udp/{}/quic-v1/p2p/{s}", .{ addr, listener.port.?, serverPeerID });
            break;
        }
    }
    std.debug.assert(listener_multiaddr_string != null);
    defer allocator.free(listener_multiaddr_string.?);

    out_listener_multiaddr.ptr = listener_multiaddr_string.?.ptr;
    out_listener_multiaddr.len = listener_multiaddr_string.?.len;

    addr_semaphore.post();
    shutdown_semaphore.wait();
}

test "Run test node with ping" {
    std.testing.log_level = .info;

    const PingStreamContext = struct {
        fn init(allocator: Allocator, msquic: *MsQuic.QUIC_API_TABLE, stream: MsQuic.HQUIC, protocol: []const u8, is_initiator: bool, quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER)) error{OutOfMemory}!PingStreamContext {
            _ = allocator;
            _ = msquic;
            _ = stream;
            _ = protocol;
            _ = is_initiator;
            _ = quic_buffer_pool;
            return .{};
        }
    };
    const Node = TestNode(PingStreamContext, PingStreamContext.init);

    const allocator = std.testing.allocator;

    var shutdown_listener_sem: Semaphore = .{};
    var listener_multiaddr_semaphore: Semaphore = .{};
    var listener_multiaddr: []const u8 = undefined;

    var listener_thread = try std.Thread.spawn(.{}, runListener, .{ allocator, "0.0.0.0", &listener_multiaddr, &listener_multiaddr_semaphore, &shutdown_listener_sem });
    try runDialer(allocator, Node, &listener_multiaddr, &listener_multiaddr_semaphore);

    shutdown_listener_sem.post();
    listener_thread.join();
}
