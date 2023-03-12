const std = @import("std");
const log = std.log;
const Allocator = std.mem.Allocator;
const MsQuic = @import("msquic");
const QuicStatus = MsQuic.QuicStatus;
const MemoryPool = @import("../libp2p.zig").util.MemoryPool;
const MSS = @import("./multistream_select.zig");

pub const id = "/perf/1.0.0";

pub const Event = union(enum) {
    done: struct {
        upload_duration: u64,
        download_duration: u64,
    },
};

pub const EventHandler = *const fn (*Handler, MsQuic.HQUIC, Event) MsQuic.QUIC_STATUS;

pub const Handler = struct {
    const MultistreamSelect = MSS.MultistreamSelect(*Handler, handleMSSEvent);

    const write_buf = [_]u8{0} ** 64 * 1024;

    quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),

    size_msg: [8]u8 = [_]u8{0} ** 8,
    is_initiator: bool = false,

    multistream_select: MultistreamSelect,
    state: State,

    start_time_upload: std.time.Instant,
    start_time_download: std.time.Instant,

    upload_duration: u64,

    msquic: *MsQuic.QUIC_API_TABLE,

    perfEventHandler: EventHandler,

    bytes_to_send: u64,
    bytes_to_recv: u64,

    bytes_sent: u64 = 0,
    bytes_recvd: u64 = 0,

    const State = enum {
        negotiating_multistream,
        ready,
        uploading,
        downloading,
        done,
    };

    pub fn init(allocator: Allocator, eventHandler: EventHandler, msquic: *MsQuic.QUIC_API_TABLE, is_initiator: bool, initialized_quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER)) Handler {
        var ping = Handler{
            .pingEventHandler = eventHandler,
            .msquic = msquic,
            .quic_buffer_pool = initialized_quic_buffer_pool,
            .is_initiator = is_initiator,
            .multistream_select = MultistreamSelect.init(allocator, msquic, &[_][]const u8{id}, is_initiator, initialized_quic_buffer_pool),
            .state = .negotiating_multistream,
        };
        return ping;
    }

    pub fn deinit(self: *Handler) void {
        self.multistream_select.deinit();
    }

    pub fn initiate(self: *Handler, stream: MsQuic.HQUIC) !void {
        // hack, we need to refactor mss to get rid of this
        log.debug("Initiating ping protocol", .{});
        try self.multistream_select.initiate(stream, self);
    }

    pub fn handleMSSEvent(self: *Handler, stream: MsQuic.HQUIC, mssEvent: MSS.MultistreamEvent) c_uint {
        switch (mssEvent) {
            .negotiated, .optimistically_negotiated => {
                self.state = .ready;
                runPerf(self, stream);
            },
            .failed => |err| {
                log.err("Failed to negotiate ping: {any}", .{err});
            },
        }
        return QuicStatus.Success;
    }

    pub fn handleEvent(self: *Handler, stream: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) MsQuic.QUIC_STATUS {
        log.debug("Perf handling event: initiator={} state={} from={any} {}\n", .{ self.is_initiator, self.state, stream, event.*.Type });
        if (self.state == .negotiating_multistream) {
            const status = self.multistream_select.handleEvent(stream, event);
            if (QuicStatus.isError(status)) {
                return status;
            }
            return status;
        }

        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                const buffers = event.*.unnamed_0.RECEIVE;
                if (self.is_initiator) {
                    self.bytes_recvd += event.*.unnamed_0.RECEIVE.TotalBufferLength;
                    self.runPerf(stream) catch {
                        return QuicStatus.InternalError;
                    };
                    return;
                } else {
                    if (self.state == .ready) {
                        self.bytes_to_send = std.mem.readIntBig(u64, buffers[0].Buffer[0..@sizeOf(u64)]);
                        self.state = .downloading;
                        self.runPerf(stream) catch {
                            return QuicStatus.InternalError;
                        };
                    }
                }
            },

            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_SHUTDOWN => {
                if (!self.is_initiator) {
                    self.state = .uploading;
                    self.runPerf(stream) catch {
                        return QuicStatus.InternalError;
                    };
                }
            },

            MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                if (event.*.unnamed_0.SEND_COMPLETE.ClientContext) |ctx| {
                    const sent_quic_buffer = @ptrCast(*MsQuic.QUIC_BUFFER, @alignCast(@alignOf(MsQuic.QUIC_BUFFER), ctx));
                    self.bytes_sent += sent_quic_buffer.Length;
                    self.quic_buffer_pool.destroy(sent_quic_buffer);
                    self.runPerf(stream);
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

    pub fn runPerf(self: *Handler, stream: MsQuic.HQUIC) !void {
        switch (self.state) {
            .ready => {
                if (!self.is_initiator) {
                    return;
                }

                self.start_time = std.time.Instant.now() catch unreachable;

                log.debug("starting perf", .{});

                std.mem.writeIntBig(u64, &self.size_msg, self.bytes_to_recv);

                var quic_buf_to_send = try self.quic_buffer_pool.create();
                quic_buf_to_send.* = MsQuic.QUIC_BUFFER{
                    .Length = @sizeOf(@TypeOf(self.size_msg)),
                    .Buffer = &self.size_msg,
                };
                _ = self.msquic.StreamSend.?(
                    stream,
                    quic_buf_to_send,
                    1,
                    MsQuic.QUIC_SEND_FLAG_NONE,
                    quic_buf_to_send,
                );

                self.state = .uploading;
                return try runPerf(self, stream);
            },
            .uploading => {
                const amount_to_send = if (self.bytes_to_send < Handler.write_buf.len) self.bytes_to_send else Handler.write_buf.len;

                var quic_buf_to_send = try self.quic_buffer_pool.create();
                quic_buf_to_send.* = MsQuic.QUIC_BUFFER{
                    .Length = @intCast(u32, amount_to_send),
                    .Buffer = Handler.write_buf.ptr,
                };

                const flags = if (amount_to_send == self.bytes_to_send) MsQuic.QUIC_SEND_FLAG_FIN else MsQuic.QUIC_SEND_FLAG_NONE;

                _ = self.msquic.StreamSend.?(
                    stream,
                    quic_buf_to_send,
                    1,
                    flags,
                    quic_buf_to_send,
                );

                if (flags == MsQuic.QUIC_SEND_FLAG_FIN) {
                    if (self.is_initiator) {
                        self.upload_duration = self.start_time_upload.since(std.time.Instant.now() catch unreachable);
                        self.state = .downloading;
                    } else {
                        self.state = .done;
                    }
                }
            },
            .downloading => {
                if (self.is_initiator and self.bytes_to_recv <= 0) {
                    const download_duration = self.start_time_download.since(std.time.Instant.now() catch unreachable);
                    self.state = .done;
                    self.perfEventHandler(self, stream, Event{ .done = .{
                        .upload_duration = download_duration,
                        .download_duration = self.upload_duration,
                    } });
                }
            },
            .done => {},
            .negotiating_multistream => unreachable,
        }
    }

    fn close(_: *Handler) void {
        // TODO
    }
};
