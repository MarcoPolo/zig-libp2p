const std = @import("std");
const clap = @import("clap");
const MsQuic = @import("msquic");
const libp2p = @import("libp2p");
const CredentialConfigHelper = @import("libp2p-msquic").crypto.CredentialConfigHelper;
const getPeerPubKey = @import("libp2p-msquic").crypto.getPeerPubKey;
const multiaddr = libp2p.multiaddr;
const log = std.log;
const perf = libp2p.protocols.perf;
const test_util = libp2p.util.test_util;
const TestNode = libp2p.util.test_util.TestNode;

const TestPerfStreamContext = perf.TestPerfStreamContext;

const params = clap.parseParamsComptime(
    \\--run-server              Run the server. 
    \\--server-address <str>    The server address. Can be used when listening to specify the address to listen on.
    \\--n-times <usize>         An option parameter, which takes a value.
    \\--upload-bytes <usize>    An option parameter, which takes a value.
    \\--download-bytes <usize>  An option parameter, which takes a value.
    \\
);

pub fn main() anyerror!void {
    var res = try clap.parse(clap.Help, &params, clap.parsers.default, .{});
    defer res.deinit();

    const allocator = std.heap.c_allocator;

    const Node = TestNode(TestPerfStreamContext, perf.TestMeta, TestPerfStreamContext.init);
    var node = try Node.init(allocator);
    defer node.deinit();

    if (res.args.@"run-server") {
        var shutdown_listener_sem: std.Thread.Semaphore = .{};
        var listener_multiaddr_semaphore: std.Thread.Semaphore = .{};
        var listener_multiaddr: []const u8 = undefined;
        var serverListenAddr: [:0]const u8 = blk: {
            if (res.args.@"server-address") |server_address| {
                const bootstrap_ma = try multiaddr.decodeMultiaddr(allocator, server_address);
                break :blk bootstrap_ma.target;
            } else {
                break :blk try allocator.dupeZ(u8, "0.0.0.0:4001");
            }
        };
        log.info("Listening on {s}", .{serverListenAddr});
        defer allocator.free(serverListenAddr);
        var listener_thread = try std.Thread.spawn(.{}, test_util.runListener, .{ allocator, Node, serverListenAddr, &listener_multiaddr, &listener_multiaddr_semaphore, &shutdown_listener_sem });
        listener_multiaddr_semaphore.wait();
        log.info("{s}", .{listener_multiaddr});
        listener_thread.join();
        return;
    }

    node.test_env.meta = .{
        .upload_size_bytes = res.args.@"upload-bytes".?,
        .download_size_bytes = res.args.@"download-bytes".?,
    };

    const bootstrap_peer = res.args.@"server-address".?;

    const bootstrap_ma = try multiaddr.decodeMultiaddr(allocator, bootstrap_peer);
    defer bootstrap_ma.deinit(allocator);

    var stream_and_conn = try node.dialAndStartStream(.{
        .target = bootstrap_ma.target,
        .target_port = bootstrap_ma.port,
        .proto = perf.id,
    });
    defer node.msquic.ConnectionShutdown.?(stream_and_conn.conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);
    node.test_env.done_semaphore.wait();
    var perf_duration = node.test_env.meta.perf_duration;

    var perf_durations = std.ArrayList(f32).init(allocator);
    defer perf_durations.deinit();

    try perf_durations.append(@intToFloat(f32, perf_duration) / std.time.ns_per_s);

    const n_times = res.args.@"n-times".?;
    var i: usize = 1;

    while (i < n_times) : (i += 1) {
        _ = try node.startStream(stream_and_conn.conn, perf.id);
        // Wait for perf to finish
        node.test_env.done_semaphore.wait();
        perf_duration = node.test_env.meta.perf_duration;
        try perf_durations.append(@intToFloat(f32, perf_duration) / std.time.ns_per_s);
    }
    // log.info("perfs {any}", .{perf_durations.items});

    var string = std.ArrayList(u8).init(allocator);
    try std.json.stringify(perf_durations.items, .{}, string.writer());
    var stdout = std.io.getStdOut();

    try stdout.writer().print("{s}", .{string.items});

    log.info("Shutting down", .{});
}
