const std = @import("std");
const Allocator = std.mem.Allocator;
const MsQuicTransport = @import("../transport/msquic.zig").MsQuicTransport;
const HandleError = @import("../handle.zig").HandleError;
pub const StreamHandle = MsQuicTransport.StreamSystem.Handle;

const crypto = @import("../crypto.zig");
const PeerID = crypto.PeerID;

const Libp2p = @import("../libp2p.zig").Libp2p;

const BandwidthPerf = struct {
    const id = "/libp2p/test/data";
    const buf_size = 1024;

    fn handler(transport: *MsQuicTransport, stream: StreamHandle) void {
        var frame = transport.allocator.create(@Frame(handlerAsync)) catch {
            @panic("Failed to allocate");
        };
        frame.* = async handlerAsync(transport, stream);
    }
    fn handlerAsync(transport: *MsQuicTransport, stream: StreamHandle) void {
        defer {
            suspend {
                transport.allocator.destroy(@frame());
            }
        }

        var buf1 = [_]u8{0} ** buf_size;

        {
            var incoming_stream_ptr = transport.stream_system.handle_allocator.getPtr(stream) catch {
                @panic("todo fixme 1");
            };
            incoming_stream_ptr.resetFlags();
        }

        while (true) {
            var incoming_stream_ptr = transport.stream_system.handle_allocator.getPtr(stream) catch |err| {
                if (err == HandleError.StaleHandle) {
                    std.debug.print("Client closed stream. Handle was stale", .{});
                    return;
                }

                std.debug.print("Err: {}. {}\n\n", .{ err, @typeInfo(@TypeOf(err)) });
                @panic("todo fixme 2");
            };
            std.crypto.random.bytes(buf1[0..]);

            _ = incoming_stream_ptr.send(buf1[0..]) catch |err| {
                std.debug.print("Err: {}. Stream closed ?", .{err});
                return;
            };
        }
    }

    fn initiateBandwidthPerf(libp2p: *Libp2p, addr: std.net.Address, peer: PeerID) !void {
        const transport = libp2p.transport;
        var stream_handle = try libp2p.newStream(addr, peer, id);

        var i: usize = 10;

        while (i > 0) : (i -= 1) {
            var stream_ptr = try transport.stream_system.handle_allocator.getPtr(stream_handle);
            // var start = try std.time.Instant.now();

            std.debug.print("waiting for data\n\n", .{});

            // TODO return error when the stream is closed
            var leased_buf = try stream_ptr.recvWithLease();
            std.debug.print("Read {} bytes\n", .{leased_buf.buf.len});
            leased_buf.release(transport, stream_ptr);
        }

        {
            var stream_ptr = try transport.stream_system.handle_allocator.getPtr(stream_handle);
            stream_ptr.shutdownNow() catch {
                @panic("Failed to shutdown");
            };
        }

        return;
    }
};

test "bandwidth perf protocol" {
    const Responder = struct {
        libp2p: Libp2p,

        fn init(allocator: Allocator, host_key: crypto.ED25519KeyPair) !@This() {
            const libp2p = try Libp2p.init(allocator, .{ .host_key = host_key });
            return @This(){ .libp2p = libp2p };
        }

        fn deinit(self: @This(), allocator: Allocator) void {
            self.libp2p.deinit(allocator);
        }

        fn start(
            self: *@This(),
            waiter: *std.Thread.Semaphore,
        ) !void {
            var libp2p = &self.libp2p;
            try libp2p.handleStream(BandwidthPerf.id, *MsQuicTransport, self.libp2p.transport, BandwidthPerf.handler);
            try self.libp2p.listen(try std.net.Address.resolveIp("127.0.0.1", 54321));
            waiter.post();
            std.time.sleep(1 * std.time.ns_per_s);
            waiter.post();
            defer std.debug.print("\n\n\nhere?????? \n\n", .{});
        }
    };

    const allocator = std.testing.allocator;

    var initiator_key = try crypto.ED25519KeyPair.new();
    defer initiator_key.deinit();
    var responder_key = try crypto.ED25519KeyPair.new();
    defer responder_key.deinit();

    var responder = try Responder.init(allocator, responder_key);
    var waiter = std.Thread.Semaphore{};
    var responder_start_frame = async responder.start(&waiter);
    defer {
        std.debug.print("\n\n\nWaiting for semaphore\n", .{});
        waiter.wait();
        waiter.post();
        std.debug.print("\ndone waiting\n", .{});
        await responder_start_frame catch {
            @panic("Listener failed");
        };
        defer std.debug.print("\n\n\nhere!!!!! \n\n", .{});
    }

    var initator = try Libp2p.init(allocator, .{ .host_key = initiator_key });
    defer std.debug.print("\n\n\nDone here\n\n", .{});
    defer initator.deinit(allocator);

    waiter.wait();
    std.debug.print("Sending data\n\n", .{});
    var peer = try (crypto.ED25519KeyPair.PublicKey{ .key = responder_key.key }).toPeerID();
    try BandwidthPerf.initiateBandwidthPerf(&initator, try std.net.Address.resolveIp("127.0.0.1", 54321), peer);
}
