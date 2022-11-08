const std = @import("std");
const builtin = @import("builtin");
const Allocator = std.mem.Allocator;
const Channel = std.event.Channel;
const Lock = std.event.Lock;
const MsQuic = @import("msquic/msquic_wrapper.zig");
const crypto = @import("../crypto.zig");
const HandleAllocator = @import("../handle.zig").HandleAllocator;

const Loop = std.event.Loop;

const global_event_loop = Loop.instance orelse
    @compileError("msquic transport relies on the event loop");

const workaround = @cImport({
    @cInclude("link_workaround.h");
});

const MsQuicHandle = struct {
    id: u8,
    pub inline fn getQuicAPI(handle: MsQuicHandle) *const MsQuic.QUIC_API_TABLE {
        // TODO verify this is a valid handle
        return msquic_instances.instances[handle.id];
    }
};

const MsQuicInstances = struct {
    // Controls how many MsQuic.QUIC_API_TABLES we will want to allocate. Usually you wouldn't need more than one.
    const MAX_MSQUIC_INSTANCES = if (builtin.is_test) 32 else 4;
    instances: [MAX_MSQUIC_INSTANCES]*const MsQuic.QUIC_API_TABLE = .{},
    next_free_slot: u8 = 0,
    lock: std.event.RwLock,

    pub fn init() MsQuicInstances {
        return MsQuicInstances{
            .instances = [_]*const MsQuic.QUIC_API_TABLE{undefined} ** MAX_MSQUIC_INSTANCES,
            .next_free_slot = 0,
            .lock = std.event.RwLock.init(),
        };
    }

    pub fn deinit(self: MsQuicInstances) void {
        self.lock.deinit();
    }

    pub fn pushInstance(self: *MsQuicInstances, msquic: *const MsQuic.QUIC_API_TABLE) MsQuicHandle {
        const held = self.lock.acquireWrite();
        defer held.release();
        if (self.next_free_slot > MAX_MSQUIC_INSTANCES) {
            @panic("Too many msquic instances");
        }

        self.instances[self.next_free_slot] = msquic;
        self.next_free_slot += 1;
        return .{
            .id = self.next_free_slot - 1,
        };
    }
};

var msquic_instances = MsQuicInstances.init();

var libp2p_proto_name = "libp2p".*;
const alpn = MsQuic.QUIC_BUFFER{
    .Length = @sizeOf(@TypeOf(libp2p_proto_name)) - 1,
    .Buffer = @ptrCast([*c]u8, libp2p_proto_name[0..]),
};

pub const MsQuicTransport = struct {
    const Self = @This();
    const CredentialConfigHelper = struct {
        cred_config: MsQuic.QUIC_CREDENTIAL_CONFIG,
        cert: MsQuic.QUIC_CERTIFICATE_PKCS12,
    };

    // Context struct that can be passed to QUIC callbacks
    const ConnectionContext = struct {
        const NodeWithConnectionContext = std.atomic.Queue(ConnectionContext).Node;
        connection_handle: HandleAllocator(Connection).Handle,
        transport: *MsQuicTransport,

        fn cCallback(connection: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) callconv(.C) c_uint {
            const self = @ptrCast(*ConnectionContext, @alignCast(@alignOf(ConnectionContext), self_ptr));
            std.debug.print("Connection event: {}\n", .{event.*.Type});
            defer {
                switch (event.*.Type) {
                    MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => {
                        self.transport.allocator.destroy(self);
                    },
                    else => {},
                }
            }
            return self.callback(connection, event);
        }

        // Same as above, but this context has the node.
        fn cCallbackWithNode(connection: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) c_uint {
            const self = @ptrCast(*NodeWithConnectionContext, @alignCast(@alignOf(NodeWithConnectionContext), self_ptr));
            std.debug.print("Server Connection event: {}\n", .{event.*.Type});
            defer std.debug.print("Done Server Connection event: {}\n", .{event.*.Type});
            defer {
                switch (event.*.Type) {
                    MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => {
                        self.data.transport.allocator.destroy(self);
                    },
                    else => {},
                }
            }
            return self.data.callback(connection, event);
        }

        inline fn callback(self: *ConnectionContext, connection: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) c_uint {
            const conn_ptr = self.transport.connection_system.handle_allocator.getPtr(self.connection_handle) catch {
                std.debug.print("Stale handle failed to get ptr\n", .{});
                return MsQuic.QuicStatus.InternalError;
            };
            if (conn_ptr.connection_handle != connection) {
                conn_ptr.connection_handle = connection;
            }
            std.debug.print("Handling event={}\n", .{event.*.Type});
            defer std.debug.print("done handling event={}\n", .{event.*.Type});

            // TODO handle other events
            switch (event.*.Type) {
                MsQuic.QUIC_CONNECTION_EVENT_CONNECTED => {
                    // The handshake has completed for the connection.
                    std.debug.print("conn={any} Client connected\n", .{connection});
                    // self.clientSend(self.allocator, connection) catch |err| {
                    //     std.debug.print("conn={any} Failed to send: {any}\n", .{ connection, err });
                    //     self.msquic.ConnectionShutdown.?(connection, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);
                    // };
                    std.debug.print("Event={}\n", .{event.*.Type});
                    conn_ptr.rw_lock.lock();
                    defer conn_ptr.rw_lock.unlock();
                    conn_ptr.state = .Connected;
                    conn_ptr.fut.resolve();
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

                    var peer_pub_key = crypto.Libp2pTLSCert.verify(peer_x509, self.transport.allocator) catch |err| {
                        std.debug.print("Failed to validate conn, closing: {any}\n", .{err});
                        self.transport.msquic.getQuicAPI().ConnectionShutdown.?(connection, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT, 0);
                        return MsQuic.QuicStatus.InternalError;
                    };
                    conn_ptr.peer_id = peer_pub_key.toPeerID();
                    std.event.Lock.Held.release(.{ .lock = &conn_ptr.peer_id_lock });
                },
                MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_TRANSPORT => {
                    conn_ptr.rw_lock.lock();
                    defer conn_ptr.rw_lock.unlock();
                    if (conn_ptr.state == .Connecting) {
                        conn_ptr.fut.resolve();
                    }
                    conn_ptr.state = .Closed;
                    // The connection has been shut down by the transport. Generally, this
                    // is the expected way for the connection to shut down with this
                    // protocol, since we let idle timeout kill the connection.
                    if (event.*.unnamed_0.SHUTDOWN_INITIATED_BY_TRANSPORT.Status == MsQuic.QuicStatus.ConnectionIdle) {
                        std.debug.print("conn={any} successfully shut down on idle\n", .{connection});
                    } else {
                        std.debug.print("conn={any} shut down by transport status={x}\n", .{ connection, event.*.unnamed_0.SHUTDOWN_INITIATED_BY_TRANSPORT.Status });
                    }
                },
                MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_PEER => {
                    conn_ptr.rw_lock.lock();
                    defer conn_ptr.rw_lock.unlock();
                    conn_ptr.state = .Closing;
                    // The connection was explicitly shut down by the peer.
                    std.debug.print("conn={any} shut down by peer err={x}\n", .{ connection, event.*.unnamed_0.SHUTDOWN_INITIATED_BY_PEER.ErrorCode });
                },
                MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => {
                    conn_ptr.rw_lock.lock();
                    defer conn_ptr.rw_lock.unlock();
                    conn_ptr.state = .Closed;
                    std.debug.print("conn={any} All done\n", .{connection});
                    if (!event.*.unnamed_0.SHUTDOWN_COMPLETE.AppCloseInProgress) {
                        std.debug.print("Closing conn\n", .{});
                        self.transport.msquic.getQuicAPI().ConnectionClose.?(connection);
                    }
                },
                MsQuic.QUIC_CONNECTION_EVENT_RESUMPTION_TICKET_RECEIVED => {
                    const resumption_ticket = event.*.unnamed_0.RESUMPTION_TICKET_RECEIVED;
                    std.debug.print("conn={any} Resumption ticket received\n", .{connection});
                    var i: usize = 0;
                    while (i < resumption_ticket.ResumptionTicketLength) : (i += 1) {
                        std.debug.print("{x}", .{resumption_ticket.ResumptionTicket[i]});
                    }
                    std.debug.print("\n", .{});
                },
                MsQuic.QUIC_CONNECTION_EVENT_PEER_STREAM_STARTED => {
                    const handle = self.transport.stream_system.handle_allocator.allocSlot() catch {
                        std.debug.print("Failed to allocate stream. dropping\n", .{});
                        return MsQuic.QuicStatus.InternalError;
                    };
                    var stream = self.transport.stream_system.handle_allocator.getPtr(handle) catch {
                        unreachable;
                    };
                    stream.* = Stream.init(self.transport.allocator, self.transport, true);

                    var stream_context = self.transport.allocator.create(Stream.StreamContext) catch {
                        std.debug.print("Failed to allocate stream context. dropping\n", .{});
                        return MsQuic.QuicStatus.InternalError;
                    };
                    // TODO dealloc on errors
                    stream_context.* = Stream.StreamContext{
                        .handle = handle,
                        .transport = self.transport,
                        .accept_lock = std.event.Lock.initLocked(),
                    };

                    self.transport.msquic.getQuicAPI().SetCallbackHandler.?(
                        event.*.unnamed_0.PEER_STREAM_STARTED.Stream,
                        Stream.StreamContext.cCallback,
                        stream_context,
                    );

                    var stream_queue_node = self.transport.allocator.create(Connection.StreamQueue.Node) catch {
                        std.debug.print("Failed to allocate stream queue node. dropping\n", .{});
                        return MsQuic.QuicStatus.InternalError;
                    };
                    stream_queue_node.* = Connection.StreamQueue.Node{ .data = handle };

                    // TODO drop streams if too many.
                    conn_ptr.ready_streams.put(stream_queue_node);
                    if (conn_ptr.pending_accepts.get()) |pending_accept| {
                        resume (pending_accept.data);
                    }
                },
                else => {
                    std.debug.print("conn={any} Unknown event: {}\n", .{ connection, event.*.Type });
                },
            }

            return 0;
        }
    };

    const Connection = struct {
        connection_handle: MsQuic.HQUIC,
        rw_lock: std.Thread.RwLock,
        state: enum {
            Connecting,
            Connected,
            Closing,
            Closed,
            ErrProtocolNegotiationFailed,
        },
        is_inbound: bool,
        // Unlocked when there's a peer_id
        peer_id_lock: std.event.Lock = std.event.Lock.initLocked(),
        peer_id: ?crypto.PeerID = null,
        peer_address: ?std.net.Address = null,
        ready_streams: StreamQueue,
        pending_accepts: PendingStreamAcceptQueue,

        // So that you can dealloc this
        fut: Fut,

        const Fut = std.event.Future(void);
        const StreamQueue = std.atomic.Queue(StreamSystem.Handle);
        const PendingStreamAcceptQueue = std.atomic.Queue(anyframe);

        fn init(is_inbound: bool) !Connection {
            var self = Connection{
                .rw_lock = .{},
                .is_inbound = is_inbound,
                .state = .Connecting,
                .connection_handle = undefined,
                .ready_streams = StreamQueue.init(),
                .pending_accepts = PendingStreamAcceptQueue.init(),
                .fut = Fut.init(),
            };
            return self;
        }

        pub fn deinit(self: *Connection, allocator: Allocator, transport: *MsQuicTransport) void {
            if (self.state == .Connected) {
                _ = transport.msquic.getQuicAPI().ConnectionClose.?(self.connection_handle);
            }
            self.state = .Closing;
            var ready_streams = self.ready_streams;
            var pending_accepts = self.pending_accepts;
            while (ready_streams.get()) |node| {
                allocator.destroy(node);
            }
            while (pending_accepts.get()) |node| {
                resume node.data;
            }
        }

        pub fn acceptStream(self: *Connection, allocator: Allocator) !StreamSystem.Handle {
            var pending_node = try allocator.create(PendingStreamAcceptQueue.Node);
            defer {
                allocator.destroy(pending_node);
            }
            pending_node.* = PendingStreamAcceptQueue.Node{
                .data = @frame(),
            };

            while (true) {
                if (self.ready_streams.get()) |ready_stream| {
                    const handle = ready_stream.data;
                    allocator.destroy(ready_stream);
                    return handle;
                }

                suspend {
                    self.pending_accepts.put(pending_node);
                }

                if (self.state == .Closed or self.state == .Closing) {
                    return error.ConnectionClosed;
                }
            }
        }

        pub fn close(self: *Connection, transport: *MsQuicTransport) !void {
            // TODO test this
            var status = transport.msquic.getQuicAPI().ConnectionClose.?(self.connection_handle);
            if (MsQuic.QuicStatus.isError(status)) {
                std.debug.print("conn close failed: {x}\n", .{status});
                return error.ConnCloseFailed;
            }
        }

        pub fn newStream(self: *Connection, transport: *MsQuicTransport) !StreamSystem.Handle {
            const stream_handle = try transport.stream_system.handle_allocator.allocSlot();
            const stream = try transport.stream_system.handle_allocator.getPtr(stream_handle);
            stream.* = Stream.init(transport.allocator, transport, false);
            errdefer stream.deinit(transport.allocator);

            var context = try transport.allocator.create(Stream.StreamContext);
            context.* = Stream.StreamContext{ .handle = stream_handle, .transport = transport, .accept_lock = null };
            errdefer transport.allocator.destroy(context);

            var status = transport.msquic.getQuicAPI().StreamOpen.?(
                self.connection_handle,
                MsQuic.QUIC_STREAM_OPEN_FLAG_NONE,
                Stream.StreamContext.cCallback,
                context,
                &stream.msquic_stream_handle,
            );
            if (MsQuic.QuicStatus.isError(status)) {
                std.debug.print("Stream open failed: {x}\n", .{status});
                return error.StreamOpenFailed;
            }
            errdefer transport.msquic.getQuicAPI().StreamClose.?(stream.msquic_stream_handle);

            // Starts the bidirectional stream. By default, the peer is not notified of
            // the stream being started until data is sent on the stream.
            status = transport.msquic.getQuicAPI().StreamStart.?(stream.msquic_stream_handle, MsQuic.QUIC_STREAM_START_FLAG_NONE);
            if (MsQuic.QuicStatus.isError(status)) {
                std.debug.print("Stream start failed: {x}\n", .{status});
                return error.StreamStartFailed;
            }

            return stream_handle;
        }
    };

    pub const Stream = struct {
        send_flags: c_uint = 0,
        transport: *MsQuicTransport,
        msquic_stream_handle: MsQuic.HQUIC,
        is_inbound: bool,
        // TODO initialize this with one
        waiting_recv: RecvQFutPtr,
        // TODO initialize this with one
        ready_recv: RecvQ,
        // TODO change these to a linked list since we ahve the state mutex up here.
        recv_frames: RecvFrameQ,
        recv_frame_buffer: RecvFrameQ,
        recv_frame_pending: RecvFrameQ = RecvFrameQ.init(),
        state_mutex: std.Thread.Mutex,
        state: packed struct {
            closed: bool = false,
            recv_deferred: bool = false,
        },

        pub const Writer = std.io.Writer(*Stream, SendError, send);
        pub const Reader = std.io.Reader(*Stream, ReadError, recv);

        const RecvFrameQ = std.atomic.Queue(struct {
            frame: anyframe,
            leased_buf: LeasedBuffer,
        });
        const RecvQ = std.atomic.Queue(LeasedBufferFut);
        const RecvQFutPtr = std.atomic.Queue(*LeasedBufferFut);
        const LeasedBufferFut = std.event.Future(LeasedBuffer);
        const LeasedBuffer = struct {
            buf: []u8,
            state: LeasedBufferState,

            const LeasedBufferState = packed struct {
                active_lease: bool = true,
                msquic_pending: bool = false,
                stream_closed: bool = false,
                reserved: u5 = 0,
            };

            inline fn atomicStateUpdate(
                self: *LeasedBuffer,
                next_state: LeasedBufferState,
                comptime op: std.builtin.AtomicRmwOp,
            ) LeasedBufferState {
                const next_state_int = @bitCast(u8, next_state);
                const prev_state_int = @atomicRmw(u8, @ptrCast(*u8, &self.state), op, next_state_int, .SeqCst);
                return @bitCast(LeasedBufferState, prev_state_int);
            }

            fn waitForNextTick() void {
                var tick_node = Loop.NextTickNode{
                    .prev = undefined,
                    .next = undefined,
                    .data = @frame(),
                };

                suspend {
                    global_event_loop.onNextTick(&tick_node);
                }
                std.debug.print("Starting up again on main thread(s)\n", .{});
            }

            pub fn releaseAndWaitForNextTick(self: *LeasedBuffer, transport: *MsQuicTransport, stream: *Stream) void {
                self.release(transport, stream);
                waitForNextTick();
            }

            pub fn release(self: *LeasedBuffer, transport: *const MsQuicTransport, stream: *Stream) void {
                // TODO remove transport param
                const prev_state = self.atomicStateUpdate(LeasedBufferState{
                    .active_lease = false,
                    .msquic_pending = true,
                    .reserved = 0,
                }, .And);

                if (prev_state.msquic_pending) {
                    // We hit a suspend before releasing. So now we're in charge
                    // of telling msquic we are done with this buffer.
                    if (stream.recv_frame_pending.get()) |pending_recv_frame| {
                        if (&pending_recv_frame.data.leased_buf != self) {
                            @panic("Unexpected pending recv frame");
                        }
                        _ = self.atomicStateUpdate(LeasedBufferState{
                            .active_lease = false,
                            .msquic_pending = false,
                            .reserved = 0,
                        }, .Xchg);

                        stream.recv_frame_buffer.put(pending_recv_frame);
                    } else {
                        @panic("Missing pending recv frame for async release");
                    }

                    transport.msquic.getQuicAPI().StreamReceiveComplete.?(stream.msquic_stream_handle, self.buf.len);
                }

                // transport.msquic.getQuicAPI().StreamReceiveComplete.?(stream.msquic_stream_handle, self.buf.len);
                // TODO reuse these leased buffers
                // transport.allocator.destroy(self);
            }
        };

        fn init(allocator: Allocator, transport: *MsQuicTransport, is_inbound: bool) Stream {
            var self = Stream{
                .transport = transport,
                .state = .{},
                .state_mutex = std.Thread.Mutex{},
                .msquic_stream_handle = undefined,
                .is_inbound = is_inbound,
                .waiting_recv = RecvQFutPtr.init(),
                .ready_recv = RecvQ.init(),
                .recv_frames = RecvFrameQ.init(),
                .recv_frame_buffer = RecvFrameQ.init(),
            };
            const recvq_node = allocator.create(RecvQ.Node) catch {
                @panic("Failed to allocate recv buffer");
            };
            const recvq_node_fut_ptr = allocator.create(RecvQFutPtr.Node) catch {
                @panic("Failed to allocate recv buffer");
            };
            const buffer_size = 3;
            var i: usize = 0;
            while (i < buffer_size) : (i += 1) {
                const recv_frame = allocator.create(RecvFrameQ.Node) catch {
                    @panic("Failed to allocate recv frame");
                };
                self.recv_frame_buffer.put(recv_frame);
            }

            recvq_node.* = RecvQ.Node{ .data = LeasedBufferFut.init() };
            recvq_node_fut_ptr.* = RecvQFutPtr.Node{ .data = &recvq_node.data };
            self.waiting_recv.put(recvq_node_fut_ptr);
            self.ready_recv.put(recvq_node);

            return self;
        }

        pub fn deinit(self: *Stream, allocator: Allocator) void {
            // TODO anything else?
            var waiting_recv = self.waiting_recv;
            var ready_recv = self.ready_recv;
            var recv_frames = self.recv_frames;
            var recv_frame_buffer = self.recv_frame_buffer;
            var recv_frame_pending = self.recv_frame_pending;

            while (waiting_recv.get()) |node| {
                allocator.destroy(node);
            }
            while (ready_recv.get()) |node| {
                allocator.destroy(node);
            }
            while (recv_frames.get()) |node| {
                _ = node.data.leased_buf.atomicStateUpdate(LeasedBuffer.LeasedBufferState{
                    .active_lease = false,
                    .msquic_pending = false,
                    .stream_closed = true,
                    .reserved = 0,
                }, .Xchg);

                // TODO investigate this crash
                // Crashes because we don't know if the caller still holds this frame.
                resume node.data.frame;
                allocator.destroy(node);
            }
            while (recv_frame_buffer.get()) |node| {
                allocator.destroy(node);
            }
            while (recv_frame_pending.get()) |node| {
                allocator.destroy(node);
            }
        }

        pub fn shutdownNow(self: *Stream) !void {
            var status = self.transport.msquic.getQuicAPI().StreamShutdown.?(self.msquic_stream_handle, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT | MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_IMMEDIATE, 0);
            if (MsQuic.QuicStatus.isError(status)) {
                return error.ShutdownFailed;
            }
        }

        const SendError = error{ StreamSendFailed, StreamClosed };

        fn sendWithFlags(self: *Stream, buf: []const u8, flags: c_uint) SendError!usize {
            {
                self.state_mutex.lock();
                defer self.state_mutex.unlock();
                if (self.state.closed) {
                    return SendError.StreamClosed;
                }
            }
            var lock = std.event.Lock.initLocked();

            // Hack to keep buf as const! (unsafe)
            var buf_ptr = @ptrToInt(buf.ptr);

            const quic_buf = MsQuic.QUIC_BUFFER{
                .Buffer = buf_ptr,
                .Length = @intCast(u32, buf.len),
            };
            const status = self.transport.msquic.getQuicAPI().StreamSend.?(
                self.msquic_stream_handle,
                &quic_buf,
                1,
                flags,
                &lock,
            );

            if (MsQuic.QuicStatus.isError(status)) {
                std.debug.print("Stream send failed: {x}\n", .{status});
                return SendError.StreamSendFailed;
            }

            const held = lock.acquire();
            held.release();

            return buf.len;
        }

        pub fn setDelaySendFlag(self: *Stream) void {
            self.send_flags = MsQuic.QUIC_SEND_FLAG_DELAY_SEND;
        }

        pub fn resetFlags(self: *Stream) void {
            self.send_flags = MsQuic.QUIC_SEND_FLAG_NONE;
        }

        pub fn send(self: *Stream, buf: []const u8) SendError!usize {
            return self.sendWithFlags(buf, self.send_flags);
        }

        pub fn flush(self: *Stream) SendError!usize {
            return self.sendWithFlags([0]u8[0..], MsQuic.QUIC_SEND_FLAG_NONE);
        }

        pub fn recvWithLease(self: *Stream) !*LeasedBuffer {
            {
                self.state_mutex.lock();
                defer self.state_mutex.unlock();
                if (self.state.closed) {
                    return error.StreamClosed;
                }
            }

            if (self.recv_frame_buffer.get()) |recv_frame| {
                var was_deferred = blk: {
                    self.state_mutex.lock();
                    defer self.state_mutex.unlock();

                    recv_frame.data.frame = @frame();
                    // std.debug.print("Inserting frame! {any}\n", .{@frame()});
                    self.recv_frames.put(recv_frame);
                    var was_deferred = self.state.recv_deferred;
                    // TODO is this right place for this?
                    self.state.recv_deferred = false;
                    break :blk was_deferred;
                };

                if (was_deferred) {
                    // We deferred a receive in the past, so tell msquic we are ready to recv
                    std.debug.print("Had to enable recv\n", .{});
                    _ = self.transport.msquic.getQuicAPI().StreamReceiveSetEnabled.?(self.msquic_stream_handle, @as(u8, @boolToInt(true)));
                }

                suspend {}
                // std.debug.print("Resume recv\n", .{});
                if (recv_frame.data.leased_buf.state.stream_closed) {
                    return error.StreamClosed;
                }
                return &recv_frame.data.leased_buf;
            } else {
                @panic("TODO implement. caller should allocate instead (maybe");
            }
        }

        const ReadError = error{ StreamReadFailed, StreamClosed };

        /// Classic recv function. Not as fast as recvWithLease since it copies
        /// to the buffer. Prefer recvWithLease if perf is important.
        fn recv(self: *Stream, buffer: []u8) ReadError!usize {
            var bytes_read: usize = buffer.len;
            {
                const leased_buf = try self.recvWithLease();
                defer leased_buf.release(self.transport, self);

                if (leased_buf.buf.len > buffer.len) {
                    // trim the leased buffer if we aren't reading the whole thing
                    leased_buf.buf.len = buffer.len;
                } else if (leased_buf.buf.len < buffer.len) {
                    bytes_read = leased_buf.buf.len;
                }

                std.mem.copy(u8, buffer, leased_buf.buf);
                if (bytes_read == 1) {
                    std.debug.print("Read byte: {}\n", .{buffer[0]});
                } else {
                    std.debug.print("Read {} bytes: {s}\n", .{ bytes_read, buffer[0..bytes_read] });
                }
            }

            return bytes_read;
        }

        const StreamContext = struct {
            handle: StreamSystem.Handle,
            transport: *MsQuicTransport,
            accept_lock: ?std.event.Lock,

            fn cCallback(msquic_stream: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
                const self = @ptrCast(*StreamContext, @alignCast(@alignOf(StreamContext), self_ptr));
                defer {
                    switch (event.*.Type) {
                        MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                            self.deinit();
                            self.transport.allocator.destroy(self);
                        },
                        else => {},
                    }
                }
                return self.callback(msquic_stream, event);
            }

            // Same as above, but this context has the node.
            // TODO can I remove?
            fn cCallbackWithNode(msquic_stream: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) c_uint {
                const self = @ptrCast(*Connection.StreamQueue.Node, @alignCast(@alignOf(Connection.StreamQueue.Node), self_ptr));
                defer {
                    switch (event.*.Type) {
                        MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                            self.data.deinit();
                            self.data.transport.allocator.destroy(self);
                        },
                        else => {},
                    }
                }
                return self.data.callback(msquic_stream, event);
            }

            inline fn callback(self: StreamContext, msquic_stream: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) c_uint {
                const stream_handle = self.handle;

                var stream_ptr = self.transport.stream_system.handle_allocator.getPtr(stream_handle) catch {
                    std.debug.print("Stream callback: stream handle not found\n", .{});
                    return MsQuic.QuicStatus.InternalError;
                };
                if (stream_ptr.msquic_stream_handle != msquic_stream) {
                    stream_ptr.msquic_stream_handle = msquic_stream;
                }

                switch (event.*.Type) {
                    MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                        // A previous StreamSend call has completed, and the context is being
                        // returned back to the app.

                        if (event.*.unnamed_0.SEND_COMPLETE.ClientContext) |client_context| {
                            const lock = @ptrCast(*Lock, @alignCast(@alignOf(Lock), client_context));
                            Lock.Held.release(Lock.Held{ .lock = lock });
                        }
                    },
                    MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                        const limit = event.*.unnamed_0.RECEIVE.BufferCount;
                        var i: usize = 0;
                        var consumed_bytes: usize = 0;
                        var reprocess_buf = false;
                        var buf = event.*.unnamed_0.RECEIVE.Buffers[0];
                        while (i < limit) : (if (reprocess_buf) {
                            reprocess_buf = false;
                        } else {
                            i += 1;
                            buf = event.*.unnamed_0.RECEIVE.Buffers[0];
                        }) {
                            var maybe_recv_frame = blk: {
                                stream_ptr.state_mutex.lock();
                                defer stream_ptr.state_mutex.unlock();
                                var f = stream_ptr.recv_frames.get();
                                if (f == null) {
                                    stream_ptr.state.recv_deferred = true;
                                }
                                break :blk f;
                            };
                            if (maybe_recv_frame) |recv_frame| {
                                // Return this node to our buffer queue.
                                // TODO this should happen in the recvWithLease

                                const slice = buf.Buffer[0..buf.Length];
                                recv_frame.data.leased_buf = LeasedBuffer{ .buf = slice, .state = .{ .active_lease = true } };
                                // std.debug.print("In stream callback. Buf len is {}. Frame is {any}\n", .{ slice.len, &recv_frame.data.frame });
                                resume recv_frame.data.frame;
                                // std.debug.print("done resuming stream callback. Buf len is {}. Frame is {any}\n", .{ slice.len, &recv_frame.data.frame });

                                const prev_state = recv_frame.data.leased_buf.atomicStateUpdate(LeasedBuffer.LeasedBufferState{
                                    .active_lease = false,
                                    // If the lease isn't active, we set the
                                    // msquic_pending to true. But that's fine.
                                    // because nothing will read this again.
                                    .msquic_pending = true,
                                    .reserved = 0,
                                }, .Or);
                                if (prev_state.active_lease) {
                                    // The caller kept the buffer past a
                                    // suspend. We'll tell msquic we're still
                                    // processing it.  And rely on the caller to
                                    // tell msquic to continue
                                    stream_ptr.recv_frame_pending.put(recv_frame);

                                    return @bitCast(c_uint, @as(c_int, MsQuic.QuicStatus.Pending));
                                } else {
                                    const bytes_consumed = recv_frame.data.leased_buf.buf.len;
                                    // We were active, so we need to return the buffer to the pool.

                                    _ = recv_frame.data.leased_buf.atomicStateUpdate(LeasedBuffer.LeasedBufferState{
                                        .active_lease = false,
                                        .msquic_pending = false,
                                        .reserved = 0,
                                    }, .Xchg);

                                    recv_frame.data.frame = undefined;
                                    stream_ptr.recv_frame_buffer.put(recv_frame);

                                    // std.debug.print("recv consumed {} out of {}\n", .{ bytes_consumed, buf.Length });

                                    if (bytes_consumed < buf.Length) {
                                        // Didn't read the whole thing.
                                        consumed_bytes += bytes_consumed;
                                        // Move up our buffer slice
                                        buf.Buffer += bytes_consumed;
                                        buf.Length -= @intCast(u32, bytes_consumed);

                                        // process this buf again with the next receive.
                                        reprocess_buf = true;
                                    } else {
                                        consumed_bytes += buf.Length;
                                    }
                                }
                                // TODO return 0 read and wait
                            } else {
                                std.debug.print("Deferring recv. Consumed {} bytes\n", .{consumed_bytes});
                                event.*.unnamed_0.RECEIVE.TotalBufferLength = consumed_bytes;
                            }
                        }
                    },
                    MsQuic.QUIC_STREAM_EVENT_PEER_RECEIVE_ABORTED => {
                        std.debug.print("strm={any} peer recv aborted\n", .{msquic_stream});
                        stream_ptr.shutdownNow() catch |err| {
                            std.debug.print("Error in shutting down stream: {}", .{err});
                        };
                    },
                    MsQuic.QUIC_STREAM_EVENT_PEER_SEND_ABORTED => {
                        std.debug.print("strm={any} peer send aborted\n", .{msquic_stream});
                    },
                    MsQuic.QUIC_STREAM_EVENT_PEER_SEND_SHUTDOWN => {
                        std.debug.print("strm={any} peer shutdown\n", .{msquic_stream});
                    },
                    MsQuic.QUIC_STREAM_EVENT_SEND_SHUTDOWN_COMPLETE => {},
                    MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                        std.debug.print("strm={any} all done\n", .{msquic_stream});
                        if (!event.*.unnamed_0.SHUTDOWN_COMPLETE.AppCloseInProgress) {
                            self.transport.msquic.getQuicAPI().StreamClose.?(msquic_stream);
                            {
                                stream_ptr.state_mutex.lock();
                                defer stream_ptr.state_mutex.unlock();
                                stream_ptr.state.closed = true;
                            }

                            stream_ptr.deinit(self.transport.allocator);
                        }
                    },
                    else => {
                        std.debug.print("stream={any} Unknown event: {}\n", .{ msquic_stream, event.*.Type });
                    },
                }

                return MsQuic.QuicStatus.Success;
            }

            fn deinit(self: *StreamContext) void {
                self.transport.stream_system.handle_allocator.freeSlot(self.handle) catch {
                    @panic("StreamContext deinit: handle not found");
                };
            }
        };
    };

    pub const Listener = struct {
        transport: *MsQuicTransport,
        listener_handle: MsQuic.HQUIC,
        configuration: *const MsQuic.HQUIC,
        registration: *const MsQuic.HQUIC,
        connection_queue: ConnQueue,
        ready_connection_queue: ConnQueue,
        pending_accepts: std.atomic.Queue(anyframe),
        allocator: Allocator,
        state: enum {
            Active,
            Closing,
            Closed,
        } = .Active,

        const ConnQueue = std.atomic.Queue(ConnectionContext);

        pub fn init(allocator: Allocator, transport: *MsQuicTransport, msquic: MsQuicHandle, registration: *const MsQuic.HQUIC, configuration: *const MsQuic.HQUIC, addr: std.net.Address, connection_buffer_size: u8) !ListenerSystem.Handle {
            var listener = try transport.listener_system.handle_allocator.allocSlot();
            var listener_ptr = try transport.listener_system.handle_allocator.getPtr(listener);
            listener_ptr.* = Listener{
                .listener_handle = undefined,
                .transport = transport,
                .configuration = configuration,
                .registration = registration,
                .connection_queue = ConnQueue.init(),
                .ready_connection_queue = ConnQueue.init(),
                .pending_accepts = std.atomic.Queue(anyframe).init(),
                .allocator = allocator,
            };

            var i: usize = 0;
            while (i < connection_buffer_size) : (i += 1) {
                var conn_handle = try transport.connection_system.handle_allocator.allocSlot();
                var conn = try allocator.create(ConnQueue.Node);
                const connection_context = ConnectionContext{
                    .connection_handle = conn_handle,
                    .transport = transport,
                };
                conn.* = ConnQueue.Node{ .data = connection_context };
                listener_ptr.connection_queue.put(conn);
            }

            if (MsQuic.QuicStatus.isError(msquic.getQuicAPI().ListenerOpen.?(
                registration.*,
                Listener.listenerCallback,
                listener_ptr,
                &listener_ptr.listener_handle,
            ))) {
                return error.ListenerOpenFailed;
            }

            // var addr_quic = @as(MsQuic.QUIC_ADDR, addr);
            // var addr_quic_ptr = @ptrCast(*const MsQuic.QUIC_ADDR, &addr);
            // TODO this is properly
            var quic_addr = std.mem.zeroes(MsQuic.QUIC_ADDR);
            MsQuic.QuicAddrSetFamily(&quic_addr, MsQuic.QUIC_ADDRESS_FAMILY_UNSPEC);
            MsQuic.QuicAddrSetPort(&quic_addr, addr.getPort());

            const status = msquic.getQuicAPI().ListenerStart.?(
                listener_ptr.listener_handle,
                &alpn,
                1,
                &quic_addr,
            );
            if (MsQuic.QuicStatus.isError(status)) {
                std.debug.print("Listener failed: {}\n", .{status});

                return error.ListenerStartFailed;
            }
            std.debug.print("starting listener\n", .{});
            return listener;
        }

        pub fn deinit(self: *Listener) void {
            self.state = .Closing;
            defer self.transport.msquic.getQuicAPI().ListenerClose.?(self.listener_handle);
            while (self.connection_queue.get()) |conn| {
                self.transport.connection_system.handle_allocator.freeSlot(conn.data.connection_handle) catch {
                    @panic("Tried to free stale handle");
                };
                self.allocator.destroy(conn);
            }
            while (self.ready_connection_queue.get()) |conn| {
                self.transport.connection_system.handle_allocator.freeSlot(conn.data.connection_handle) catch {
                    @panic("Tried to free stale handle");
                };
                self.allocator.destroy(conn);
            }

            while (self.pending_accepts.get()) |frame_node| {
                resume frame_node.data;
            }
        }

        pub fn deinitHandle(self: ListenerSystem.Handle, transport: *MsQuicTransport) void {
            var listener_ptr = transport.listener_system.handle_allocator.getPtr(self) catch {
                std.debug.print("lost pointer\n", .{});
                return;
            };
            listener_ptr.deinit();
            transport.listener_system.handle_allocator.freeSlot(self) catch {
                unreachable;
            };
        }

        fn listenerCallback(listener: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_LISTENER_EVENT) callconv(.C) c_uint {
            std.debug.print("Self is {*}\n", .{self_ptr});
            defer std.debug.print("defer Self is {*}\n", .{self_ptr});
            const self: *Listener = @ptrCast(*Listener, @alignCast(@alignOf(Listener), self_ptr));

            var status = @bitCast(u32, MsQuic.EOPNOTSUPP);
            _ = listener;
            std.debug.print("\nlistener Event: {any}\n", .{event.*.Type});

            switch (event.*.Type) {
                MsQuic.QUIC_LISTENER_EVENT_NEW_CONNECTION => {
                    var conn_handle_node = self.connection_queue.get() orelse {
                        std.debug.print("Dropping connection. No buffered conns available\n", .{});
                        // TODO what's the correct code to return here?
                        return 0;
                    };

                    std.debug.print("put conn in ready {*} \n", .{conn_handle_node});
                    self.ready_connection_queue.put(conn_handle_node);

                    std.debug.print("Creating new connection\n", .{});
                    var conn_ptr = self.transport.connection_system.handle_allocator.getPtr(conn_handle_node.data.connection_handle) catch {
                        std.debug.print("Stale connection handle!", .{});
                        return MsQuic.QuicStatus.InternalError;
                    };
                    conn_ptr.* = Connection.init(true) catch {
                        std.debug.print("Failed to allocate connection", .{});
                        return MsQuic.QuicStatus.InternalError;
                    };
                    const remote_addr_sa = event.*.unnamed_0.NEW_CONNECTION.Info.*.RemoteAddress;
                    var socket_addr = std.x.os.Socket.Address.fromNative(@ptrCast(*const std.os.sockaddr, remote_addr_sa));
                    const addr: std.net.Address = switch (socket_addr) {
                        .ipv4 => std.net.Address.initIp4(socket_addr.ipv4.host.octets, socket_addr.ipv4.port),
                        .ipv6 => std.net.Address.initIp6(socket_addr.ipv6.host.octets, socket_addr.ipv4.port, 0, socket_addr.ipv6.host.scope_id),
                    };
                    conn_ptr.*.peer_address = addr;

                    self.transport.msquic.getQuicAPI().SetCallbackHandler.?(
                        event.*.unnamed_0.NEW_CONNECTION.Connection,
                        ConnectionContext.cCallbackWithNode,
                        conn_handle_node,
                    );
                    status = self.transport.msquic.getQuicAPI().ConnectionSetConfiguration.?(
                        event.*.unnamed_0.NEW_CONNECTION.Connection,
                        self.configuration.*,
                    );

                    // TODO is there a race here?
                    if (self.pending_accepts.get()) |pending_accept| {
                        resume pending_accept.data;
                    }
                },
                else => {
                    std.debug.print("listener Unknown event: {}\n", .{event.*.Type});
                },
            }

            return status;
        }

        // Accept a connection
        pub fn accept(self: *Listener) !ConnectionSystem.Handle {
            std.debug.print("\nSelf in accept is {*}\n", .{self});
            while (true) {
                if (self.ready_connection_queue.get()) |ready_conn| {
                    const conn_context = ready_conn.*.data;
                    // Wait for connection to be ready
                    var conn_ptr = try self.transport.connection_system.handle_allocator.getPtr(conn_context.connection_handle);

                    _ = conn_ptr.fut.get();
                    // Wait for a peer id to be attached
                    const held = conn_ptr.peer_id_lock.acquire();
                    held.release();
                    return conn_context.connection_handle;
                }

                var frame_node = std.atomic.Queue(anyframe).Node{
                    .data = @frame(),
                };

                suspend {
                    self.pending_accepts.put(&frame_node);
                }

                if (self.state == .Closed or self.state == .Closing) {
                    return error.ListenerClosed;
                }
            }
        }
    };

    // A handle instead of a pointer for the connection. Different than MsQuic.hquic

    pub const ConnectionSystem = struct {
        pub const Handle = HandleAllocator(Connection).Handle;
        handle_allocator: HandleAllocator(Connection),

        fn init(allocator: Allocator) ConnectionSystem {
            return ConnectionSystem{
                .handle_allocator = HandleAllocator(Connection).init(allocator),
            };
        }

        fn deinit(self: ConnectionSystem) void {
            self.handle_allocator.deinit();
        }
    };

    pub const StreamSystem = struct {
        pub const Handle = HandleAllocator(Stream).Handle;
        handle_allocator: HandleAllocator(Stream),

        fn init(allocator: Allocator) StreamSystem {
            return StreamSystem{
                .handle_allocator = HandleAllocator(Stream).init(allocator),
            };
        }

        fn deinit(self: StreamSystem) void {
            self.handle_allocator.deinit();
        }
    };

    pub const ListenerSystem = struct {
        pub const Handle = HandleAllocator(Listener).Handle;
        handle_allocator: HandleAllocator(Listener),

        fn init(allocator: Allocator) ListenerSystem {
            return ListenerSystem{
                .handle_allocator = HandleAllocator(Listener).init(allocator),
            };
        }

        fn deinit(self: ListenerSystem) void {
            self.handle_allocator.deinit();
        }
    };

    allocator: Allocator,
    msquic: MsQuicHandle,
    registration: MsQuic.HQUIC,
    configuration: MsQuic.HQUIC,
    listener_system: ListenerSystem,
    connection_system: ConnectionSystem,
    stream_system: StreamSystem,

    pub const Options = struct {
        cred_flags: MsQuic.QUIC_CREDENTIAL_FLAGS = 0,

        pub fn default() Options {
            return Options{
                // We do the cert validation ourselves with https://github.com/libp2p/specs/blob/master/tls/tls.md
                .cred_flags = MsQuic.QUIC_CREDENTIAL_FLAG_NO_CERTIFICATE_VALIDATION,
            };
        }
    };

    pub fn init(allocator: Allocator, app_name: [:0]const u8, pkcs12: *crypto.PKCS12, options: Options) !Self {
        // Workaround a bug in the zig compiler. It loses this symbol.
        var max_mem = workaround.CGroupGetMemoryLimit();
        _ = max_mem;

        var msquic: *const MsQuic.QUIC_API_TABLE = undefined;
        const msQuicPtr = @ptrCast([*c]?*const anyopaque, &msquic);
        var status = MsQuic.MsQuicOpenVersion(MsQuic.QUIC_API_VERSION_2, msQuicPtr);
        if (status > 0) {
            std.debug.print("MsQuicOpen failed: {}\n", .{status});
            return error.OpenFailed;
        }

        const reg_config = MsQuic.QUIC_REGISTRATION_CONFIG{
            .AppName = app_name,
            .ExecutionProfile = MsQuic.QUIC_EXECUTION_PROFILE_LOW_LATENCY,
        };
        var registration: MsQuic.HQUIC = undefined;
        status = msquic.RegistrationOpen.?(&reg_config, &registration);
        if (status > 0) {
            std.debug.print("registration failed: {}\n", .{status});
            return error.RegistrationFailed;
        }

        const configuration = try loadConfiguration(msquic, &registration, pkcs12, options);
        const handle = msquic_instances.pushInstance(msquic);

        return MsQuicTransport{
            .allocator = allocator,
            .msquic = handle,
            .registration = registration,
            .configuration = configuration,
            .listener_system = ListenerSystem.init(allocator),
            .connection_system = ConnectionSystem.init(allocator),
            .stream_system = StreamSystem.init(allocator),
        };
    }

    pub fn deinit(self: *const Self) void {
        self.msquic.getQuicAPI().ConfigurationClose.?(self.configuration);
        self.msquic.getQuicAPI().RegistrationClose.?(self.registration);
        MsQuic.MsQuicClose(self.msquic.getQuicAPI());
        self.listener_system.deinit();
        self.connection_system.deinit();
        self.stream_system.deinit();
    }

    fn loadConfiguration(msquic: *const MsQuic.QUIC_API_TABLE, registration: *MsQuic.HQUIC, pkcs12: *crypto.PKCS12, options: Options) !MsQuic.HQUIC {
        var settings = std.mem.zeroes(MsQuic.QuicSettings);

        settings.IdleTimeoutMs = 5000;
        settings.IsSet.IdleTimeoutMs = true;

        // Configures the server's resumption level to allow for resumption and
        // 0-RTT.
        settings.ServerResumptionLevel = MsQuic.QUIC_SERVER_RESUME_AND_ZERORTT;
        settings.IsSet.ServerResumptionLevel = true;

        // Configures the server's settings to allow for the peer to open a single
        // bidirectional stream. By default connections are not configured to allow
        // any streams from the peer.
        settings.PeerBidiStreamCount = 1024;
        settings.IsSet.PeerBidiStreamCount = true;

        var cred_helper = CredentialConfigHelper{
            .cred_config = std.mem.zeroes(MsQuic.QUIC_CREDENTIAL_CONFIG),
            .cert = undefined,
        };

        cred_helper.cred_config.Flags = MsQuic.QUIC_CREDENTIAL_FLAG_NONE;

        var pkcs12_bytes = [_]u8{0} ** 1024;
        const pkcs12_len = try pkcs12.read(pkcs12_bytes[0..]);
        const pkcs12_slice = pkcs12_bytes[0..pkcs12_len];
        std.debug.print("pkcs12_len: {}\n", .{pkcs12_len});

        cred_helper.cert.Asn1Blob = pkcs12_slice.ptr;
        cred_helper.cert.Asn1BlobLength = @intCast(u32, pkcs12_slice.len);
        cred_helper.cert.PrivateKeyPassword = "";
        cred_helper.cred_config.Type = MsQuic.QUIC_CREDENTIAL_TYPE_CERTIFICATE_PKCS12;
        cred_helper.cred_config.CertPtr.CertificatePkcs12 = &cred_helper.cert;
        cred_helper.cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_USE_PORTABLE_CERTIFICATES;
        cred_helper.cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_INDICATE_CERTIFICATE_RECEIVED;
        cred_helper.cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_REQUIRE_CLIENT_AUTHENTICATION;
        cred_helper.cred_config.Flags |= options.cred_flags;

        var configuration: MsQuic.HQUIC = undefined;

        if (MsQuic.QuicStatus.isError(msquic.ConfigurationOpen.?(registration.*, &alpn, 1, &settings, @sizeOf(@TypeOf(settings)), null, &configuration))) {
            return error.ConfigurationFailed;
        }
        errdefer msquic.ConfigurationClose.?(configuration);

        const status = msquic.ConfigurationLoadCredential.?(configuration, &cred_helper.cred_config);
        if (MsQuic.QuicStatus.isError(status)) {
            std.debug.print("Failed to load credential: {}\n", .{status});
            return error.ConfigurationLoadCredentialFailed;
        }

        return configuration;
    }

    pub fn listen(self: *Self, allocator: Allocator, addr: std.net.Address) !ListenerSystem.Handle {
        return try Listener.init(allocator, self, self.msquic, &self.registration, &self.configuration, addr, 4);
    }

    pub fn startConnection(self: *Self, allocator: Allocator, target: [:0]const u8, port: u16) callconv(.Async) !ConnectionSystem.Handle {
        // TODO resolve DNS names

        var conn_context_ptr = try allocator.create(ConnectionContext);

        const conn_handle = try self.connection_system.handle_allocator.allocSlot();
        const conn_ptr = try self.connection_system.handle_allocator.getPtr(conn_handle);
        conn_ptr.* = try Connection.init(false);
        conn_ptr.*.peer_address = try std.net.Address.resolveIp(target, port);

        conn_context_ptr.* = ConnectionContext{
            .connection_handle = conn_handle,
            .transport = self,
        };

        if (MsQuic.QuicStatus.isError(self.msquic.getQuicAPI().ConnectionOpen.?(
            self.registration,
            ConnectionContext.cCallback,
            conn_context_ptr,
            &conn_ptr.connection_handle,
        ))) {
            std.debug.print("Conn open failed\n", .{});
            return error.ConnectionOpenFailed;
        }
        errdefer self.msquic.getQuicAPI().ConnectionClose.?(conn_ptr.connection_handle);

        const status = self.msquic.getQuicAPI().ConnectionStart.?(
            conn_ptr.connection_handle,
            self.configuration,
            MsQuic.QUIC_ADDRESS_FAMILY_UNSPEC,
            @ptrCast([*c]const u8, target),
            port,
        );
        if (MsQuic.QuicStatus.isError(status)) {
            std.debug.print("Connection start failed: {}\n", .{status});
            return error.ConnectionStartFailed;
        }

        _ = conn_ptr.fut.get();
        const held = conn_ptr.peer_id_lock.acquire();
        held.release();

        return conn_handle;
    }

    pub fn deinitConnection(self: *Self, connection: ConnectionSystem.Handle) void {
        _ = self;
        _ = connection;
        // const ptr = self.connection_system.handle_allocator.getPtr(connection);
    }
};

test "Spin up transport" {
    if (true) {
        return error.SkipZigTest;
    }
    const allocator = std.testing.allocator;

    var host_key = try crypto.ED25519KeyPair.new();
    var cert_key = try crypto.ED25519KeyPair.new();
    defer host_key.deinit();
    defer cert_key.deinit();
    var x509 = try crypto.X509.init(cert_key);
    defer x509.deinit();

    try crypto.Libp2pTLSCert.insertExtension(&x509, try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }));

    var pkcs12 = try crypto.PKCS12.init(cert_key, x509);
    defer pkcs12.deinit();

    var transport = try MsQuicTransport.init(allocator, "test", &pkcs12, MsQuicTransport.Options.default());
    defer transport.deinit();

    // TODO this should take in an allocated listener or transport should allocate a listener.
    var listener = try transport.listen(allocator, try std.net.Address.parseIp4("0.0.0.0", 54321));
    defer MsQuicTransport.Listener.deinitHandle(listener, &transport);

    const listener_ptr = try transport.listener_system.handle_allocator.getPtr(listener);
    var incoming_conn_frame = async listener_ptr.accept();

    const connection = try await async transport.startConnection(allocator, "127.0.0.1", 54321);
    // TODO dealloc connection
    std.debug.print("\ngot connection {}\n", .{connection});
    {
        var connection_ptr = try transport.connection_system.handle_allocator.getPtr(connection);
        const stream_handle = try connection_ptr.newStream(&transport);
        var stream = try transport.stream_system.handle_allocator.getPtr(stream_handle);
        std.debug.print("\nSending data\n", .{});
        var data = "Hello World".*;
        _ = try await async stream.send(data[0..]);
        std.debug.print("\nSent data\n", .{});
        const f = struct {
            fn f(stream_handle_1: MsQuicTransport.StreamSystem.Handle, closure_transport: *MsQuicTransport, conn_handle_1: MsQuicTransport.ConnectionSystem.Handle) !void {
                defer {
                    var connection_ptr_1 = closure_transport.connection_system.handle_allocator.getPtr(conn_handle_1) catch {
                        @panic("Stale handle");
                    };
                    connection_ptr_1.deinit(allocator);
                }
                var closure_stream = try closure_transport.stream_system.handle_allocator.getPtr(stream_handle_1);
                errdefer {
                    std.debug.print("\nFound error\n", .{});
                }
                var count: usize = 0;
                while (true) : (count += 1) {
                    std.debug.print("\nRead loop\n", .{});

                    const leased_buf = try await async closure_stream.recvWithLease();
                    std.debug.print("\nRead data {s}\n", .{leased_buf.buf});
                    if (count % 4 == 0) {
                        // To test what happens if we suspend with a leased buffer
                        // std.time.sleep(1 * std.time.ns_per_ms);
                    }
                    leased_buf.release(
                        closure_transport,
                        closure_stream,
                    );
                    std.debug.print("Released buffer\n", .{});
                }
            }
        };
        _ = async f.f(stream_handle, &transport, connection);
    }

    const incoming_conn = try await incoming_conn_frame;
    var incoming_conn_ptr = try transport.connection_system.handle_allocator.getPtr(incoming_conn);
    defer incoming_conn_ptr.deinit(allocator);
    std.debug.print("\nincoming connection {}\n", .{incoming_conn});

    const incoming_stream = try await async incoming_conn_ptr.acceptStream(allocator);
    std.debug.print("\nincoming stream {}\n", .{incoming_stream});

    const incoming_stream_ptr = try transport.stream_system.handle_allocator.getPtr(incoming_stream);
    const leased_buf = try incoming_stream_ptr.recvWithLease();
    std.debug.print("\nRead server data {s}\n", .{leased_buf.buf});
    leased_buf.releaseAndWaitForNextTick(&transport, incoming_stream_ptr);

    var msgs_to_send: usize = 2;
    while (msgs_to_send > 0) : (msgs_to_send -= 1) {
        var msg_bytes = try std.fmt.allocPrint(allocator, "Hello from server. Countdown: {}\n", .{msgs_to_send});
        _ = try incoming_stream_ptr.send(msg_bytes);
        allocator.free(msg_bytes);
    }
}

test "transport with cert extension" {
    const allocator = std.testing.allocator;
    var host_key = try crypto.ED25519KeyPair.new();
    var cert_key = try crypto.ED25519KeyPair.new();
    defer host_key.deinit();
    defer cert_key.deinit();
    var x509 = try crypto.X509.init(cert_key, (try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }))[0..]);
    defer x509.deinit();

    // try crypto.Libp2pTLSCert.insertExtension(&x509,

    var pkcs12 = try crypto.PKCS12.init(cert_key, x509);
    defer pkcs12.deinit();

    var transport = try MsQuicTransport.init(allocator, "test", &pkcs12, MsQuicTransport.Options.default());
    defer transport.deinit();
}
