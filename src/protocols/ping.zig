const std = @import("std");
const Allocator = std.mem.Allocator;
const MsQuicTransport = @import("../transport/msquic.zig").MsQuicTransport;
pub const StreamHandle = MsQuicTransport.StreamSystem.Handle;

const crypto = @import("../crypto.zig");
const PeerID = crypto.PeerID;

const Libp2p = @import("../libp2p.zig").Libp2p;

const Ping = struct {
    const id = "/ipfs/ping/1.0.0";
    const ping_size = 32;

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

        while (true) {
            // simple echo forever
            var incoming_stream_ptr = transport.stream_system.handle_allocator.getPtr(stream) catch {
                @panic("todo fixme");
            };

            var leasedBuf = incoming_stream_ptr.recvWithLease() catch {
                @panic("todo fixme");
            };

            _ = incoming_stream_ptr.send(leasedBuf.buf) catch {
                @panic("Failed to send");
            };

            leasedBuf.release(transport, incoming_stream_ptr);
        }
    }

    fn initiatePing(libp2p: *Libp2p, addr: std.net.Address, peer: PeerID) !void {
        const transport = libp2p.transport;
        var stream_handle = try libp2p.newStream(addr, peer, id);

        var i: usize = 10;
        var buf = [_]u8{0} ** ping_size;

        while (i > 0) : (i-=1) {
            var stream_ptr = try transport.stream_system.handle_allocator.getPtr(stream_handle);
            var start = try std.time.Instant.now();

            std.crypto.random.bytes(buf[0..]);

            _ = try stream_ptr.send(buf[0..]);
            std.debug.print("waiting for data\n\n", .{});
            // TODO return error when the stream is closed
            var leasedBuf = try stream_ptr.recvWithLease();

            // Check that our bytes are the same
            if (std.mem.eql(u8, leasedBuf.buf, buf[0..])) {
                const dur = (try std.time.Instant.now()).since(start);
                std.debug.print("Ping took {}. Ping countdown is {}\n", .{dur, i});
            } else {
                std.debug.print("Ping packet was incorrect", .{});
            }

            leasedBuf.release(transport, stream_ptr);
        }
        return;
    }
};

test "ping protocol" {
    const Responder = struct {
        libp2p: Libp2p,

        fn init(allocator: Allocator, host_key: crypto.ED25519KeyPair) !@This() {
            const libp2p = try Libp2p.init(allocator, .{.host_key = host_key});
            return @This(){ .libp2p = libp2p };
        }

        fn deinit(self: @This(), allocator: Allocator) void {
            self.libp2p.deinit(allocator);
        }

        fn start(self: *@This(), waiter: *std.Thread.Semaphore,) !void {
            var libp2p = &self.libp2p;
            try libp2p.handleStream(Ping.id, *MsQuicTransport, self.libp2p.transport, Ping.handler);
            try self.libp2p.listen(try std.net.Address.resolveIp("127.0.0.1", 54321));
            waiter.post();
            std.time.sleep(1 * std.time.ns_per_s);
            waiter.post();
        }
    };

    const allocator = std.testing.allocator;

    var initiator_key = try crypto.ED25519KeyPair.new();
    defer initiator_key.deinit();
    var  responder_key = try crypto.ED25519KeyPair.new();
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

    }

    var initator = try Libp2p.init(allocator, .{.host_key = initiator_key});
    defer initator.deinit(allocator);

    waiter.wait();
    std.debug.print("Sending data\n\n", .{});
    var peer = try (crypto.ED25519KeyPair.PublicKey{ .key = responder_key.key }).toPeerID();
    try Ping.initiatePing(&initator, try std.net.Address.resolveIp("127.0.0.1", 54321), peer);
}
