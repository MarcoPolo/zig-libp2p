const std = @import("std");
const log = std.log;
const Allocator = std.mem.Allocator;
const MsQuic = @import("msquic");
const QuicStatus = MsQuic.QuicStatus;
const MemoryPool = @import("../libp2p.zig").util.MemoryPool;
const MSS = @import("./multistream_select.zig");

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
    const MultistreamSelect = MSS.MultistreamSelect(*Self, handleMSSEvent);

    quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),
    sent_msg: [32]u8 = [_]u8{0} ** 32,
    is_initiator: bool = false,
    multistream_select: MultistreamSelect,
    state: State,
    msquic: *MsQuic.QUIC_API_TABLE,
    start_time: ?std.time.Instant = null,
    response_time: ?u64 = null,
    pingEventHandler: EventHandler,

    const State = enum {
        negotiating_multistream,
        ready,
        ping_response_received,
    };

    pub fn init(allocator: Allocator, eventHandler: EventHandler, msquic: *MsQuic.QUIC_API_TABLE, is_initiator: bool, initialized_quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER)) Self {
        var ping = Self{
            .pingEventHandler = eventHandler,
            .msquic = msquic,
            .quic_buffer_pool = initialized_quic_buffer_pool,
            .is_initiator = is_initiator,
            .multistream_select = MultistreamSelect.init(allocator, msquic, &[_][]const u8{id}, is_initiator, initialized_quic_buffer_pool),
            .state = .negotiating_multistream,
        };

        // TODO this is needed because if we aren't the initiator we are presumably already done with this.
        // It doesn't make sense for each protocol to have to deal with this.
        if (!is_initiator) {
            ping.multistream_select.state = .done;
            ping.multistream_select.negotiated_protocol = id;
        }
        return ping;
    }

    pub fn deinit(self: *Self) void {
        self.multistream_select.deinit();
    }

    pub fn initiate(self: *Self, stream: MsQuic.HQUIC) !void {
        log.debug("Initiating ping protocol", .{});
        try self.multistream_select.initiate(stream, self);
    }

    pub fn handleMSSEvent(self: *Self, _: MsQuic.HQUIC, mssEvent: MSS.MultistreamEvent) c_uint {
        switch (mssEvent) {
            .negotiated, .optimistically_negotiated => {
                self.state = .ready;
            },
            .failed => |err| {
                log.err("Failed to negotiate ping: {any}", .{err});
            },
        }
        return QuicStatus.Success;
    }

    pub fn handleEvent(self: *Self, stream: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) MsQuic.QUIC_STATUS {
        log.debug("Ping handling event: initiator={} state={} from={any} {}\n", .{ self.is_initiator, self.state, stream, event.*.Type });
        if (self.state == .negotiating_multistream) {
            const status = self.multistream_select.handleEvent(stream, event);
            if (QuicStatus.isError(status)) {
                return status;
            }
            // todo clean this up
            if (self.multistream_select.isDone()) {
                log.debug("Ping protocol negotiated", .{});
            }
            if (self.multistream_select.isDone() and std.mem.eql(u8, self.multistream_select.negotiated_protocol.?, id)) {
                self.state = .ready;
                return self.pingEventHandler(self, stream, .{ .ready = {} });
            }
            return status;
        }

        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                const buffers = event.*.unnamed_0.RECEIVE;
                if (self.is_initiator) {
                    const status = self.handlePingResp(stream, buffers.Buffers[0..buffers.BufferCount]);
                    if (QuicStatus.isError(status)) {
                        return status;
                    }
                } else {
                    return self.sendPong(stream, buffers.Buffers[0..buffers.BufferCount]) catch {
                        return QuicStatus.OutOfMemory;
                    };
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

        return QuicStatus.Success;
    }

    fn handlePingResp(self: *Self, stream: MsQuic.HQUIC, bufs: []const MsQuic.QUIC_BUFFER) c_uint {
        for (bufs) |buf| {
            if (buf.Length == 32) {
                if (std.mem.eql(u8, buf.Buffer[0..32], &self.sent_msg)) {
                    if (self.start_time) |start_time| {
                        const end = std.time.Instant.now() catch {
                            @panic("no time");
                        };
                        const dur = end.since(start_time);
                        self.response_time = dur;
                        return self.pingEventHandler(self, stream, .{ .ping_response_received = dur });
                    }
                } else {
                    log.err("Wrong response: {s}", .{std.fmt.fmtSliceHexLower(buf.Buffer[0..buf.Length])});
                    return QuicStatus.InternalError;
                }
            }
        }
        return QuicStatus.Success;
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

    fn sendPong(self: *Self, stream_handle: MsQuic.HQUIC, bufs: []const MsQuic.QUIC_BUFFER) !MsQuic.QUIC_STATUS {
        var quic_buf_to_send = try self.quic_buffer_pool.create();
        log.debug("Sending {*}", .{quic_buf_to_send});

        var bytes_written: usize = 0;
        var upto: usize = 32;
        for (bufs) |qbuf| {
            if (bytes_written == 32) {
                break;
            }
            if (qbuf.Length < upto) {
                upto = qbuf.Length;
            }
            std.mem.copy(u8, self.sent_msg[bytes_written..32], qbuf.Buffer[0..upto]);
            bytes_written += upto;
            upto -= qbuf.Length;
        }
        if (bytes_written != 32) {
            log.debug("aborting stream", .{});
            return self.msquic.StreamShutdown.?(stream_handle, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT, 0);
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
        return QuicStatus.Success;
    }

    fn close(_: *Self) void {
        // TODO
    }
};
