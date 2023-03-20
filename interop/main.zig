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
const ping = libp2p.protocols.ping;

const Allocator = std.mem.Allocator;
const QuicStatus = MsQuic.QuicStatus;
const ArrayList = std.ArrayList;
const Instant = std.time.Instant;
const Semaphore = std.Thread.Semaphore;

const ifaddrs = @cImport({
    @cInclude("ifaddrs.h");
});

const stdout = std.io.getStdOut();

const TestEnv = libp2p.util.test_util.TestEnv(void);
pub const InteropStreamContext = struct {
    allocator: Allocator,
    stream_handle: MsQuic.HQUIC,
    ping: ping.HandlerWithMSS,
    test_env: *TestEnv,
    start_time: std.time.Instant,
    pub fn init(
        allocator: Allocator,
        msquic: *MsQuic.QUIC_API_TABLE,
        stream: MsQuic.HQUIC,
        is_initiator: bool,
        quic_buffer_pool: *MemoryPool(MsQuic.QUIC_BUFFER),
        test_env: *TestEnv,
    ) error{OutOfMemory}!InteropStreamContext {
        log.debug("Creating ping stream context", .{});
        const pingHandler = ping.Handler.init(InteropStreamContext.handlePingEvent, msquic, is_initiator, quic_buffer_pool);

        var supported_protos = [_][]const u8{ping.id};
        return .{
            .allocator = allocator,
            .stream_handle = stream,
            .ping = try ping.HandlerWithMSS.init(pingHandler, msquic, stream, is_initiator, &supported_protos, quic_buffer_pool),
            .test_env = test_env,
            .start_time = std.time.Instant.now() catch unreachable,
        };
    }

    pub fn deinit(self: *InteropStreamContext) void {
        self.allocator.destroy(self);
        self.ping.deinit();
    }

    pub fn initiateMSS(self: *InteropStreamContext, stream_handle: MsQuic.HQUIC, proto: []const u8) !void {
        self.ping.initiateMSS(stream_handle, proto);
    }

    pub fn handleEvent(self: *InteropStreamContext, stream: MsQuic.HQUIC, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) QuicStatus.EventHandlerError!QuicStatus.EventHandlerStatus {
        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                self.deinit();
                return .Success;
            },
            else => {
                return try self.ping.handleEvent(stream, event);
            },
        }
    }

    pub fn handlePingEvent(handler: *ping.Handler, _: MsQuic.HQUIC, event: ping.Event) MsQuic.QUIC_STATUS {
        switch (event) {
            .ping_response_received => |dur| {
                log.info("Ping took: {} us", .{dur / 1000});
                const durMs = @intToFloat(f32, dur) / 1_000_000;
                const stdout_writer = stdout.writer();
                const now = std.time.Instant.now() catch {
                    return QuicStatus.InternalError;
                };
                const self = @fieldParentPtr(InteropStreamContext, "ping", ping.HandlerWithMSS.getParentPtrFromWrappedHandler(handler));
                const durSinceStart = @intToFloat(f32, now.since(self.start_time)) / std.time.ns_per_ms;
                _ = stdout_writer.write("bytes: []const u8") catch unreachable;
                stdout_writer.print("{{\"handshakePlusOneRTTMillis\": {d:.3}, \"pingRTTMilllis\": {d:.3}}}\n", .{ durSinceStart, durMs }) catch unreachable;
                self.test_env.done_semaphore.post();
            },
        }
        return QuicStatus.Success;
    }
};

const test_util = libp2p.util.test_util;
const TestNode = test_util.TestNode;
const Node = TestNode(InteropStreamContext, void, InteropStreamContext.init);

pub fn main() anyerror!void {
    const allocator = std.heap.c_allocator;

    const redisAddrEnv = std.os.getenv("redis_addr") orelse "redis:6379";
    const timeout_secs = std.fmt.parseInt(usize, std.os.getenv("test_timeout_seconds") orelse "180", 10) catch unreachable;

    const ip: [:0]const u8 = try std.fmt.allocPrintZ(allocator, "{s}", .{std.os.getenv("ip") orelse "0.0.0.0"});
    defer allocator.free(ip);

    const is_dialer = std.mem.eql(u8, std.os.getenv("is_dialer") orelse "", "true");

    var redis_parts = std.mem.split(u8, redisAddrEnv, ":");
    const redis_host = redis_parts.next().?;
    var redis_port = try std.fmt.parseInt(u16, redis_parts.next().?, 10);

    const redis_conn = try std.net.tcpConnectToHost(allocator, redis_host, redis_port);
    var redis_client: okredis.Client = undefined;
    try redis_client.init(redis_conn);
    defer redis_client.close();

    if (is_dialer) {
        const FixBuf = okredis.types.FixBuf;
        const listener_addr_resp = try redis_client.send([2]FixBuf(128), .{ "BLPOP", "listenerAddr", "0" });
        const listener_addr = listener_addr_resp[1].toSlice();
        log.info("Dialing {s}", .{listener_addr});
        var addr_semaphore = Semaphore{ .permits = 1 };
        try test_util.runDialer(allocator, Node, ping.id, &listener_addr, &addr_semaphore);
    } else {
        var shutdown_listener_sem: Semaphore = .{};
        var listener_multiaddr_semaphore: Semaphore = .{};
        var listener_multiaddr: []const u8 = undefined;
        var listener_thread = try std.Thread.spawn(.{}, test_util.runListener, .{ allocator, Node, "0.0.0.0", &listener_multiaddr, &listener_multiaddr_semaphore, &shutdown_listener_sem });
        listener_multiaddr_semaphore.wait();
        try redis_client.send(void, .{ "RPUSH", "listenerAddr", listener_multiaddr });
        log.info("Sent listener multiaddr to redis", .{});
        std.time.sleep(timeout_secs * std.time.ns_per_s);
        shutdown_listener_sem.post();
        listener_thread.join();
    }
}

test "ping interop" {
    std.testing.log_level = .info;
    const allocator = std.testing.allocator;

    var shutdown_listener_sem: Semaphore = .{};
    var listener_multiaddr_semaphore: Semaphore = .{};
    var listener_multiaddr: []const u8 = undefined;

    var listener_thread = try std.Thread.spawn(.{}, test_util.runListener, .{ allocator, Node, "0.0.0.0", &listener_multiaddr, &listener_multiaddr_semaphore, &shutdown_listener_sem });
    try test_util.runDialer(allocator, Node, ping.id, &listener_multiaddr, &listener_multiaddr_semaphore);

    shutdown_listener_sem.post();
    listener_thread.join();
}
