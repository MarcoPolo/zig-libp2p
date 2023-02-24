const std = @import("std");

/// This is not a proper multiaddr implementation.
/// It's missing everything. It's just a placeholder really.
pub const Multiaddr = struct {};

const ip4AndPort = struct {
    ip4: [4]u8,
    port: u16,
};

// A function that takes a multiaddress string and returns an ip address and port number as a tuple
fn decodeMultiaddr(multiaddr: []const u8) !ip4AndPort {
    // Split the multiaddress by "/" delimiter
    var parts = std.mem.split(u8, multiaddr, "/");

    // Initialize variables to store ip address and port number
    var ip: [4]u8 = undefined;
    var port: u16 = undefined;

    // Iterate over the parts array
    while (parts.next()) |part| {
        // Match each part with a known protocol code or value
        if (std.mem.eql(u8, part, "ip4")) {
            var maybeNextPart = parts.next();
            if (maybeNextPart) |nextPart| {
                // Parse the ip address as four bytes separated by "."
                var bytes = std.mem.split(u8, nextPart, ".");
                var i: u8 = 0;
                while (bytes.next()) |byte| : (i += 1) {
                    if (i > 4) {
                        return error.InvalidIPAddress;
                    }
                    // Convert each byte from string to integer and store it in ip array
                    const b = std.fmt.parseInt(u8, byte, 10) catch return error.InvalidIPAddress;
                    ip[i] = b;
                }
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
        } else {}
    }

    // Return ip address and port number as a tuple
    return .{
        .ip4 = ip,
        .port = port,
    };
}

test "decode simple multiaddrs" {
    const testcases = .{
        .{ "/ip4/1.2.3.4/tcp/1234/tls/p2p/QmFoo", ip4AndPort{ .ip4 = [4]u8{ 1, 2, 3, 4 }, .port = 1234 } },
        .{ "/ip4/1.2.3.4/udp/1234/tls/p2p/QmFoo", ip4AndPort{ .ip4 = [4]u8{ 1, 2, 3, 4 }, .port = 1234 } },
        .{ "/ip4/4.3.2.1/udp/4321/tls/p2p/QmFoo", ip4AndPort{ .ip4 = [4]u8{ 4, 3, 2, 1 }, .port = 4321 } },
    };
    inline for (testcases) |tc| {
        const ipPort = try decodeMultiaddr(tc[0]);
        try std.testing.expectEqual(tc[1], ipPort);
    }
}
