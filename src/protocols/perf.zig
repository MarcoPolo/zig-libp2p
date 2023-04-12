const std = @import("std");
const log = std.log;
const Allocator = std.mem.Allocator;
const MsQuic = @import("msquic");
const QuicStatus = MsQuic.QuicStatus;
const MemoryPool = @import("../libp2p.zig").util.MemoryPool;
const mss = @import("./multistream_select.zig");

pub const id = "/perf/1.0.0";

pub const Event = union(enum) {
    done: struct {
        duration: u64,
    },
};

pub const EventHandler = *const fn (*Handler, MsQuic.HQUIC, Event) void;

pub const Handler = struct {
    write_buf: [64 << 10]u8 = [_]u8{0} ** (64 << 10),

    quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),

    size_msg: [8]u8 = [_]u8{0} ** 8,
    is_initiator: bool = false,

    state: State,

    remote_send_shutdown: bool = false,
    start_time: std.time.Instant,

    upload_duration: u64 = 0,

    msquic: *MsQuic.QUIC_API_TABLE,

    perfEventHandler: EventHandler,

    bytes_to_send: u64,
    bytes_to_recv: u64,

    bytes_sent: u64 = 0,

    const State = enum {
        ready,
        uploading,
        downloading,
        done,
    };

    pub fn init(
        eventHandler: EventHandler,
        msquic: *MsQuic.QUIC_API_TABLE,
        is_initiator: bool,
        initialized_quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),
        bytes_to_send: u64,
        bytes_to_recv: u64,
    ) Handler {
        var ping = Handler{
            .perfEventHandler = eventHandler,
            .msquic = msquic,
            .quic_buffer_pool = initialized_quic_buffer_pool,
            .is_initiator = is_initiator,
            .state = .ready,
            .start_time = std.time.Instant.now() catch unreachable,
            .bytes_to_send = bytes_to_send,
            .bytes_to_recv = bytes_to_recv,
        };
        return ping;
    }

    pub fn deinit(_: *Handler) void {}

    pub fn streamStarted(self: *Handler, stream: MsQuic.HQUIC, _: []const u8) void {
        if (self.is_initiator) {
            runPerf(self, stream) catch |err| {
                log.err("Error running perf: {}", .{err});
            };
        }
    }

    pub fn handleEvent(self: *Handler, stream: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) QuicStatus.EventHandlerError!QuicStatus.EventHandlerStatus {
        log.debug("Perf handling event: initiator={} state={} from={any} {}\n", .{ self.is_initiator, self.state, stream, event.*.Type });
        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                const buffers = event.*.unnamed_0.RECEIVE.Buffers[0..event.*.unnamed_0.RECEIVE.BufferCount];
                if (self.is_initiator) {
                    if (event.*.unnamed_0.RECEIVE.TotalBufferLength > self.bytes_to_recv) {
                        self.bytes_to_recv = 0;
                    } else {
                        self.bytes_to_recv -= event.*.unnamed_0.RECEIVE.TotalBufferLength;
                    }
                    self.runPerf(stream) catch {
                        return QuicStatus.EventHandlerError.InternalError;
                    };
                } else {
                    if (self.state == .ready) {
                        self.bytes_to_send = std.mem.readIntBig(u64, buffers[0].Buffer[0..@sizeOf(u64)]);
                        self.state = .downloading;
                        self.runPerf(stream) catch {
                            return QuicStatus.EventHandlerError.InternalError;
                        };
                    }
                }
            },

            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_SHUTDOWN => {
                self.remote_send_shutdown = true;
                if (!self.is_initiator) {
                    self.state = .uploading;
                }
                self.runPerf(stream) catch {
                    return QuicStatus.EventHandlerError.InternalError;
                };
            },

            MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                if (event.*.unnamed_0.SEND_COMPLETE.ClientContext) |ctx| {
                    const sent_quic_buffer = @ptrCast(*MsQuic.QUIC_BUFFER, @alignCast(@alignOf(MsQuic.QUIC_BUFFER), ctx));
                    self.bytes_sent += sent_quic_buffer.Length;
                    self.quic_buffer_pool.destroy(sent_quic_buffer);
                    self.runPerf(stream) catch {
                        return QuicStatus.EventHandlerError.InternalError;
                    };
                }
            },
            MsQuic.QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE => {},

            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_ABORTED, MsQuic.QUIC_STREAM_EVENT_PEER_RECEIVE_ABORTED => {
                log.debug("Peer aborted stream\n", .{});
                _ = self.msquic.StreamShutdown.?(stream, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT, 0);
            },

            MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {},

            else => {},
        }

        return .Success;
    }

    pub fn runPerf(self: *Handler, stream: MsQuic.HQUIC) !void {
        switch (self.state) {
            .ready => {
                if (!self.is_initiator) {
                    return;
                }

                self.start_time = std.time.Instant.now() catch unreachable;

                log.debug("starting perf", .{});
                self.state = .uploading;

                std.mem.writeIntBig(u64, &self.size_msg, self.bytes_to_recv);

                var quic_buf_to_send = try self.quic_buffer_pool.create();
                quic_buf_to_send.* = MsQuic.QUIC_BUFFER{
                    .Length = @sizeOf(@TypeOf(self.size_msg)),
                    .Buffer = &self.size_msg,
                };
                const send_status = self.msquic.StreamSend.?(
                    stream,
                    quic_buf_to_send,
                    1,
                    MsQuic.QUIC_SEND_FLAG_DELAY_SEND,
                    quic_buf_to_send,
                );
                log.debug("send status={}", .{send_status});

                return try runPerf(self, stream);
            },
            .uploading => {
                const amount_to_send = std.math.min(self.bytes_to_send, self.write_buf.len);

                var quic_buf_to_send = try self.quic_buffer_pool.create();
                quic_buf_to_send.* = MsQuic.QUIC_BUFFER{
                    .Length = @intCast(u32, amount_to_send),
                    .Buffer = &self.write_buf,
                };

                const flags: c_uint = if (amount_to_send == self.bytes_to_send) MsQuic.QUIC_SEND_FLAG_FIN else MsQuic.QUIC_SEND_FLAG_NONE;
                log.debug("initiator={} Uploading {}", .{ self.is_initiator, amount_to_send });

                const send_status = self.msquic.StreamSend.?(
                    stream,
                    quic_buf_to_send,
                    1,
                    flags,
                    quic_buf_to_send,
                );
                self.bytes_to_send -= amount_to_send;

                if (self.bytes_to_send == 0) {
                    if (self.is_initiator) {
                        self.state = .downloading;
                    } else {
                        self.state = .done;
                    }
                }
                log.debug("initiator={} send status={}", .{ self.is_initiator, send_status });
            },
            .downloading => {
                if (self.is_initiator and self.remote_send_shutdown) {
                    if (self.bytes_to_recv != 0) {
                        log.err("bytes_to_recv != 0", .{});
                    }
                    const now = std.time.Instant.now() catch unreachable;
                    const duration = now.since(self.start_time);
                    self.state = .done;
                    self.perfEventHandler(self, stream, Event{ .done = .{
                        .duration = duration,
                    } });
                    _ = self.msquic.StreamShutdown.?(stream, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_GRACEFUL, 0);
                }
            },
            .done => {},
        }
    }

    fn close(_: *Handler) void {
        // TODO
    }
};

const HandlerWithMSS = mss.WrapHandlerWithMSS(Handler);

const TestEnv = @import("../util/test_util.zig").TestEnv(TestMeta);
var test_supported_protos = [_][]const u8{id};
pub const TestPerfStreamContext = struct {
    allocator: Allocator,
    stream_handle: MsQuic.HQUIC,
    perf: HandlerWithMSS,
    test_env: *TestEnv,
    msquic: *MsQuic.QUIC_API_TABLE,
    pub fn init(
        allocator: Allocator,
        msquic: *MsQuic.QUIC_API_TABLE,
        stream: MsQuic.HQUIC,
        is_initiator: bool,
        quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),
        test_env: *TestEnv,
    ) error{OutOfMemory}!TestPerfStreamContext {
        const perf = Handler.init(
            TestPerfStreamContext.handlePerfEvent,
            msquic,
            is_initiator,
            quic_buffer_pool,
            test_env.*.meta.upload_size_bytes,
            test_env.*.meta.download_size_bytes,
        );
        return .{
            .allocator = allocator,
            .stream_handle = stream,
            .perf = try HandlerWithMSS.init(perf, msquic, stream, is_initiator, &test_supported_protos, quic_buffer_pool),
            .test_env = test_env,
            .msquic = msquic,
        };
    }

    pub fn deinit(self: *TestPerfStreamContext) void {
        self.perf.deinit();
        _ = self.msquic.StreamClose.?(self.stream_handle);
        self.allocator.destroy(self);
    }

    pub fn initiateMSS(self: *TestPerfStreamContext, stream_handle: MsQuic.HQUIC, proto: []const u8) !void {
        self.perf.initiateMSS(stream_handle, proto);
    }

    pub fn handleEvent(self: *TestPerfStreamContext, stream: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) QuicStatus.EventHandlerError!QuicStatus.EventHandlerStatus {
        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                self.deinit();
            },
            else => {
                return try self.perf.handleEvent(stream, event);
            },
        }

        return .Success;
    }

    pub fn handlePerfEvent(handler: *Handler, _: MsQuic.HQUIC, event: Event) void {
        switch (event) {
            .done => |measurements| {
                log.info("Done with perf: Duration={}", .{measurements.duration});
                const self = @fieldParentPtr(TestPerfStreamContext, "perf", HandlerWithMSS.getParentPtrFromWrappedHandler(handler));
                self.test_env.done_semaphore.post();
            },
        }
    }
};

pub const TestMeta = struct {
    upload_size_bytes: u64,
    download_size_bytes: u64,
};

pub fn runTestDialer(allocator: Allocator, comptime Node: anytype, proto_to_dial: []const u8, listener_multiaddr: *const []const u8, addr_semaphore: *std.Thread.Semaphore) !void {
    const libp2p = @import("../libp2p.zig");
    const multiaddr = libp2p.multiaddr;

    addr_semaphore.wait();

    const ma = try multiaddr.decodeMultiaddr(allocator, listener_multiaddr.*);
    defer ma.deinit(allocator);

    var client = try Node.init(allocator);
    client.test_env.meta = .{
        .upload_size_bytes = 1 << 10,
        .download_size_bytes = 1 << 10,
    };

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

    log.info("Starting Upload test", .{});
    client.test_env.meta = .{
        .upload_size_bytes = 10 << 20,
        .download_size_bytes = 0,
    };
    _ = try client.startStream(stream_and_conn.conn, id);
    // Wait for perf to finish
    client.test_env.done_semaphore.wait();

    log.info("Starting Download test", .{});
    client.test_env.meta = .{
        .upload_size_bytes = 0,
        .download_size_bytes = 10 << 20,
    };
    _ = try client.startStream(stream_and_conn.conn, id);
    // Wait for perf to finish
    client.test_env.done_semaphore.wait();

    log.info("Shutting down", .{});
}

test "Perf protocol" {
    // std.testing.log_level = .debug;
    std.testing.log_level = .info;
    const test_util = @import("../util/test_util.zig");
    const TestNode = @import("../util/test_util.zig").TestNode;
    const Node = TestNode(TestPerfStreamContext, TestMeta, TestPerfStreamContext.init);
    const allocator = std.testing.allocator;
    const Semaphore = std.Thread.Semaphore;

    var shutdown_listener_sem: Semaphore = .{};
    var listener_multiaddr_semaphore: Semaphore = .{};
    var listener_multiaddr: []const u8 = undefined;

    var listener_thread = try std.Thread.spawn(.{}, test_util.runListener, .{ allocator, Node, "0.0.0.0", &listener_multiaddr, &listener_multiaddr_semaphore, &shutdown_listener_sem });
    try runTestDialer(allocator, Node, id, &listener_multiaddr, &listener_multiaddr_semaphore);

    shutdown_listener_sem.post();
    listener_thread.join();
}
