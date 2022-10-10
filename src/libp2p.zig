const std = @import("std");
const Allocator = std.mem.Allocator;
pub const MsQuicTransport = @import("./transport/msquic.zig").MsQuicTransport;
pub const HandleError = @import("./handle.zig").HandleError;
const MultistreamSelect = @import("./multistream_select.zig").MultistreamSelect;
const Loop = std.event.Loop;
const global_event_loop = Loop.instance orelse
    @compileError("libp2p transport relies on the event loop");

pub const crypto = @import("./crypto.zig");
pub const PeerID = crypto.PeerID;

pub const ConnHandle = MsQuicTransport.ConnectionSystem.Handle;
pub const StreamHandle = MsQuicTransport.StreamSystem.Handle;

pub const Libp2p = struct {
    host_key: crypto.ED25519KeyPair,
    options: Options,
    transport: *MsQuicTransport,
    active_conns: ActiveConnsMap,
    active_listeners: ListenerList,
    incoming_handlers: IncomingStreamHandlers,

    const ConnList = std.ArrayList(MsQuicTransport.ConnectionSystem.Handle);
    const ListenerList = std.ArrayList(Listener);
    const ActiveConnsMap = std.AutoHashMap(PeerID, ConnList);

    const SupportedProtocolMatcher = struct {
        ptr: *anyopaque,
        isSupportedProtoFn: fn (*anyopaque, []const u8) bool,
        pub inline fn isSupportedProto(self: SupportedProtocolMatcher, proto_id: []const u8) bool {
            return self.isSupportedProtoFn(self.ptr, proto_id);
        }

        pub fn init(ptr: anytype) SupportedProtocolMatcher {
            const Ptr = @TypeOf(ptr);
            const ptr_info = @typeInfo(Ptr);
            if (ptr_info != .Pointer) @compileError("ptr must be a pointer");
            if (ptr_info.Pointer.size != .One) @compileError("ptr must be a single item pointer");
            const alignment = ptr_info.Pointer.alignment;
            const gen = struct {
                pub fn isSupportedProtoImpl(pointer: *anyopaque, proto_id: []const u8) bool {
                    const self = @ptrCast(Ptr, @alignCast(alignment, pointer));

                    return @call(.{ .modifier = .always_inline }, ptr_info.Pointer.child.isSupportedProto, .{ self, proto_id });
                }
            };

            return .{
                .ptr = ptr,
                .isSupportedProtoFn = gen.isSupportedProtoImpl,
            };
        }
    };

    pub const FixedSupportedProtocols = struct {
        supported_proto_ids: [][]const u8,
        fn isSupportedProto(self: *FixedSupportedProtocols, proto: []const u8) bool {
            for (self.supported_proto_ids) |my_proto| {
                if (std.mem.eql(u8, my_proto, proto)) {
                    return true;
                }
            }
            return false;
        }

        fn supportedProtocolMatcher(self: *FixedSupportedProtocols) SupportedProtocolMatcher {
            return SupportedProtocolMatcher.init(self);
        }
    };

    pub fn ConstSupportedProtocols(supported_proto_ids: anytype) type {
        return struct {
            // Some data so that this isn't 0 sized and can have a valid pointer.
            dummy: bool = false,
            fn isSupportedProto(_: *@This(), proto: []const u8) bool {
                inline for (supported_proto_ids) |my_proto| {
                    if (std.mem.eql(u8, my_proto[0..], proto)) {
                        return true;
                    }
                }
                return false;
            }

            fn supportedProtocolMatcher(self: *@This()) SupportedProtocolMatcher {
                return SupportedProtocolMatcher.init(self);
            }
        };
    }

    // Thread safe
    pub const IncomingStreamHandlers = struct {
        rwlock: std.Thread.RwLock.Impl = .{},

        registered_protos: RegisteredProtos,

        const RegisteredProtos = std.StringHashMap(IncomingStreamHandler);
        const IncomingStreamHandler = struct {
            ptr: *anyopaque,
            f: fn (*anyopaque, StreamHandle) void,
            fn handleIncomingStream(self: IncomingStreamHandler, stream: StreamHandle) !void {
                self.f(self.ptr, stream);
            }
        };

        pub fn init(allocator: Allocator) !IncomingStreamHandlers {
            var self = IncomingStreamHandlers{
                .registered_protos = RegisteredProtos.init(allocator),
            };

            return self;
        }

        pub fn deinit(self: *IncomingStreamHandlers) void {
            self.registered_protos.deinit();
        }

        pub fn supportedProtocolMatcher(self: *IncomingStreamHandlers) SupportedProtocolMatcher {
            return SupportedProtocolMatcher.init(self);
        }

        pub fn isSupportedProto(self: *IncomingStreamHandlers, proto_id: []const u8) bool {
            self.rwlock.lockShared();
            defer self.rwlock.unlockShared();
            return self.registered_protos.contains(proto_id);
        }

        pub fn handlerForProto(self: *IncomingStreamHandlers, proto_id: []const u8) ?IncomingStreamHandler {
            self.rwlock.lockShared();
            defer self.rwlock.unlockShared();
            return self.registered_protos.get(proto_id);
        }

        pub fn registerHandler(self: *IncomingStreamHandlers, proto_id: []const u8, comptime Context: type, context: Context, comptime handler: fn (context: Context, stream: StreamHandle) void) !void {
            self.rwlock.lock();
            defer self.rwlock.unlock();

            const ptr_info = @typeInfo(Context);
            const alignment = ptr_info.Pointer.alignment;
            const gen = struct {
                pub fn f(pointer: *anyopaque, stream: StreamHandle) void {
                    const self_ptr = @ptrCast(Context, @alignCast(alignment, pointer));
                    return @call(.{ .modifier = .always_inline }, handler, .{ self_ptr, stream });
                }
            };
            var handlerWrapped = IncomingStreamHandler{
                .ptr = context,
                .f = gen.f,
            };

            self.registered_protos.putNoClobber(proto_id, handlerWrapped) catch {
                return error.AlreadyRegistered;
            };
        }
    };

    pub const Listener = struct {
        const Handle = MsQuicTransport.ListenerSystem.Handle;
        h: Handle,
        transport: *MsQuicTransport,
        registered_handlers: *IncomingStreamHandlers,
        libp2p: *Libp2p,
        // active_conns: std.ArrayList(MsQuicTransport.ConnectionSystem.Handle) ,

        fn init(allocator: Allocator, transport: *MsQuicTransport, addr: std.net.Address, handlers: *IncomingStreamHandlers, libp2p: *Libp2p) !Listener {
            const inner_listener = try transport.listen(allocator, addr);
            var self = Listener{
                .h = inner_listener,
                .transport = transport,
                .registered_handlers = handlers,
                .libp2p = libp2p,
            };

            var acceptConnFrame = try allocator.create(@Frame(acceptConnLoop));
            acceptConnFrame.* = async self.acceptConnLoop(allocator);

            return self;
        }

        fn deinit(self: @This(), transport: *MsQuicTransport) void {
            MsQuicTransport.Listener.deinitHandle(self.h, transport);
        }

        fn acceptConnLoop(self: Listener, allocator: Allocator) !void {
            defer {
                suspend {
                    allocator.destroy(@frame());
                }
            }

            while (true) {
                const listener_ptr = try self.transport.listener_system.handle_allocator.getPtr(self.h);
                var incoming_conn = try listener_ptr.accept();
                std.debug.print("Got conn!!\n", .{});
                // TODO who is the peer?
                var incoming_conn_ptr = try self.transport.connection_system.handle_allocator.getPtr(incoming_conn);
                try self.libp2p.addActiveConn(incoming_conn_ptr.peer_id.?, incoming_conn);

                // Store the frame on the heap
                var acceptStreamFrame = try allocator.create(@Frame(acceptStreamLoop));
                acceptStreamFrame.* = async self.acceptStreamLoop(allocator, incoming_conn);
                std.debug.print("\n\n f is at {*}\n\n", .{acceptStreamFrame});
            }
        }

        fn acceptStreamLoop(self: Listener, allocator: Allocator, conn: MsQuicTransport.ConnectionSystem.Handle) !void {
            defer {
                suspend {
                    allocator.destroy(@frame());
                }
            }

            // Start this loop on the next tick from the event loop rather than rely on the caller to drive this forward.
            var tick_node = Loop.NextTickNode{ .prev = undefined, .next = undefined, .data = @frame() };
            suspend {
                global_event_loop.onNextTick(&tick_node);
            }

            while (true) {
                const conn_ptr = try self.transport.connection_system.handle_allocator.getPtr(conn);
                var incoming_stream = try conn_ptr.acceptStream(allocator);
                self.driveInboundStreamNegotiation(incoming_stream) catch |err| {
                    std.debug.print("Err in negotiating stream: {}", .{err});
                };
            }
        }

        fn driveInboundStreamNegotiation(self: Listener, stream: StreamHandle) !void {
            var proto_id_buf = [_]u8{0} ** 128;
            var stream_ptr = try self.transport.stream_system.handle_allocator.getPtr(stream);
            var stream_reader = MsQuicTransport.Stream.Reader{ .context = stream_ptr };
            var stream_writer = MsQuicTransport.Stream.Writer{ .context = stream_ptr };
            var proto_len = try MultistreamSelect.negotiateInboundMultistreamSelect(stream_writer, stream_reader, self.registered_handlers.supportedProtocolMatcher(), proto_id_buf[0..]);
            var proto_id = proto_id_buf[0..proto_len];
            var handler = self.registered_handlers.handlerForProto(proto_id) orelse {
                @panic("TODO not supported close this stream");
            };
            handler.handleIncomingStream(stream) catch |err| {
                std.debug.print("Error in handling incoming stream: {}", .{err});
                // TODO close stream on error
            };
        }
    };

    pub const Options = struct {
        msquic_options: MsQuicTransport.Options = MsQuicTransport.Options.default(),
        host_key: ?crypto.ED25519KeyPair = null,
        transport: ?*MsQuicTransport = null,
    };

    pub fn init(allocator: Allocator, options: Options) !Libp2p {
        var host_key = options.host_key orelse try crypto.ED25519KeyPair.new();

        var transport = options.transport orelse blk: {
            var cert_key = try crypto.ED25519KeyPair.new();
            defer cert_key.deinit();

            var x509 = try crypto.X509.init(cert_key, (try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }))[0..]);
            defer x509.deinit();

            var pkcs12 = try crypto.PKCS12.init(cert_key, x509);
            defer pkcs12.deinit();
            var t = try allocator.create(MsQuicTransport);
            t.* = try MsQuicTransport.init(allocator, "zig-libp2p", &pkcs12, MsQuicTransport.Options.default());
            break :blk t;
        };
        var self = Libp2p{
            .host_key = host_key,
            .options = options,
            .transport = transport,
            .active_conns = ActiveConnsMap.init(allocator),
            .incoming_handlers = try IncomingStreamHandlers.init(allocator),
            .active_listeners = ListenerList.init(allocator),
        };

        return self;
    }

    pub fn deinit(self: *Libp2p, allocator: Allocator) void {
        {
            var it = self.active_conns.iterator();
            while (it.next()) |conn_list| {
                for (conn_list.value_ptr.items) |conn| {
                    var conn_ptr = self.transport.connection_system.handle_allocator.getPtr(conn) catch {
                        continue;
                    };
                    conn_ptr.deinit(self.active_conns.allocator, self.transport);
                }
                conn_list.value_ptr.deinit();
            }
            self.active_conns.deinit();
        }

        {
            for (self.active_listeners.items) |l| {
                l.deinit(self.transport);
            }
            self.active_listeners.deinit();
        }

        self.incoming_handlers.deinit();

        if (self.options.transport == null) {
            // We created this transport, we need to destory it
            self.transport.deinit();
            allocator.destroy(self.transport);
        }

        if (self.options.host_key == null) {
            self.host_key.deinit();
        }
    }

    fn negotiateOutboundStream(self: *Libp2p, stream_handle: StreamHandle, protocol_id: []const u8) !void {
        var stream_ptr = try self.transport.stream_system.handle_allocator.getPtr(stream_handle);
        stream_ptr.setDelaySendFlag();
        defer stream_ptr.resetFlags();

        var stream_reader = MsQuicTransport.Stream.Reader{ .context = stream_ptr };
        var stream_writer = MsQuicTransport.Stream.Writer{ .context = stream_ptr };

        try MultistreamSelect.negotiateOutboundMultistreamSelect(stream_writer, stream_reader, protocol_id);
    }

    pub fn newStream(self: *Libp2p, dest: std.net.Address, peer: PeerID, protocol_id: []const u8) !StreamHandle {
        // TODO use a lock to protect access to active_conns
        var active_conns_result = try self.active_conns.getOrPut(peer);
        if (!active_conns_result.found_existing) {
            active_conns_result.value_ptr.* = Libp2p.ConnList.init(self.active_conns.allocator);
        }
        var active_conns = active_conns_result.value_ptr;

        var i = active_conns.items.len;
        while (i > 0) {
            i -= 1;
            var conn_ptr = self.transport.connection_system.handle_allocator.getPtr(active_conns.items[i]) catch {
                // No longer active, clean this
                _ = active_conns.swapRemove(i);
                continue;
            };

            var stream_handle = conn_ptr.newStream(self.transport) catch |err| {
                std.debug.print("Failed to use connection to get new stream: {any}", .{err});
                continue;
            };

            self.negotiateOutboundStream(stream_handle, protocol_id) catch |err| {
                std.debug.print("Failed to negotiate outbound stream: {any}", .{err});
                continue;
            };
            return stream_handle;
        }

        // No usable existing connection. Make a new one
        var ip_addr_buf = [_]u8{0} ** ((4 * 8) + 7 + 1 + 5); // ipv6 is 8 groups of 4 hex chars separated by a ":". + ":" + 5 for the port
        var ip_addr = try std.fmt.bufPrint(ip_addr_buf[0..], "{}", .{dest});
        // Drop the port
        ip_addr = ip_addr[0..std.mem.lastIndexOf(u8, ip_addr, ":").?];

        // set the sentinel null value
        ip_addr_buf[ip_addr.len] = 0;
        var ip_addr_with_sentinel = std.meta.assumeSentinel(ip_addr, 0);

        std.debug.print("Connecting to |{s}| |{}|\n", .{ ip_addr, dest.getPort() });
        var conn_handle = try self.transport.startConnection(self.active_conns.allocator, ip_addr_with_sentinel, dest.getPort());
        try active_conns.append(conn_handle);

        var conn_ptr = try self.transport.connection_system.handle_allocator.getPtr(conn_handle);
        std.debug.print("conn={*} I have conn here\n", .{conn_ptr.connection_handle});
        if (!conn_ptr.peer_id.?.equal(peer)) {
            std.debug.print("conn={*} Unexpected peer id.\nExp: {}\nsaw: {}\n", .{ conn_ptr.connection_handle, peer, conn_ptr.peer_id.? });
            return error.UnexpectedPeerID;
        }

        var stream_handle = try conn_ptr.newStream(self.transport);
        std.debug.print("Negotiating outbound\n", .{});
        try self.negotiateOutboundStream(stream_handle, protocol_id);

        // TODO broadcast new connection event

        return stream_handle;
    }

    fn addActiveConn(self: *Libp2p, peer: PeerID, conn: ConnHandle) !void {
        var active_conns_result = try self.active_conns.getOrPut(peer);
        if (!active_conns_result.found_existing) {
            active_conns_result.value_ptr.* = Libp2p.ConnList.init(self.active_conns.allocator);
        }

        var active_conns = active_conns_result.value_ptr;
        try active_conns.append(conn);
    }

    pub fn listen(self: *Libp2p, addr: std.net.Address) !void {
        // TODO protect this and others?
        var l = try Listener.init(self.active_listeners.allocator, self.transport, addr, &self.incoming_handlers, self);
        try self.active_listeners.append(l);
    }

    pub fn handleStream(self: *Libp2p, proto_id: []const u8, comptime Context: type, context: Context, comptime handler: fn (Context, StreamHandle) void) !void {
        try self.incoming_handlers.registerHandler(proto_id, Context, context, handler);
    }
};

test {
    _ = @import("./transport/msquic.zig");
    _ = @import("./crypto/openssl.zig");
    _ = @import("./crypto.zig");
    _ = @import("./multistream_select.zig");
    _ = @import("./util/pipe.zig");
    _ = @import("./util/channel.zig");

    // Protocols
    _ = @import("./protocols/ping.zig");
    _ = @import("./protocols/bandwidth_perf.zig");

    std.testing.refAllDecls(@This());
}

test "Supported Protocol matcher" {
    var supported_protos = comptime Libp2p.ConstSupportedProtocols(.{ "hi", "by" }){};

    const matcher = supported_protos.supportedProtocolMatcher();
    try std.testing.expect(matcher.isSupportedProto("hi"));
    try std.testing.expect(!matcher.isSupportedProto("foo"));
}

fn testSetup(host_key: crypto.ED25519KeyPair) !MsQuicTransport {
    const allocator = std.testing.allocator;
    // var host_key = try crypto.ED25519KeyPair.new();
    // defer host_key.deinit();
    var cert_key = try crypto.ED25519KeyPair.new();
    defer cert_key.deinit();

    var x509 = try crypto.X509.init(cert_key, (try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }))[0..]);

    defer x509.deinit();

    // try crypto.Libp2pTLSCert.insertExtension(&x509, try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }));

    var pkcs12 = try crypto.PKCS12.init(cert_key, x509);
    defer pkcs12.deinit();

    var transport = try MsQuicTransport.init(allocator, "zig-libp2p", &pkcs12, MsQuicTransport.Options.default());

    return transport;
}

test "e2e hello" {
    const allocator = std.testing.allocator;

    var host_key = try crypto.ED25519KeyPair.new();
    defer host_key.deinit();
    var cert_key = try crypto.ED25519KeyPair.new();
    defer cert_key.deinit();

    var host_key_2 = try crypto.ED25519KeyPair.new();
    defer host_key_2.deinit();

    var x509 = try crypto.X509.init(cert_key, (try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }))[0..]);
    defer x509.deinit();

    // try crypto.Libp2pTLSCert.insertExtension(&x509, try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }));

    var pkcs12 = try crypto.PKCS12.init(cert_key, x509);
    defer pkcs12.deinit();

    var transport = try MsQuicTransport.init(allocator, "zig-libp2p", &pkcs12, MsQuicTransport.Options.default());
    defer transport.deinit();
    std.debug.print("DEBUG: stream system {*}\n", .{&transport.stream_system.handle_allocator.free_slots});

    // Setup a listener
    const TestListener = struct {
        fn run(r_transport: *MsQuicTransport, waiter: *std.Thread.Semaphore, hk2: crypto.ED25519KeyPair) !void {
            _ = r_transport;

            // var l_transportt = try testSetup(hk2);
            // defer l_transportt.deinit();
            // var l_transport = &l_transportt;
            // std.debug.print("DEBUG: stream system 2 {*}\n", .{&l_transport.stream_system.handle_allocator.free_slots});
            var libp2p_2 = try Libp2p.init(allocator, .{ .host_key = hk2 });
            defer libp2p_2.deinit(allocator);

            try libp2p_2.handleStream("hello", *MsQuicTransport, libp2p_2.transport, @This().handleHello);

            try libp2p_2.listen(try std.net.Address.resolveIp("127.0.0.1", 54321));
            waiter.post();

            std.time.sleep(1 * std.time.ns_per_s);

            waiter.post();
        }

        fn handleHelloAsync(l_transport: *MsQuicTransport, stream: StreamHandle) void {
            std.debug.print("\n\nIn hello handler async\n\n", .{});
            defer {
                suspend {
                    std.debug.print("\n\nDONE In hello handler async\n\n", .{});
                    l_transport.allocator.destroy(@frame());
                }
            }

            var incoming_stream_ptr = l_transport.stream_system.handle_allocator.getPtr(stream) catch {
                @panic("todo fixme");
            };

            var leasedBuf = incoming_stream_ptr.recvWithLease() catch {
                @panic("todo fixme");
            };
            std.debug.print("Got {s} on the other side \n\n", .{leasedBuf.buf});
            leasedBuf.releaseAndWaitForNextTick(l_transport, incoming_stream_ptr);

            _ = incoming_stream_ptr.send("hola") catch {
                @panic("Failed to send");
            };
            // TODO handle when we don't get a receive and the connection was shut down

            incoming_stream_ptr.*.shutdownNow() catch {
                std.debug.print("FAILED TO SHUTDOWN\n\n", .{});
            };
        }

        fn handleHello(l_transport: *MsQuicTransport, stream: StreamHandle) void {
            std.debug.print("\n\nIn hello handler\n\n", .{});

            var frame = l_transport.allocator.create(@Frame(handleHelloAsync)) catch {
                @panic("Failed to allocate");
            };
            frame.* = async handleHelloAsync(l_transport, stream);
        }
    };

    var waiter = std.Thread.Semaphore{};
    const testAgainstGoLibp2p = false;
    var peer: PeerID = undefined;
    var listener_frame: @Frame(TestListener.run) = undefined;
    if (testAgainstGoLibp2p) {
        peer = PeerID{ .Ed25519 = .{ .pub_key_bytes = [32]u8{ 174, 64, 228, 70, 65, 230, 165, 47, 31, 173, 207, 211, 58, 126, 250, 224, 223, 179, 75, 194, 58, 103, 233, 53, 193, 240, 40, 132, 96, 7, 119, 77 } } };
        waiter.post();
    } else {
        peer = try (crypto.ED25519KeyPair.PublicKey{ .key = host_key_2.key }).toPeerID();
        listener_frame = async TestListener.run(&transport, &waiter, host_key_2);
    }

    defer {
        if (!testAgainstGoLibp2p) {
            std.debug.print("\n\n\nWaiting for semaphore\n", .{});
            waiter.wait();
            waiter.post();
            std.debug.print("\ndone waiting\n", .{});
            await listener_frame catch {
                @panic("Listener failed");
            };
        }
    }

    var libp2p = try Libp2p.init(allocator, .{ .transport = &transport, .host_key = host_key });
    defer libp2p.deinit(allocator);

    waiter.wait();
    var stream_handle = try libp2p.newStream(try std.net.Address.resolveIp("127.0.0.1", 54321), peer, "hello");

    var stream_ptr = try transport.stream_system.handle_allocator.getPtr(stream_handle);
    std.debug.print("Sending data\n\n", .{});

    _ = try stream_ptr.send("hello world");
    std.debug.print("waiting for data\n\n", .{});
    // TODO return error when the stream is closed
    var leasedBuf = try stream_ptr.recvWithLease();
    std.debug.print("\nGot back: {s}\n", .{leasedBuf.buf});
    leasedBuf.releaseAndWaitForNextTick(&transport, stream_ptr);
}

// TODOs
// - accept options for msquic
// - generate key from seed
// - serialize key
