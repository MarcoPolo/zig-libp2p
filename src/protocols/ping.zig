const std = @import("std");
const log = std.log;
const Allocator = std.mem.Allocator;
const MsQuic = @import("msquic");
const QuicStatus = MsQuic.QuicStatus;
const MemoryPool = @import("../libp2p.zig").util.MemoryPool;

var rng = std.rand.DefaultPrng.init(0);
const random = rng.random();

pub const id = "/ipfs/ping/1.0.0";

pub const Event = union(enum) {
    // TODO, we can remove this
    ready: void,
    ping_response_received: u64, // Duration
};

pub const EventHandler = *const fn (*Handler, MsQuic.HQUIC, Event) MsQuic.QUIC_STATUS;

pub const Handler = struct {
    const Self = @This();

    quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),
    sent_msg: [32]u8 = [_]u8{0} ** 32,
    is_initiator: bool = false,
    state: State,
    msquic: *MsQuic.QUIC_API_TABLE,
    start_time: ?std.time.Instant = null,
    response_time: ?u64 = null,
    pingEventHandler: EventHandler,

    const State = enum {
        ready,
        ping_response_received,
    };

    pub fn init(eventHandler: EventHandler, msquic: *MsQuic.QUIC_API_TABLE, is_initiator: bool, initialized_quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER)) Self {
        return .{
            .pingEventHandler = eventHandler,
            .msquic = msquic,
            .quic_buffer_pool = initialized_quic_buffer_pool,
            .is_initiator = is_initiator,
            .state = .ready,
        };
    }

    pub fn deinit(_: *Self) void {}

    pub fn initiate(self: *Self, stream: MsQuic.HQUIC) !void {
        log.debug("Initiating ping protocol", .{});
        try self.multistream_select.initiate(stream, self);
    }

    pub fn handleEvent(self: *Self, stream: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) QuicStatus.EventHandlerError!QuicStatus.EventHandlerStatus {
        log.debug("Ping handling event: initiator={} state={} from={any} {}\n", .{ self.is_initiator, self.state, stream, event.*.Type });
        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                const buffers = event.*.unnamed_0.RECEIVE;
                if (self.is_initiator) {
                    log.debug("Total buf size: {} buffer count: {}\n", .{ buffers.TotalBufferLength, buffers.BufferCount });
                    const status = self.handlePingResp(stream, buffers.Buffers[0..buffers.BufferCount]);
                    if (QuicStatus.isError(status)) {
                        return QuicStatus.UintToEventHandlerError(status);
                    }
                } else {
                    self.sendPong(stream, buffers.Buffers[0..buffers.BufferCount]) catch {
                        return QuicStatus.EventHandlerError.OutOfMemory;
                    };
                    return .Success;
                }
            },

            MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                if (event.*.unnamed_0.SEND_COMPLETE.ClientContext) |ctx| {
                    const sent_quic_buffer = @ptrCast(*MsQuic.QUIC_BUFFER, @alignCast(@alignOf(MsQuic.QUIC_BUFFER), ctx));
                    self.quic_buffer_pool.destroy(sent_quic_buffer);
                }
            },
            MsQuic.QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE => {
                log.debug("QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE", .{});
            },

            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_ABORTED, MsQuic.QUIC_STREAM_EVENT_PEER_RECEIVE_ABORTED => {
                log.debug("Peer aborted stream\n", .{});
                _ = self.msquic.StreamShutdown.?(stream, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT, 0);
            },

            MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                self.deinit();
            },

            else => {},
        }

        return .Success;
    }

    fn handlePingResp(self: *Self, stream: MsQuic.HQUIC, bufs: []const MsQuic.QUIC_BUFFER) c_uint {
        // Fast path
        if (bufs.len > 0 and bufs[0].Length >= 32) {
            if (std.mem.eql(u8, bufs[0].Buffer[0..32], &self.sent_msg)) {
                if (self.start_time) |start_time| {
                    const end = std.time.Instant.now() catch {
                        @panic("no time");
                    };
                    const dur = end.since(start_time);
                    self.response_time = dur;
                    return self.pingEventHandler(self, stream, .{ .ping_response_received = dur });
                }
            }
            log.err("fast Wrong response: {s}", .{std.fmt.fmtSliceHexLower(bufs[0].Buffer[0..32])});
            return QuicStatus.InternalError;
        }

        var recv_buf = [_]u8{0} ** 32;
        var write_slice = recv_buf[0..];

        for (bufs) |buf| {
            const amount_to_copy = std.math.min(buf.Length, write_slice.len);
            if (amount_to_copy == 0) {
                break;
            }
            std.mem.copy(u8, write_slice[0..amount_to_copy], buf.Buffer[0..amount_to_copy]);
        }
        if (std.mem.eql(u8, &recv_buf, &self.sent_msg)) {
            if (self.start_time) |start_time| {
                const end = std.time.Instant.now() catch {
                    @panic("no time");
                };
                const dur = end.since(start_time);
                self.response_time = dur;
                return self.pingEventHandler(self, stream, .{ .ping_response_received = dur });
            }
        } else {
            log.err("Wrong response: {s}", .{std.fmt.fmtSliceHexLower(&recv_buf)});
            log.err("Wrong response: {s}", .{&recv_buf});
            return QuicStatus.InternalError;
        }
        return QuicStatus.Success;
    }

    pub fn streamStarted(self: *Self, stream: MsQuic.HQUIC, _: []const u8) void {
        if (self.is_initiator) {
            self.sendPingMsg(stream) catch |err| {
                log.err("Failed to send ping message err={}", .{err});
            };
        }
    }

    pub fn sendPingMsg(self: *Self, stream: MsQuic.HQUIC) !void {
        self.start_time = std.time.Instant.now() catch {
            @panic("no time");
        };

        // Start ping
        var quic_buf_to_send = try self.quic_buffer_pool.create();
        random.bytes(self.sent_msg[0..]);
        quic_buf_to_send.* = MsQuic.QUIC_BUFFER{
            .Length = @intCast(u32, 32),
            .Buffer = self.sent_msg[0..],
        };
        log.debug("Sending ping: {s} {}\n \n", .{ std.fmt.fmtSliceHexLower(self.sent_msg[0..32]), 32 });
        _ = self.msquic.StreamSend.?(
            stream,
            quic_buf_to_send,
            1,
            MsQuic.QUIC_SEND_FLAG_NONE,
            quic_buf_to_send,
        );
    }

    fn sendPong(self: *Self, stream_handle: MsQuic.HQUIC, bufs: []const MsQuic.QUIC_BUFFER) !void {
        var quic_buf_to_send = try self.quic_buffer_pool.create();

        var bytes_written: usize = 0;
        var upto: usize = 32;
        for (bufs) |qbuf| {
            if (bytes_written == 32) {
                break;
            }
            const amount_to_copy = std.math.min(upto, qbuf.Length);
            log.debug("got {s}", .{std.fmt.fmtSliceHexLower(qbuf.Buffer[0..amount_to_copy])});
            std.mem.copy(u8, self.sent_msg[bytes_written..32], qbuf.Buffer[0..amount_to_copy]);
            bytes_written += amount_to_copy;
            upto -= amount_to_copy;
        }
        if (bytes_written != 32) {
            log.debug("aborting stream", .{});
            _ = self.msquic.StreamShutdown.?(stream_handle, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT, 0);
        }

        quic_buf_to_send.* = MsQuic.QUIC_BUFFER{
            .Length = @intCast(u32, 32),
            .Buffer = &self.sent_msg,
        };

        _ = self.msquic.StreamSend.?(
            stream_handle,
            quic_buf_to_send,
            1,
            MsQuic.QUIC_SEND_FLAG_NONE,
            quic_buf_to_send,
        );
    }

    fn close(_: *Self) void {
        // TODO
    }
};
