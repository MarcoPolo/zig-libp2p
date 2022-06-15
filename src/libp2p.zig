const std = @import("std");
const Allocator = std.mem.Allocator;
const MsQuicTransport = @import("./transports/msquic.zig");

// TODO we should dynamically resize the connections array below. For now allocate at once.
const MAX_CONNS = 1024;
const MAX_SUBSTREAMS = 1 << 12;

const Connection = struct {};

const Handle = packed struct {
    // Where in our backing array is this thing?
    index: u24,
    // Pattern to check for old handles and free slots. 0 = free or destroyed.
    pattern: u8,
};

const Transport = struct {
    // fn dial() !void {}
    // listen
    // dial
};

const Substream = struct {};
const SubstreamSystem = struct {
    const SubstreamHandle = struct {
        handle: Handle,
        connection: Substream,
    };

    free_slots: std.SinglyLinkedList(Handle),
    active_substreams: [MAX_SUBSTREAMS]SubstreamHandle,

    // listenOn() !void
    // dial()
};

const ConnectionSystem = struct {
    const ConnectionHandle = struct {
        handle: Handle,
        connection: Connection,
    };

    active_conns: [MAX_CONNS]ConnectionHandle,
    free_slots: std.SinglyLinkedList(Handle),

    fn init() !void {}

    fn deinit() void {}

    // dial()
};

const Peer = struct {
    id: [:0]u8,
    // TODO
    // generate_id()
};
const MultiAddr = struct {
    ma: []u8,
};

const PeerSystem = struct {
    const PeerAddrs = std.AutoHashMap(Peer, MultiAddr);
    peer_addrs: PeerAddrs,
};

pub const libp2p = struct {};

test {
    _ = @import("./transports/msquic.zig");
    _ = @import("./crypto/openssl.zig");
    _ = @import("./crypto.zig");
    std.testing.refAllDecls(@This());
}

test "basic" {
    const testing = std.testing;
    try testing.expectEqual(2, 2);
}

// TODOs
// - accept options for msquic
// - generate key from seed
// - serialize key
