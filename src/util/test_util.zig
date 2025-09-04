const std = @import("std");
const os = std.os;
const okredis = @import("okredis");
const MsQuic = @import("msquic");
const libp2p = @import("../libp2p.zig");
const multiaddr = libp2p.multiaddr;
const MemoryPool = libp2p.util.MemoryPool;
const crypto = libp2p.crypto;
const CredentialConfigHelper = @import("libp2p-msquic").crypto.CredentialConfigHelper;
const getPeerPubKey = @import("libp2p-msquic").crypto.getPeerPubKey;
const log = std.log;
const mss = libp2p.protocols.mss;

const Allocator = std.mem.Allocator;
const QuicStatus = MsQuic.QuicStatus;
const ArrayList = std.ArrayList;
const Instant = std.time.Instant;
const Semaphore = std.Thread.Semaphore;
const Thread = std.Thread;

const ifaddrs = @cImport({
    @cInclude("ifaddrs.h");
});

const stdout = std.io.getStdOut();

pub fn TestEnv(comptime Meta: type) type {
    return struct {
        done_semaphore: Semaphore = Semaphore{},
        meta: Meta = undefined,
    };
}

pub fn TestNode(
    comptime StreamContext: type,
    comptime TestEnvMeta: type,
    comptime InitStreamContextFn: fn (
        allocator: Allocator,
        msquic: *MsQuic.QUIC_API_TABLE,
        stream: MsQuic.HQUIC,
        is_initiator: bool,
        quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),
        test_env: *TestEnv(TestEnvMeta),
    ) error{OutOfMemory}!StreamContext,
) type {
    return struct {
        const Self = @This();

        allocator: Allocator,

        test_env: TestEnv(TestEnvMeta) = .{},

        host_key: crypto.OpenSSLKey.ED25519KeyPair,
        msquic: *MsQuic.QUIC_API_TABLE,
        registration: MsQuic.HQUIC,
        configuration: MsQuic.HQUIC,
        quic_buffer_pool: MemoryPool(MsQuic.QUIC_BUFFER),

        no_open_conns: NoOpenConns = .{},

        const NoOpenConns = struct {
            m: Thread.Mutex = .{},
            c: Thread.Condition = .{},
            active_conns: usize = 0,

            fn incActiveConns(self: *NoOpenConns) void {
                self.m.lock();
                defer self.m.unlock();

                self.active_conns += 1;
                log.debug("active conns={}", .{self.active_conns});
            }
            fn decActiveConns(self: *NoOpenConns) void {
                self.m.lock();
                defer self.m.unlock();

                self.active_conns -= 1;
                if (self.active_conns == 0) {
                    self.c.signal();
                }
                log.debug("active conns={}", .{self.active_conns});
            }

            pub fn wait(self: *NoOpenConns) void {
                self.m.lock();
                defer self.m.unlock();

                while (self.active_conns != 0) {
                    self.c.wait(&self.m);
                }
            }
        };

        const DialSettings = struct {
            target: [:0]const u8 = "",
            target_port: u16 = 0,
            proto: []const u8,
        };

        pub fn init(allocator: Allocator) !@This() {
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

            settings.IdleTimeoutMs = 10000;
            settings.IsSet.flags.IdleTimeoutMs = true;

            // Configures the server's resumption level to allow for resumption and
            // 0-RTT.
            settings.bitfields.ServerResumptionLevel = MsQuic.QUIC_SERVER_RESUME_AND_ZERORTT;
            settings.IsSet.flags.ServerResumptionLevel = true;
            settings.bitfields.SendBufferingEnabled = true;
            settings.IsSet.flags.SendBufferingEnabled = true;

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
            };
        }
        pub fn deinit(self: *@This()) void {
            self.msquic.ConfigurationClose.?(self.configuration);
            self.msquic.RegistrationClose.?(self.registration);
            MsQuic.MsQuicClose(self.msquic);
            self.quic_buffer_pool.deinit();
        }

        pub const ConnAndStream = struct {
            conn: MsQuic.HQUIC,
            stream_context: *StreamContext,
        };

        pub fn startStream(self: *@This(), conn: MsQuic.HQUIC, proto: []const u8) !*StreamContext {
            var stream_context = try self.allocator.create(StreamContext);
            stream_context.* = try InitStreamContextFn(
                self.allocator,
                self.msquic,
                undefined,
                true,
                &self.quic_buffer_pool,
                &self.test_env,
            );
            errdefer {
                stream_context.deinit();
                self.allocator.destroy(stream_context);
            }

            var status = self.msquic.StreamOpen.?(
                conn,
                MsQuic.QUIC_STREAM_OPEN_FLAG_NONE,
                MsQuic.HandleEventWrapper(StreamContext, StreamContext.handleEvent).streamCallback,
                stream_context,
                &stream_context.stream_handle,
            );

            if (MsQuic.QuicStatus.isError(status)) {
                return error.StreamOpenFailed;
            }

            status = self.msquic.StreamStart.?(stream_context.stream_handle, MsQuic.QUIC_STREAM_START_FLAG_NONE);
            if (MsQuic.QuicStatus.isError(status)) {
                return error.StreamStartFailed;
            }

            try stream_context.initiateMSS(stream_context.stream_handle, proto);

            return stream_context;
        }

        pub fn dialAndStartStream(self: *@This(), dial_settings: DialSettings) !ConnAndStream {
            var conn: MsQuic.HQUIC = undefined;
            if (QuicStatus.isError(self.msquic.ConnectionOpen.?(self.registration, Self.outboundConnectionCallback, self, &conn))) {
                return error.FailedToOpenConn;
            }
            self.no_open_conns.incActiveConns();

            errdefer self.msquic.ConnectionShutdown.?(conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);

            var stream_context = try self.allocator.create(StreamContext);
            stream_context.* = try InitStreamContextFn(
                self.allocator,
                self.msquic,
                undefined,
                true,
                &self.quic_buffer_pool,
                &self.test_env,
            );
            errdefer {
                stream_context.deinit();
                self.allocator.destroy(stream_context);
            }

            var status = self.msquic.StreamOpen.?(
                conn,
                MsQuic.QUIC_STREAM_OPEN_FLAG_NONE,
                MsQuic.HandleEventWrapper(StreamContext, StreamContext.handleEvent).streamCallback,
                stream_context,
                &stream_context.stream_handle,
            );

            if (MsQuic.QuicStatus.isError(status)) {
                return error.StreamOpenFailed;
            }

            status = self.msquic.StreamStart.?(stream_context.stream_handle, MsQuic.QUIC_STREAM_START_FLAG_NONE);
            if (MsQuic.QuicStatus.isError(status)) {
                return error.StreamStartFailed;
            }

            try stream_context.initiateMSS(stream_context.stream_handle, dial_settings.proto);

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
                        return error.GetInterfaceAddrFailed;
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
                        self.app.no_open_conns.incActiveConns();
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
                log.debug("inbound connection event: from={any} {s}\n", .{ connection, MsQuic.connectionEventToString(event.*.Type) });

                switch (event.*.Type) {
                    MsQuic.QUIC_CONNECTION_EVENT_CONNECTED => {
                        log.info("Connected", .{});
                    },
                    MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => {
                        if (!event.*.unnamed_0.SHUTDOWN_COMPLETE.AppCloseInProgress) {
                            self.msquic.ConnectionClose.?(connection);
                        }
                        self.app.no_open_conns.decActiveConns();
                    },
                    MsQuic.QUIC_CONNECTION_EVENT_PEER_STREAM_STARTED => {
                        var stream_context = self.allocator.create(StreamContext) catch {
                            return QuicStatus.OutOfMemory;
                        };
                        const stream_handle = event.*.unnamed_0.PEER_STREAM_STARTED.Stream;
                        stream_context.* = InitStreamContextFn(
                            self.allocator,
                            self.app.msquic,
                            stream_handle,
                            false,
                            &self.app.quic_buffer_pool,
                            &self.app.test_env,
                        ) catch |err| {
                            std.debug.print("conn={any} Failed to create stream context: {any}\n", .{ connection, err });
                            return QuicStatus.OutOfMemory;
                        };

                        self.msquic.SetCallbackHandler.?(
                            stream_handle,
                            @intToPtr(*anyopaque, @ptrToInt(&MsQuic.HandleEventWrapper(StreamContext, StreamContext.handleEvent).streamCallback)),
                            stream_context,
                        );
                        // stream_context.streamStarted();
                    },
                    MsQuic.QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED => {
                        // The peer has sent a certificate.
                        var peer_key = getPeerPubKey(self.allocator, event.*.unnamed_0.PEER_CERTIFICATE_RECEIVED.Certificate) catch |err| {
                            std.debug.print("conn={any} Failed to get peer certificate: {any}\n", .{ connection, err });
                            self.msquic.ConnectionShutdown.?(connection, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT, 0);
                            return MsQuic.QuicStatus.InternalError;
                        };
                        defer peer_key.deinit(self.allocator);
                        var peer_id = peer_key.toPeerID();
                        var peer_id_legacy = peer_id.Ed25519.toLegacyString(self.allocator) catch |err| {
                            std.debug.print("conn={any} Failed to get peer ID: {any}\n", .{ connection, err });
                            self.msquic.ConnectionShutdown.?(connection, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT, 0);
                            return MsQuic.QuicStatus.InternalError;
                        };

                        defer self.allocator.free(peer_id_legacy);
                        log.debug(
                            "Peer is {s}",
                            .{peer_id_legacy},
                        );
                    },
                    MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_TRANSPORT => {
                        log.warn("Connection shutdown by transport. Status={}", .{event.*.unnamed_0.SHUTDOWN_INITIATED_BY_TRANSPORT.Status});
                    },
                    else => {},
                }

                return 0;
            }
        };

        fn outboundConnectionCallback(connection: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
            const self = @ptrCast(*Self, @alignCast(@alignOf(Self), self_ptr));
            log.debug("outbound connection event: from={any} {s}\n", .{ connection, MsQuic.connectionEventToString(event.*.Type) });

            switch (event.*.Type) {
                MsQuic.QUIC_CONNECTION_EVENT_CONNECTED => {
                    log.debug("Connected", .{});
                },
                MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => {
                    if (!event.*.unnamed_0.SHUTDOWN_COMPLETE.AppCloseInProgress) {
                        self.msquic.ConnectionClose.?(connection);
                    }
                    self.no_open_conns.decActiveConns();
                },
                MsQuic.QUIC_CONNECTION_EVENT_PEER_STREAM_STARTED => {
                    var stream_context = self.allocator.create(StreamContext) catch {
                        return QuicStatus.OutOfMemory;
                    };
                    const stream_handle = event.*.unnamed_0.PEER_STREAM_STARTED.Stream;
                    stream_context.* = InitStreamContextFn(
                        self.allocator,
                        self.msquic,
                        stream_handle,
                        false,
                        &self.quic_buffer_pool,
                        &self.test_env,
                    ) catch |err| {
                        std.debug.print("conn={any} Failed to create stream context: {any}\n", .{ connection, err });
                        return QuicStatus.OutOfMemory;
                    };
                    self.msquic.SetCallbackHandler.?(
                        stream_handle,
                        @intToPtr(*anyopaque, @ptrToInt(&MsQuic.HandleEventWrapper(StreamContext, StreamContext.handleEvent).streamCallback)),
                        stream_context,
                    );
                },

                MsQuic.QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED => {
                    // The peer has sent a certificate.
                    var peer_key = getPeerPubKey(self.allocator, event.*.unnamed_0.PEER_CERTIFICATE_RECEIVED.Certificate) catch |err| {
                        std.debug.print("conn={any} Failed to get peer certificate: {any}\n", .{ connection, err });
                        self.msquic.ConnectionShutdown.?(connection, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT, 0);
                        return MsQuic.QuicStatus.InternalError;
                    };
                    defer peer_key.deinit(self.allocator);
                    var peer_id = peer_key.toPeerID();
                    var peer_id_legacy = peer_id.Ed25519.toLegacyString(self.allocator) catch |err| {
                        std.debug.print("conn={any} Failed to get peer ID: {any}\n", .{ connection, err });
                        self.msquic.ConnectionShutdown.?(connection, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT, 0);
                        return MsQuic.QuicStatus.InternalError;
                    };

                    defer self.allocator.free(peer_id_legacy);
                    log.debug(
                        "Peer is {s}",
                        .{peer_id_legacy},
                    );
                },
                MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_TRANSPORT => {
                    log.warn("Connection shutdown by transport. Status={}", .{event.*.unnamed_0.SHUTDOWN_INITIATED_BY_TRANSPORT.Status});
                },
                else => {},
            }

            return 0;
        }
    };
}

pub fn runDialer(allocator: Allocator, comptime Node: anytype, proto_to_dial: []const u8, listener_multiaddr: *const []const u8, addr_semaphore: *Semaphore) !void {
    addr_semaphore.wait();

    const ma = try multiaddr.decodeMultiaddr(allocator, listener_multiaddr.*);
    defer ma.deinit(allocator);

    var client = try Node.init(allocator);
    defer client.deinit();

    var stream_and_conn = try client.dialAndStartStream(.{
        .target = ma.target,
        .target_port = ma.port,
        .proto = proto_to_dial,
    });
    // Wait for done
    client.test_env.done_semaphore.wait();

    log.info("Shutting down", .{});
    client.msquic.ConnectionShutdown.?(stream_and_conn.conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);

    // Wait for all connections to be closed
    log.info("Waiting for conns to shut down", .{});
    client.no_open_conns.wait();

    log.info("Closing app", .{});
}

pub fn runListener(allocator: Allocator, comptime Node: anytype, ip: [:0]const u8, out_listener_multiaddr: *[]const u8, addr_semaphore: *Semaphore, shutdown_semaphore: *Semaphore) !void {
    var server = try Node.init(allocator);
    defer server.deinit();
    var listener = server.newListener();
    try listener.listen(ip, 0);
    defer listener.deinit();
    const serverPeerID = try (try server.host_key.toPubKey().toPeerID()).Ed25519.toLegacyString(allocator);
    defer allocator.free(serverPeerID);
    log.debug("Listener peer id is {s}", .{serverPeerID});

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
