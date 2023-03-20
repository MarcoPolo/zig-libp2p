const std = @import("std");
const b58 = @import("./multibase/b58.zig");

/// This is not a proper multiaddr implementation.
const MultiAddr = struct {
    target: [:0]const u8,
    port: u16,
    peerID: []const u8,

    pub fn deinit(self: MultiAddr, allocator: std.mem.Allocator) void {
        allocator.free(self.target);
        allocator.free(self.peerID);
    }
};

// A function that takes a multiaddress string and returns an ip address and port number as a tuple
pub fn decodeMultiaddr(allocator: std.mem.Allocator, multiaddr: []const u8) !MultiAddr {
    // Split the multiaddress by "/" delimiter
    var parts = std.mem.split(u8, multiaddr, "/");

    // Initialize variables to store ip address and port number
    var ip: [:0]u8 = undefined;
    var port: u16 = undefined;
    var peer: []u8 = undefined;

    // Iterate over the parts array
    while (parts.next()) |part| {
        // Match each part with a known protocol code or value
        if (std.mem.eql(u8, part, "ip4")) {
            var maybeNextPart = parts.next();
            if (maybeNextPart) |nextPart| {
                // Parse the ip address as four bytes separated by "."
                ip = try std.fmt.allocPrintZ(allocator, "{s}", .{nextPart});
            } else {
                return error.MissingIPAddress;
            }
        } else if (std.mem.eql(u8, part, "tcp") or std.mem.eql(u8, part, "udp")) {
            var maybeNextPart = parts.next();
            if (maybeNextPart) |nextPart| {
                // Parse the port number as an unsigned integer and store it in port variable
                const p = std.fmt.parseInt(u16, nextPart, 10) catch return error.InvalidPortNumber;
                port = p;
            } else {
                return error.MissingPortNumber;
            }
        } else if (std.mem.eql(u8, part, "p2p")) {
            var maybeNextPart = parts.next();
            if (maybeNextPart) |nextPart| {
                // Parse the port number as an unsigned integer and store it in port variable
                peer = b58.decode(allocator, nextPart) catch return error.InvalidPeerID;
            } else {
                return error.MissingPeerID;
            }
        } else {}
    }

    // Return ip address and port number as a tuple
    return MultiAddr{
        .target = ip,
        .port = port,
        .peerID = peer,
    };
}

test "decode simple multiaddrs" {
    const testcases = .{
        .{ "/ip4/1.2.3.4/tcp/1234/tls/p2p/QmFoo", MultiAddr{ .target = &[4:0]u8{ 1, 2, 3, 4 }, .port = 1234, .peerID = undefined } },
        .{ "/ip4/1.2.3.4/udp/1234/tls/p2p/QmFoo", MultiAddr{ .target = &[4:0]u8{ 1, 2, 3, 4 }, .port = 1234, .peerID = undefined } },
        .{ "/ip4/4.3.2.1/udp/4321/tls/p2p/QmFoo", MultiAddr{ .target = &[4:0]u8{ 4, 3, 2, 1 }, .port = 4321, .peerID = undefined } },
    };
    const allocator = std.testing.allocator;
    inline for (testcases) |tc| {
        const ipPort = try decodeMultiaddr(allocator, tc[0]);
        try std.testing.expectEqual(tc[1], ipPort);
        allocator.free(ipPort.target);
    }
}
