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
const TestNode = libp2p.util.test_util.TestNode;

const Allocator = std.mem.Allocator;
const QuicStatus = MsQuic.QuicStatus;
const ArrayList = std.ArrayList;
const Instant = std.time.Instant;
const Semaphore = std.Thread.Semaphore;

const stdout = std.io.getStdOut();

const TestPingStreamContext = ping.TestPingStreamContext;

pub fn main() anyerror!void {
    const Node = TestNode(TestPingStreamContext, void, TestPingStreamContext.init);
    const allocator = std.heap.c_allocator;
    var node = try Node.init(allocator);
    defer node.deinit();
    // Some random quic-v1 peer with an ED25519 Key
    // const bootstrap_peer = "/ip4/34.221.29.193/udp/4001/quic-v1/p2p/12D3KooWEBQi1GAUt1Ypftkvv1y2G9L2QHvjJ9A8oWRTDSnLwWLe";
    // Read bootrap_peer from args
    var args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        log.err("Usage: {s} <bootstrap_peer>", .{args[0]});
        return;
    }

    const bootstrap_peer = args[1];

    const bootstrap_ma = try multiaddr.decodeMultiaddr(allocator, bootstrap_peer);
    defer bootstrap_ma.deinit(allocator);

    var stream_and_conn = try node.dialAndStartStream(.{
        .target = bootstrap_ma.target,
        .target_port = bootstrap_ma.port,
        .proto = ping.id,
    });
    var stream = stream_and_conn.stream_context;
    defer node.msquic.ConnectionShutdown.?(stream_and_conn.conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);

    // Start ping loop
    while (true) {
        node.test_env.done_semaphore.wait(); // Wait for ping to succeed
        std.time.sleep(1 * std.time.ns_per_s);
        try stream.ping.wrapped.sendPingMsg(stream.stream_handle);
    }
    log.info("Shutting down", .{});
}
