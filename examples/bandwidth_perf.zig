const std = @import("std");
const Allocator = std.mem.Allocator;
const _ = @import("base32");
const MsQuicTransport = @import("zig-libp2p").MsQuicTransport;
const HandleError = @import("zig-libp2p").HandleError;
pub const StreamHandle = MsQuicTransport.StreamSystem.Handle;

const crypto = @import("zig-libp2p").crypto;
const PeerID = crypto.PeerID;

const Libp2p = @import("zig-libp2p").Libp2p;

pub const io_mode = .evented;

const BandwidthPerf = struct {
    const id = "/libp2p/test/data";
    const buf_size = 1 << 20;

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

        std.debug.print("Handling request for test data", .{});

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

const Responder = struct {
    libp2p: Libp2p,

    fn init(allocator: Allocator, host_key: crypto.ED25519KeyPair) !@This() {
        const libp2p = try Libp2p.init(allocator, .{ .host_key = host_key });
        return @This(){ .libp2p = libp2p };
    }

    fn deinit(self: *@This(), allocator: Allocator) void {
        self.libp2p.deinit(allocator);
    }

    fn start(
        self: *@This(),
    ) !void {
        var libp2p = &self.libp2p;
        try libp2p.handleStream(BandwidthPerf.id, *MsQuicTransport, self.libp2p.transport, BandwidthPerf.handler);
        try self.libp2p.listen(try std.net.Address.resolveIp("127.0.0.1", 54321));
    }
};

pub fn main() !void {
    const allocator = std.heap.c_allocator;
    const mode = std.os.argv[1];
    var len = std.mem.indexOfSentinel(u8, 0, mode);
    if (std.mem.eql(u8, "server", mode[0..len])) {
        var secret_key_env = std.os.getenv("SECRET_KEY");
        var responder_key = if (secret_key_env == null) blk: {
            var k = try crypto.ED25519KeyPair.new();
            std.debug.print("Secret key: {s}\n\n", .{(try k.privKey())[0..]});
            break :blk k;
        } else blk: {
            break :blk try crypto.ED25519KeyPair.fromPrivKey(secret_key_env.?[0..crypto.ED25519KeyPair.priv_b32_size]);
        };

        defer responder_key.deinit();
        const peer_id_str = responder_key.toPubKey().toPeerIDString() catch {
            @panic("Failed to get peerid");
        };
        std.debug.print("Responder peer id: {s}\n", .{peer_id_str});

        var responder = try Responder.init(allocator, responder_key);
        var waiter = std.Thread.Semaphore{};
        responder.start() catch {
            @panic("responder failed to start");
        };
        waiter.wait();
        defer responder.deinit(allocator);
    } else if (std.mem.eql(u8, "client", mode[0..len])) {
        // TODO not really implemented.
        var initiator_key = try crypto.ED25519KeyPair.new();
        defer initiator_key.deinit();

        var initator = try Libp2p.init(allocator, .{ .host_key = initiator_key });
        defer initator.deinit(allocator);

        // var peer = try (crypto.ED25519KeyPair.PublicKey{ .key = responder_key.key }).toPeerID();
        // try BandwidthPerf.initiateBandwidthPerf(&initator, try std.net.Address.resolveIp("127.0.0.1", 54321), peer);
    } else {
        @panic("Expected server or client as command");
    }
}
