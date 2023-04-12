const std = @import("std");
const debug = std.debug;
const log = std.log;
const Allocator = std.mem.Allocator;
const MsQuic = @import("msquic");
const QuicStatus = MsQuic.QuicStatus;
const MemoryPool = @import("../libp2p.zig").util.MemoryPool;

const multistream_protocol_id_with_newline_no_len = "/multistream/1.0.0\n";
const multistream_protocol_id_with_newline = [1]u8{@as(u8, multistream_protocol_id_with_newline_no_len.len)} ++ multistream_protocol_id_with_newline_no_len;
const na_with_newline_no_len = "na\n";
const na_with_newline = [1]u8{@as(u8, na_with_newline_no_len.len)} ++ na_with_newline_no_len;

// TODO send na

pub const MultistreamEventType = enum {
    // We have successfully negotiated a protocol. Caller may stop sending events to MultistreamSelect.
    negotiated,
    // We have sent all the data we need to send. We still need to receive the
    // peer's response, but we can start sending application data. If the peer doesn't speak the protocol, we will fail later.
    // Caller still needs to send events to MultistreamSelect.
    optimistically_negotiated,
    // We have failed to negotiate a protocol. Caller may stop sending events to MultistreamSelect.
    // TODO add error
    failed,
};

pub const MultistreamEvent = union(MultistreamEventType) {
    negotiated: []const u8,
    optimistically_negotiated: []const u8,
    failed: void,
};

pub const EventHandler = *const fn (handler: *Handler, stream: MsQuic.HQUIC, event: MultistreamEvent) void;

fn layoutExpectedBuf() [1024]u8 {
    comptime var buf: [1024]u8 = [_]u8{0} ** 1024;
    std.mem.copy(u8, buf[0..multistream_protocol_id_with_newline.len], multistream_protocol_id_with_newline[0..multistream_protocol_id_with_newline.len]);
    return buf;
}

pub const Handler = struct {
    recv_buf: [1024]u8 = [_]u8{0} ** 1024,
    recv_buf_end_idx: u32 = 0,
    size_buf: [1]u8 = [_]u8{0} ** 1,

    expected_buf: [1024]u8 = layoutExpectedBuf(),
    expected_len: u16 = 0,
    pending_sends: u16 = 0,

    quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),

    is_initiator: bool,

    state: State = .ready,

    supported_protos: [][]const u8,
    negotiated_proto: ?[]const u8 = null,

    got_back_ms: bool = false,

    msquic: *MsQuic.QUIC_API_TABLE,

    eventHandler: EventHandler,
    stream_handle: MsQuic.HQUIC,

    const State = enum {
        ready,
        optimistically_negotiated,
        failed,
        done,
    };

    pub fn init(
        eventHandler: EventHandler,
        msquic: *MsQuic.QUIC_API_TABLE,
        stream_handle: MsQuic.HQUIC,
        is_initiator: bool,
        supported_protos: [][]const u8,
        initialized_quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),
    ) Handler {
        return Handler{
            .eventHandler = eventHandler,
            .msquic = msquic,
            .quic_buffer_pool = initialized_quic_buffer_pool,
            .supported_protos = supported_protos,
            .is_initiator = is_initiator,
            .stream_handle = stream_handle,
        };
    }

    pub fn deinit(self: *Handler) void {
        _ = self;
    }

    fn delayedSend(self: *Handler, stream: MsQuic.HQUIC, buf: []const u8) !c_uint {
        self.pending_sends += 1;
        const quic_buf_to_send = try self.quic_buffer_pool.create();
        // Hack to drop the const. QUIC_BUFFER/MsQuic won't modify the buffer.
        var buf_ptr = @intToPtr([*c]u8, @ptrToInt(buf.ptr));
        quic_buf_to_send.* = MsQuic.QUIC_BUFFER{
            .Length = @intCast(u32, buf.len),
            .Buffer = buf_ptr,
        };

        const send_status = self.msquic.StreamSend.?(
            stream,
            quic_buf_to_send,
            1,
            MsQuic.QUIC_SEND_FLAG_DELAY_SEND,
            quic_buf_to_send,
        );
        return send_status;
    }

    pub fn initiateMSS(self: *Handler, stream: MsQuic.HQUIC, proto: []const u8) !void {
        self.negotiated_proto = proto;
        // TODO this only supports protos that are <126 chars long
        std.mem.copy(u8, self.expected_buf[multistream_protocol_id_with_newline.len..], &[_]u8{@intCast(u8, proto.len + 1)});
        std.mem.copy(u8, self.expected_buf[multistream_protocol_id_with_newline.len + 1 ..], proto);
        std.mem.copy(u8, self.expected_buf[multistream_protocol_id_with_newline.len + 1 + proto.len ..], "\n");
        self.expected_len = @intCast(u16, multistream_protocol_id_with_newline.len + 1 + proto.len + 1);

        var send_status = try self.delayedSend(stream, self.expected_buf[0..self.expected_len]);
        log.debug("Sent first MSS message initiator={} status={} sent={s}", .{ self.is_initiator, send_status, self.expected_buf[0..self.expected_len] });

        self.state = .optimistically_negotiated;
        self.eventHandler(self, stream, .{ .optimistically_negotiated = proto });
    }

    pub fn handleEvent(self: *Handler, stream: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) QuicStatus.EventHandlerError!QuicStatus.EventHandlerStatus {
        if (self.state == .done or self.state == .failed) {
            return .Success;
        }

        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                var consumed_bytes: u64 = 0;
                if (self.is_initiator) {
                    // fast path, we have all the data in the first buffer
                    if (event.*.unnamed_0.RECEIVE.TotalBufferLength > 0 and event.*.unnamed_0.RECEIVE.Buffers[0].Length >= self.expected_len) {
                        var buf = event.*.unnamed_0.RECEIVE.Buffers[0];
                        if (std.mem.eql(u8, self.expected_buf[0..self.expected_len], buf.Buffer[0..self.expected_len])) {
                            consumed_bytes += self.expected_len;

                            self.state = .done;
                            self.eventHandler(self, stream, .{ .negotiated = self.negotiated_proto.? });

                            if (consumed_bytes < event.*.unnamed_0.RECEIVE.TotalBufferLength) {
                                event.*.unnamed_0.RECEIVE.TotalBufferLength = consumed_bytes;
                                return .Continue;
                            }
                            return .Success;
                        }
                    }

                    // Check that the message matches the expected proto
                    const quic_buffers: []const MsQuic.QUIC_BUFFER = event.*.unnamed_0.RECEIVE.Buffers[0..event.*.unnamed_0.RECEIVE.BufferCount];

                    std.debug.assert(self.expected_len >= self.recv_buf_end_idx);
                    for (quic_buffers) |quic_buf| {
                        const space_avail: u32 = self.expected_len - self.recv_buf_end_idx;
                        if (space_avail == 0) {
                            break;
                        }
                        const buf = quic_buf.Buffer[0..quic_buf.Length];

                        const amount_to_copy = std.math.min(space_avail, buf.len);
                        std.mem.copy(u8, self.recv_buf[self.recv_buf_end_idx..], buf[0..amount_to_copy]);
                        self.recv_buf_end_idx += amount_to_copy;
                        consumed_bytes += amount_to_copy;
                    }

                    if (self.expected_len != self.recv_buf_end_idx) {
                        log.debug("Didn't get the full MSS message. Missing {} bytes. {s}", .{ self.expected_len - self.recv_buf_end_idx, self.expected_buf[self.recv_buf_end_idx..self.expected_len] });
                        log.debug("Received: {s}. Total buffer len {}", .{ self.recv_buf[0..self.recv_buf_end_idx], event.*.unnamed_0.RECEIVE.TotalBufferLength });
                        if (consumed_bytes < event.*.unnamed_0.RECEIVE.TotalBufferLength) {
                            event.*.unnamed_0.RECEIVE.TotalBufferLength = consumed_bytes;
                            return .Continue;
                        }
                        return .Success;
                    }

                    if (std.mem.eql(u8, self.expected_buf[0..self.expected_len], self.recv_buf[0..self.recv_buf_end_idx])) {
                        self.state = .done;
                        self.eventHandler(self, stream, .{ .negotiated = self.negotiated_proto.? });

                        if (consumed_bytes < event.*.unnamed_0.RECEIVE.TotalBufferLength) {
                            event.*.unnamed_0.RECEIVE.TotalBufferLength = consumed_bytes;
                            return .Continue;
                        }
                        return .Success;
                    } else {
                        log.err("MSS message didn't match expected proto. {s}", .{std.fmt.fmtSliceHexLower(self.expected_buf[0..self.expected_len])});
                        log.err("MSS message got                   proto. {s}", .{std.fmt.fmtSliceHexLower(self.recv_buf[0..self.recv_buf_end_idx])});
                        self.state = .failed;
                        self.eventHandler(self, stream, .{ .failed = {} });
                        return .Success;
                    }
                } else {
                    // We aren't the initiator, so we need to see what proto we are going to use

                    const quic_buffers: []const MsQuic.QUIC_BUFFER = event.*.unnamed_0.RECEIVE.Buffers[0..event.*.unnamed_0.RECEIVE.BufferCount];

                    // Consume until we reach the second newline
                    for (quic_buffers) |*quic_buf| {
                        var buf = quic_buf.Buffer[0..quic_buf.Length];

                        const space_avail: u32 = @as(u32, self.recv_buf.len) - self.recv_buf_end_idx;
                        if (space_avail == 0) {
                            break;
                        }

                        if (!self.got_back_ms) {
                            if (std.mem.indexOf(u8, buf, "\n")) |idx_of_newline| {
                                const slice = buf[0 .. idx_of_newline + 1];
                                if (slice.len + self.recv_buf_end_idx > multistream_protocol_id_with_newline.len) {
                                    self.state = .failed;
                                    log.err("Got back a bad multistream protocol id: initiator={} len={} {s}", .{ self.is_initiator, slice.len, slice });
                                    self.eventHandler(self, stream, .{ .failed = {} });
                                    // TODO close?
                                    return QuicStatus.EventHandlerError.InternalError;
                                }

                                std.mem.copy(u8, self.recv_buf[self.recv_buf_end_idx..], slice);
                                self.recv_buf_end_idx += @intCast(u32, slice.len);
                                consumed_bytes += slice.len;

                                if (std.mem.eql(u8, self.recv_buf[0..self.recv_buf_end_idx], multistream_protocol_id_with_newline)) {
                                    buf = buf[slice.len..];
                                    log.debug("Got back the multistream protocol id: initiator={}", .{self.is_initiator});
                                    self.got_back_ms = true;
                                } else {
                                    log.err("Got back a bad multistream protocol id: initiator={} {s}", .{ self.is_initiator, self.recv_buf[0..self.recv_buf_end_idx] });
                                    self.state = .failed;
                                    self.eventHandler(self, stream, .{ .failed = {} });
                                    // TODO close?
                                    return QuicStatus.EventHandlerError.InternalError;
                                }
                            } else {
                                // Copy the whole buffer
                                if (buf.len > multistream_protocol_id_with_newline.len) {
                                    self.state = .failed;
                                    log.err("Got back a bad multistream protocol id: initiator={} {s}", .{ self.is_initiator, buf });
                                    self.eventHandler(self, stream, .{ .failed = {} });
                                    // TODO close?
                                    return QuicStatus.EventHandlerError.InternalError;
                                }
                                std.mem.copy(u8, self.recv_buf[self.recv_buf_end_idx..], buf);
                                self.recv_buf_end_idx += @intCast(u32, buf.len);
                                consumed_bytes += buf.len;
                                log.debug("Still missing multistream protocol id: initiator={} sofar={s}", .{ self.is_initiator, self.recv_buf[0..self.recv_buf_end_idx] });
                                continue;
                            }
                        }

                        debug.assert(self.got_back_ms);

                        if (std.mem.indexOf(u8, buf, "\n")) |idx_of_newline| {
                            const slice = buf[0 .. idx_of_newline + 1];
                            if (slice.len > space_avail) {
                                self.state = .failed;
                                log.err("Got back too much in mss: initiator={}", .{self.is_initiator});
                                self.eventHandler(self, stream, .{ .failed = {} });
                                // TODO close?
                                return QuicStatus.EventHandlerError.InternalError;
                            }
                            std.mem.copy(u8, self.recv_buf[self.recv_buf_end_idx..], slice);
                            self.recv_buf_end_idx += @intCast(u32, slice.len);
                            consumed_bytes += @intCast(u32, slice.len);

                            // TODO fix this hack (we add 1 for the varint len prefix)
                            const requested_proto = self.recv_buf[multistream_protocol_id_with_newline.len + 1 .. self.recv_buf_end_idx - 1];
                            log.debug("initiator requests proto={s}", .{requested_proto});
                            for (self.supported_protos) |proto| {
                                if (std.mem.eql(u8, requested_proto, proto)) {
                                    self.negotiated_proto = proto;
                                    break;
                                }
                            }
                            if (self.negotiated_proto != null) {
                                log.debug("initiator requests proto={s} and we support it", .{requested_proto});
                                break;
                            } else {
                                log.debug("initiator requests proto={s} and we don't support it", .{requested_proto});
                                self.state = .failed;
                                _ = delayedSend(self, stream, multistream_protocol_id_with_newline) catch {
                                    self.state = .failed;
                                    self.eventHandler(self, stream, .{ .failed = {} });
                                    log.debug("Out of memory initiator={}", .{self.is_initiator});
                                    return QuicStatus.EventHandlerError.OutOfMemory;
                                };
                                _ = delayedSend(self, stream, na_with_newline) catch {
                                    self.state = .failed;
                                    self.eventHandler(self, stream, .{ .failed = {} });
                                    log.debug("Out of memory initiator={}", .{self.is_initiator});
                                    return QuicStatus.EventHandlerError.OutOfMemory;
                                };
                                self.eventHandler(self, stream, .{ .failed = {} });
                                // TODO close?
                                return QuicStatus.EventHandlerError.InternalError;
                            }
                        } else {
                            // Copy the whole buffer
                            if (buf.len > space_avail) {
                                self.state = .failed;
                                log.err("Missing protocol id in MSS: initiator={} {s} (No more space in buf)", .{ self.is_initiator, buf });
                                self.eventHandler(self, stream, .{ .failed = {} });
                                // TODO close?
                                return QuicStatus.EventHandlerError.InternalError;
                            }
                            std.mem.copy(u8, self.recv_buf[self.recv_buf_end_idx..], buf);
                            self.recv_buf_end_idx += @intCast(u32, buf.len);
                            consumed_bytes += buf.len;
                            log.debug("Still missing multistream protocol id: initiator={} sofar={s}", .{ self.is_initiator, self.recv_buf[0..self.recv_buf_end_idx] });
                        }
                    }

                    if (self.negotiated_proto) |negotiated_proto| {
                        log.debug("Negotiated protocol: initiator={} {s}", .{ self.is_initiator, negotiated_proto });
                        self.state = .optimistically_negotiated; // Optimistic because we haven't finished our send yet.
                        self.eventHandler(self, stream, .{ .negotiated = negotiated_proto });
                        _ = delayedSend(self, stream, multistream_protocol_id_with_newline) catch {
                            self.state = .failed;
                            self.eventHandler(self, stream, .{ .failed = {} });
                            log.debug("Out of memory initiator={}", .{self.is_initiator});
                            return QuicStatus.EventHandlerError.OutOfMemory;
                        };
                        self.size_buf[0] = @intCast(u8, negotiated_proto.len + 1);
                        _ = delayedSend(self, stream, &self.size_buf) catch {
                            self.state = .failed;
                            self.eventHandler(self, stream, .{ .failed = {} });
                            log.debug("Out of memory initiator={}", .{self.is_initiator});
                            return QuicStatus.EventHandlerError.OutOfMemory;
                        };
                        _ = delayedSend(self, stream, negotiated_proto) catch {
                            self.state = .failed;
                            self.eventHandler(self, stream, .{ .failed = {} });
                            log.debug("Out of memory initiator={}", .{self.is_initiator});
                            return QuicStatus.EventHandlerError.OutOfMemory;
                        };
                        _ = delayedSend(self, stream, "\n") catch {
                            self.state = .failed;
                            self.eventHandler(self, stream, .{ .failed = {} });
                            log.debug("Out of memory initiator={}", .{self.is_initiator});
                            return QuicStatus.EventHandlerError.OutOfMemory;
                        };
                    }
                }

                if (consumed_bytes < event.*.unnamed_0.RECEIVE.TotalBufferLength) {
                    event.*.unnamed_0.RECEIVE.TotalBufferLength = consumed_bytes;
                    return .Continue;
                }
                return .Success;
            },
            MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                if (event.*.unnamed_0.SEND_COMPLETE.ClientContext) |ctx| {
                    const sent_quic_buffer = @ptrCast(*MsQuic.QUIC_BUFFER, @alignCast(@alignOf(MsQuic.QUIC_BUFFER), ctx));
                    self.quic_buffer_pool.destroy(sent_quic_buffer);
                    self.pending_sends -= 1;
                    log.debug("initiator={} pending sends={}", .{ self.is_initiator, self.pending_sends });
                    if (!self.is_initiator and self.state == .optimistically_negotiated and self.pending_sends == 0) {
                        self.state = .done;
                    }
                }
            },
            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_ABORTED => {
                log.debug("initiator={} QUIC_STREAM_EVENT_PEER_SEND_ABORTED", .{self.is_initiator});
            },
            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_SHUTDOWN => {
                log.debug("initiator={} QUIC_STREAM_EVENT_PEER_SEND_SHUTDOWN", .{self.is_initiator});
            },
            MsQuic.QUIC_STREAM_EVENT_PEER_RECEIVE_ABORTED => {
                log.debug("initiator={} QUIC_STREAM_EVENT_PEER_RECEIVE_ABORTED", .{self.is_initiator});
            },
            MsQuic.QUIC_STREAM_EVENT_SEND_SHUTDOWN_COMPLETE => {
                log.debug("initiator={} QUIC_STREAM_EVENT_SEND_SHUTDOWN_COMPLETE", .{self.is_initiator});
            },
            MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                log.debug("initiator={} QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE", .{self.is_initiator});
            },
            MsQuic.QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE => {
                log.debug("initiator={} QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE", .{self.is_initiator});
            },
            MsQuic.QUIC_STREAM_EVENT_PEER_ACCEPTED => {
                log.debug("initiator={} QUIC_STREAM_EVENT_PEER_ACCEPTED", .{self.is_initiator});
            },
            else => {},
        }
        return .Success;
    }
};

const TestEnv = @import("../util/test_util.zig").TestEnv(TestMeta);
const TestMSSStreamContext = struct {
    allocator: Allocator,
    stream_handle: MsQuic.HQUIC,
    mss: Handler,
    test_env: *TestEnv,
    msquic: *MsQuic.QUIC_API_TABLE,
    is_initiator: bool,
    pub fn init(
        allocator: Allocator,
        msquic: *MsQuic.QUIC_API_TABLE,
        stream: MsQuic.HQUIC,
        is_initiator: bool,
        quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),
        test_env: *TestEnv,
    ) error{OutOfMemory}!TestMSSStreamContext {
        var protos = [_][]const u8{"test"};
        return .{
            .allocator = allocator,
            .stream_handle = stream,
            .mss = Handler.init(
                TestMSSStreamContext.handleMSSEvent,
                msquic,
                stream,
                is_initiator,
                &protos,
                quic_buffer_pool,
            ),
            .is_initiator = is_initiator,
            .test_env = test_env,
            .msquic = msquic,
        };
    }

    pub fn deinit(self: *TestMSSStreamContext) void {
        self.mss.deinit();
        _ = self.msquic.StreamClose.?(self.stream_handle);
        self.allocator.destroy(self);
    }

    pub fn streamStarted(self: *TestMSSStreamContext, stream_handle: MsQuic.HQUIC) !void {
        if (self.is_initiator) {
            try self.mss.initiateMSS(stream_handle, "test");
        }
    }

    pub fn initiateMSS(self: *TestMSSStreamContext, stream_handle: MsQuic.HQUIC, _: []const u8) !void {
        try self.streamStarted(stream_handle);
    }

    pub fn handleEvent(self: *TestMSSStreamContext, stream: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) QuicStatus.EventHandlerError!QuicStatus.EventHandlerStatus {
        _ = try self.mss.handleEvent(stream, event);

        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                self.deinit();
            },
            else => {},
        }

        return .Success;
    }

    pub fn handleMSSEvent(handler: *Handler, _: MsQuic.HQUIC, event: MultistreamEvent) void {
        log.debug("initiator={} handleMSSEvent: {any}", .{ handler.is_initiator, event });
        switch (event) {
            .negotiated => {
                const self = @fieldParentPtr(TestMSSStreamContext, "mss", handler);
                self.test_env.done_semaphore.post();
            },
            else => {},
        }
    }
};

// Wraps a Handler with Multistream select. Calls the wrapped handler's .streamStarted(stream_handle, proto) method when ready.
pub fn WrapHandlerWithMSS(comptime WrappedHandler: type) type {
    return struct {
        const Self = @This();
        mss: Handler,
        wrapped: WrappedHandler,

        pub fn init(
            wrappedHandler: WrappedHandler,
            msquic: *MsQuic.QUIC_API_TABLE,
            stream_handle: MsQuic.HQUIC,
            is_initiator: bool,
            supported_protos: [][]const u8,
            initialized_quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),
        ) !Self {
            return .{
                .wrapped = wrappedHandler,
                .mss = Handler.init(
                    Self.handleMSSEvent,
                    msquic,
                    stream_handle,
                    is_initiator,
                    supported_protos,
                    initialized_quic_buffer_pool,
                ),
            };
        }

        pub fn deinit(self: *Self) void {
            self.mss.deinit();
            self.wrapped.deinit();
        }

        pub fn initiateMSS(self: *Self, stream_handle: MsQuic.HQUIC, proto: []const u8) void {
            if (self.mss.is_initiator) {
                self.mss.initiateMSS(stream_handle, proto) catch |err| {
                    log.err("initiator={} initiateMSS failed: {}", .{ self.mss.is_initiator, err });
                };
            }
        }

        pub fn handleEvent(self: *Self, stream: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) QuicStatus.EventHandlerError!QuicStatus.EventHandlerStatus {
            log.debug("initiator={} MSS state={} handleEvent: {s}", .{ self.mss.is_initiator, self.mss.state, MsQuic.streamEventToString(event.*.Type) });
            switch (self.mss.state) {
                .done => {
                    // No more events need to be passed to MSS.
                    return try self.wrapped.handleEvent(stream, event);
                },
                .ready => {
                    // MSS needs to read these events
                    return try self.mss.handleEvent(stream, event);
                },
                .optimistically_negotiated => {
                    if (self.mss.is_initiator) {
                        switch (event.*.Type) {
                            MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                                // As the initiator we need to wait the peer to send the MSS back
                                return try self.mss.handleEvent(stream, event);
                            },
                            else => {
                                // Any other events we don't care about.
                                return try self.wrapped.handleEvent(stream, event);
                            },
                        }
                    } else {
                        switch (event.*.Type) {
                            MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                                // As the non-initiator we need to wait for our sends to finish
                                return try self.mss.handleEvent(stream, event);
                            },
                            else => {
                                // Any other events we don't care about.
                                return try self.wrapped.handleEvent(stream, event);
                            },
                        }
                    }
                },
                .failed => {
                    log.debug("initiator={} MSS has failed. Dropping event: {}", .{ self.mss.is_initiator, event.*.Type });
                    return QuicStatus.EventHandlerError.InternalError;
                },
            }
        }

        pub fn handleMSSEvent(handler: *Handler, stream: MsQuic.HQUIC, event: MultistreamEvent) void {
            const self = @fieldParentPtr(Self, "mss", handler);
            switch (event) {
                .optimistically_negotiated => |proto| {
                    if (self.mss.is_initiator) {
                        self.wrapped.streamStarted(stream, proto);
                    }
                },
                .negotiated => |proto| {
                    if (!self.mss.is_initiator) {
                        self.wrapped.streamStarted(stream, proto);
                    }
                },
                .failed => {
                    // TODO close stream?
                    log.debug("initiator={} MSS negotiation failed", .{self.mss.is_initiator});
                },
            }
        }

        pub inline fn getParentPtrFromWrappedHandler(wrapped_handler: *WrappedHandler) *Self {
            return @fieldParentPtr(Self, "wrapped", wrapped_handler);
        }
    };
}

const TestMeta = void;

pub fn runTestDialer(allocator: Allocator, comptime Node: anytype, proto_to_dial: []const u8, listener_multiaddr: *const []const u8, addr_semaphore: *std.Thread.Semaphore) !void {
    const libp2p = @import("../libp2p.zig");
    const multiaddr = libp2p.multiaddr;

    addr_semaphore.wait();

    const ma = try multiaddr.decodeMultiaddr(allocator, listener_multiaddr.*);
    defer ma.deinit(allocator);

    var client = try Node.init(allocator);
    defer client.deinit();

    log.info("Warmup to establish connection", .{});
    var stream_and_conn = try client.dialAndStartStream(.{
        .target = ma.target,
        .target_port = ma.port,
        .proto = proto_to_dial,
    });
    defer client.msquic.ConnectionShutdown.?(stream_and_conn.conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);

    // Wait for perf to finish
    client.test_env.done_semaphore.wait();
}

test "MSS protocol" {
    std.testing.log_level = .debug;
    // std.testing.log_level = .info;
    const test_util = @import("../util/test_util.zig");
    const TestNode = @import("../util/test_util.zig").TestNode;
    const Node = TestNode(TestMSSStreamContext, TestMeta, TestMSSStreamContext.init);
    const allocator = std.testing.allocator;
    const Semaphore = std.Thread.Semaphore;

    var shutdown_listener_sem: Semaphore = .{};
    var listener_multiaddr_semaphore: Semaphore = .{};
    var listener_multiaddr: []const u8 = undefined;

    var listener_thread = try std.Thread.spawn(.{}, test_util.runListener, .{ allocator, Node, "0.0.0.0", &listener_multiaddr, &listener_multiaddr_semaphore, &shutdown_listener_sem });
    try runTestDialer(allocator, Node, "", &listener_multiaddr, &listener_multiaddr_semaphore);

    shutdown_listener_sem.post();
    listener_thread.join();
}
