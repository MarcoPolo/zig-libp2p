const std = @import("std");
const MsQuic = @import("msquic");
const libp2p = @import("libp2p");
const CredentialConfigHelper = @import("libp2p-msquic").crypto.CredentialConfigHelper;
const getPeerPubKey = @import("libp2p-msquic").crypto.getPeerPubKey;
const multiaddr = libp2p.multiaddr;
const log = std.log;
const perf = libp2p.protocols.perf;
const TestNode = libp2p.util.test_util.TestNode;

const TestPerfStreamContext = perf.TestPerfStreamContext;

pub fn main() anyerror!void {
    const allocator = std.heap.c_allocator;

    const Node = TestNode(TestPerfStreamContext, perf.TestMeta, TestPerfStreamContext.init);
    var node = try Node.init(allocator);
    defer node.deinit();

    node.test_env.meta = .{
        .upload_size_bytes = 10 << 20,
        .download_size_bytes = 10 << 10,
    };

    // Some random quic-v1 peer with an ED25519 Key
    // const bootstrap_peer = "/ip4/34.221.29.193/udp/4001/quic-v1/p2p/12D3KooWEBQi1GAUt1Ypftkvv1y2G9L2QHvjJ9A8oWRTDSnLwWLe";
    // Read bootrap_peer from args
    var args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    log.info("Args are: {s}", .{args});

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
        .proto = perf.id,
    });
    defer node.msquic.ConnectionShutdown.?(stream_and_conn.conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);
    node.test_env.done_semaphore.wait();

    log.info("Shutting down", .{});
}
