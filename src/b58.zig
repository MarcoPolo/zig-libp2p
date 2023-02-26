const std = @import("std");
const big = std.math.big;

const alphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";

fn b58ToInt(in: u8) u8 {
    if (in > '0' and in <= '9') {
        return in - '1';
    } else if (in >= 'A' and in < 'I') {
        return in - 'A' + 9;
    } else if (in >= 'J' and in < 'O') {
        return in - 'J' + 17;
    } else if (in >= 'P' and in <= 'Z') {
        return in - 'P' + 22;
    } else if (in >= 'a' and in <= 'k') {
        return in - 'a' + 33;
    } else if (in >= 'm' and in <= 'z') {
        return in - 'm' + 44;
    }
    std.debug.panic("invalid base58 character: {}", .{in});
}

fn intToB58(in: u8) u8 {
    return alphabet[in];
}

pub fn decode(allocator: std.mem.Allocator, in: []const u8) ![]u8 {
    // Count leading zeros
    var leadingZeros: usize = 0;
    for (in) |c| {
        if (c == '1') {
            leadingZeros += 1;
        } else {
            break;
        }
    }

    var i = try big.int.Managed.init(allocator);
    defer i.deinit();

    var j = try big.int.Managed.init(allocator);
    defer j.deinit();

    var base = try big.int.Managed.init(allocator);
    defer base.deinit();
    try base.set(58);

    for (in) |c| {
        try i.mul(&i, &base);
        try i.addScalar(&i, b58ToInt(c));
    }

    const bitSize = i.bitCountTwosComp();
    const byteSize = try std.math.divCeil(usize, bitSize, 8);
    var buf = try allocator.alloc(u8, byteSize + leadingZeros);
    for (buf[0..leadingZeros]) |*c| {
        c.* = 0;
    }
    i.toConst().writeTwosComplement(buf[leadingZeros..], std.builtin.Endian.Big);

    return buf;
}

fn decodeBytes(allocator: std.mem.Allocator, in: []const u8) !big.int.Managed {
    var i = try big.int.Managed.init(allocator);

    var j = try big.int.Managed.init(allocator);
    defer j.deinit();

    var base = try big.int.Managed.init(allocator);
    defer base.deinit();
    try base.set(256);

    for (in) |c| {
        try i.mul(&i, &base);
        try i.addScalar(&i, c);
    }

    return i;
}

pub fn encode(allocator: std.mem.Allocator, in: []const u8) ![]u8 {
    // count leading zeros
    var leadingZeros: usize = 0;
    for (in) |c| {
        if (c == 0) {
            leadingZeros += 1;
        } else {
            break;
        }
    }

    var i = try decodeBytes(allocator, in);
    defer i.deinit();

    var j = try big.int.Managed.init(allocator);
    defer j.deinit();

    var base = try big.int.Managed.init(allocator);
    defer base.deinit();
    try base.set(58);

    var rem = try big.int.Managed.init(allocator);
    defer rem.deinit();

    var out = std.ArrayList(u8).init(allocator);
    defer out.deinit();

    while (!i.eqZero()) {
        try i.divFloor(&rem, &i, &base);
        const idx = try rem.to(u8);
        try out.append(intToB58(idx));
    }

    // add leading zeros
    var x: usize = 0;
    while (x < leadingZeros) : (x += 1) {
        try out.append('1');
    }

    // reverse out
    for (out.items) |_, ix| {
        if (ix >= out.items.len / 2) break;
        const tmp = out.items[ix];
        out.items[ix] = out.items[out.items.len - ix - 1];
        out.items[out.items.len - ix - 1] = tmp;
    }

    return out.toOwnedSlice();
}

test "b58 alphabet translation" {
    std.testing.log_level = .debug;
    for (alphabet) |c, i| {
        try std.testing.expectEqual(i, b58ToInt(c));
    }
}

test "roundtrip" {
    std.testing.log_level = .debug;
    var in = [_]u8{0} ** 256;
    for (in) |_, i| {
        in[i] = @intCast(u8, i);
    }
    const allocator = std.testing.allocator;

    const res = try encode(allocator, &in);
    defer allocator.free(res);

    std.log.debug("b58 is: {s}", .{res});

    const decoded = try decode(allocator, res);
    defer allocator.free(decoded);

    std.log.debug("decoded is: {any}", .{decoded});
    try std.testing.expectEqualSlices(u8, &in, decoded);
}

test {
    std.testing.log_level = .debug;
    const allocator = std.testing.allocator;

    const res = try decode(allocator, "12D3KooWQ6XtYE7CjBxdZ9SyAJzLjJPd1JfAaZKMfRR99CpquMNm");
    defer allocator.free(res);

    std.log.debug("{s}", .{std.fmt.fmtSliceHexLower(res)});
}
