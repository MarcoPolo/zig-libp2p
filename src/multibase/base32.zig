// Forked from https://github.com/gernest/base32
const std = @import("std");
const testing = std.testing;
const log = std.log.scoped(.base32);

const encode_std = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567";
const encode_hex = "0123456789ABCDEFGHIJKLMNOPQRSTUV";
const crockford_alphabet = "0123456789ABCDEFGHJKMNPQRSTVWXYZ";

pub const std_encoding = Encoding.initWithPadding(encode_std, std_padding_char);
pub const hex_encoding = Encoding.initWithPadding(encode_hex, std_padding_char);
pub const crockford_encoding = Encoding.initWithPadding(crockford_alphabet, null);
const std_padding_char = '=';

pub const Encoding = struct {
    buf: [32]u8,
    decode_map: [256]u8,
    pad_char: ?u8 = null,

    pub fn init(encoder_string: []const u8) Encoding {
        return initWithPadding(encoder_string, null);
    }

    pub fn initWithPadding(encoder_string: []const u8, pad_char: ?u8) Encoding {
        std.debug.assert(encoder_string.len == 32);
        if (pad_char) |c| {
            std.debug.assert(!(c == 'r' or c == '\n' or c > 0xff));
        }
        return Encoding{
            .buf = blk: {
                var a: [32]u8 = undefined;
                std.mem.copy(u8, a[0..], encoder_string);
                break :blk a;
            },
            .decode_map = blk: {
                var a = [_]u8{0xFF} ** 256;
                for (encoder_string) |c, i| {
                    a[@intCast(usize, c)] = @intCast(u8, i);
                }
                break :blk a;
            },
            .pad_char = pad_char,
        };
    }

    pub fn encodeLen(self: Encoding, n: usize) usize {
        if (self.pad_char == null) {
            return (n * 8 + 4) / 5;
        }
        return (n + 4) / 5 * 8;
    }

    pub fn encode(
        self: Encoding,
        destination: []u8,
        source: []const u8,
    ) []const u8 {
        var dst = destination;
        var src = source;
        var n: usize = 0;
        while (src.len > 0) {
            var b = [_]u8{0} ** 8;
            switch (src.len) {
                1 => {
                    case1(b[0..], src);
                },
                2 => {
                    case2(b[0..], src);
                    case1(b[0..], src);
                },
                3 => {
                    case3(b[0..], src);
                    case2(b[0..], src);
                    case1(b[0..], src);
                },
                4 => {
                    case4(b[0..], src);
                    case3(b[0..], src);
                    case2(b[0..], src);
                    case1(b[0..], src);
                },
                else => {
                    b[7] = src[4] & 0x1F;
                    b[6] = src[4] >> 5;
                    case4(b[0..], src);
                    case3(b[0..], src);
                    case2(b[0..], src);
                    case1(b[0..], src);
                },
            }
            const size = dst.len;
            if (size >= 8) {
                dst[0] = self.buf[b[0] & 31];
                dst[1] = self.buf[b[1] & 31];
                dst[2] = self.buf[b[2] & 31];
                dst[3] = self.buf[b[3] & 31];
                dst[4] = self.buf[b[4] & 31];
                dst[5] = self.buf[b[5] & 31];
                dst[6] = self.buf[b[6] & 31];
                dst[7] = self.buf[b[7] & 31];
                n += 8;
            } else {
                var i: usize = 0;
                while (i < size) : (i += 1) {
                    dst[i] = self.buf[b[i] & 31];
                }
                n += i;
            }
            if (src.len < 5) {
                if (self.pad_char == null) break;
                dst[7] = self.pad_char.?;
                if (src.len < 4) {
                    dst[6] = self.pad_char.?;
                    dst[5] = self.pad_char.?;
                    if (src.len < 3) {
                        dst[4] = self.pad_char.?;
                        if (src.len < 2) {
                            dst[3] = self.pad_char.?;
                            dst[2] = self.pad_char.?;
                        }
                    }
                }
                break;
            }
            src = src[5..];
            dst = dst[8..];
        }
        return destination[0..n];
    }

    pub fn decodeLen(self: Encoding, n: usize) usize {
        if (self.pad_char == null) return n * 5 / 8;
        return n / 8 * 5;
    }

    pub fn decode(
        self: Encoding,
        dest: []u8,
        source: []const u8,
    ) ![]const u8 {
        var num_newlines: usize = 0;
        for (source) |c| {
            if (c == '\r' or c == '\n') num_newlines += 1;
        }
        if (num_newlines > 0) {
            // src contains new lines.
        }
        if (dest.len < self.decodeLen(source.len)) {
            return error.NotEnoughSpace;
        }
        var dst = dest;
        var src = source;
        var end: bool = false;
        var n: usize = 0;

        var dsti: usize = 0;
        var olen = src.len;
        while (src.len > 0 and !end) {
            var dbuf = [_]u8{0} ** 8;
            var dlen: usize = 8;
            var j: usize = 0;
            while (j < 8) {
                if (src.len == 0) {
                    if (self.pad_char != null) {
                        // We have reached the end and are missing padding
                        return error.MissingPadding;
                    }
                    dlen = j;
                    end = true;
                    break;
                }
                const in = src[0];
                src = src[1..];
                if (self.pad_char != null and in == self.pad_char.? and j >= 2 and src.len < 8) {
                    // We've reached the end and there's padding
                    if (src.len + j < 8 - 1) {
                        // not enough padding
                        log.warn("incorrenct input at {}\n", .{olen});
                        return error.NotEnoughPadding;
                    }
                    var k: usize = 0;
                    while (k < 8 - 1 - j) : (k += 1) {
                        if (src.len > k and self.pad_char != null and src[k] != self.pad_char.?) {
                            // incorrect padding
                            const pos = olen - src.len + k - 1;
                            log.warn("incorrenct input at {}\n", .{pos});
                            return error.IncorrectPadding;
                        }
                    }
                    dlen = j;
                    end = true;
                    // 7, 5 and 2 are not valid padding lengths, and so 1, 3 and 6 are not
                    // valid dlen values. See RFC 4648 Section 6 "Base 32 Encoding" listing
                    // the five valid padding lengths, and Section 9 "Illustrations and
                    // Examples" for an illustration for how the 1st, 3rd and 6th base32
                    // src bytes do not yield enough information to decode a dst byte.
                    if (dlen == 1 or dlen == 3 or dlen == 6) {
                        const pos = olen - src.len - 1;
                        log.warn("incorrenct input at {}\n", .{pos});
                        return error.IncorrectPadding;
                    }
                    break;
                }
                dbuf[j] = self.decode_map[in];
                if (dbuf[j] == 0xFF) {
                    const pos = olen - src.len - 1;
                    log.warn("{} {}\n", .{ in, self.decode_map[in] });
                    for (self.decode_map) |m, idx| {
                        log.warn("== {} ={x}\n", .{ idx, m });
                    }
                    log.warn("incorrenct input at {}\n", .{pos});
                    return error.CorruptImput;
                }
                j += 1;
            }
            // Pack 8x 5-bit source blocks into 5 byte destination
            // quantum
            switch (dlen) {
                8 => {
                    dec8(dst, dsti, dbuf[0..]);
                    n += 1;
                    dec7(dst, dsti, dbuf[0..]);
                    n += 1;
                    dec5(dst, dsti, dbuf[0..]);
                    n += 1;
                    dec4(dst, dsti, dbuf[0..]);
                    n += 1;
                    dec2(dst, dsti, dbuf[0..]);
                    n += 1;
                },
                7 => {
                    dec7(dst, dsti, dbuf[0..]);
                    n += 1;
                    dec5(dst, dsti, dbuf[0..]);
                    n += 1;
                    dec4(dst, dsti, dbuf[0..]);
                    n += 1;
                    dec2(dst, dsti, dbuf[0..]);
                    n += 1;
                },
                5 => {
                    dec5(dst, dsti, dbuf[0..]);
                    n += 1;
                    dec4(dst, dsti, dbuf[0..]);
                    n += 1;
                    dec2(dst, dsti, dbuf[0..]);
                    n += 1;
                },
                4 => {
                    dec4(dst, dsti, dbuf[0..]);
                    n += 1;
                    dec2(dst, dsti, dbuf[0..]);
                    n += 1;
                },
                2 => {
                    dec2(dst, dsti, dbuf[0..]);
                    n += 1;
                },
                else => {},
            }
            dsti += 5;
        }
        return dest[0..n];
    }
};

fn dec2(dst: []u8, dsti: usize, dbuf: []u8) void {
    dst[dsti + 0] = dbuf[0] << 3 | dbuf[1] >> 2;
}

fn dec4(dst: []u8, dsti: usize, dbuf: []u8) void {
    dst[dsti + 1] = dbuf[1] << 6 | dbuf[2] << 1 | dbuf[3] >> 4;
}

fn dec5(dst: []u8, dsti: usize, dbuf: []u8) void {
    dst[dsti + 2] = dbuf[3] << 4 | dbuf[4] >> 1;
}

fn dec7(dst: []u8, dsti: usize, dbuf: []u8) void {
    dst[dsti + 3] = dbuf[4] << 7 | dbuf[5] << 2 | dbuf[6] >> 3;
}

fn dec8(dst: []u8, dsti: usize, dbuf: []u8) void {
    dst[dsti + 4] = dbuf[6] << 5 | dbuf[7];
}

fn case1(b: []u8, src: []const u8) void {
    b[1] |= (src[0] << 2) & 0x1F;
    b[0] = src[0] >> 3;
}

fn case2(b: []u8, src: []const u8) void {
    b[3] |= (src[1] << 4) & 0x1F;
    b[2] = (src[1] >> 1) & 0x1F;
    b[1] = (src[1] >> 6) & 0x1F;
}

fn case3(b: []u8, src: []const u8) void {
    b[4] |= (src[2] << 1) & 0x1F;
    b[3] = (src[2] >> 4) & 0x1F;
}

fn case4(b: []u8, src: []const u8) void {
    b[6] |= (src[3] << 3) & 0x1F;
    b[5] = (src[3] >> 2) & 0x1F;
    b[4] = src[3] >> 7;
}

const TestPair = struct {
    decoded: []const u8,
    encoded: []const u8,
};
const pairs = [_]TestPair{
    TestPair{ .decoded = "", .encoded = "" },
    TestPair{ .decoded = "f", .encoded = "MY======" },
    TestPair{ .decoded = "fo", .encoded = "MZXQ====" },
    TestPair{ .decoded = "foo", .encoded = "MZXW6===" },
    TestPair{ .decoded = "foob", .encoded = "MZXW6YQ=" },
    TestPair{ .decoded = "fooba", .encoded = "MZXW6YTB" },
    // Wikipedia examples, converted to base32
    TestPair{ .decoded = "sure.", .encoded = "ON2XEZJO" },
    TestPair{ .decoded = "sure", .encoded = "ON2XEZI=" },
    TestPair{ .decoded = "sur", .encoded = "ON2XE===" },
    TestPair{ .decoded = "su", .encoded = "ON2Q====" },
    TestPair{ .decoded = "leasure.", .encoded = "NRSWC43VOJSS4===" },
    TestPair{ .decoded = "easure.", .encoded = "MVQXG5LSMUXA====" },
    TestPair{ .decoded = "easure.", .encoded = "MVQXG5LSMUXA====" },
    TestPair{ .decoded = "asure.", .encoded = "MFZXK4TFFY======" },
    TestPair{ .decoded = "sure.", .encoded = "ON2XEZJO" },
};

test "Encoding" {
    var buf: [1024]u8 = undefined;
    for (pairs) |ts| {
        const size = std_encoding.encodeLen(ts.decoded.len);
        const result = std_encoding.encode(buf[0..size], ts.decoded);
        try testing.expectEqualSlices(u8, ts.encoded, result);
    }
}

test "Decoding" {
    var buf: [1024]u8 = undefined;
    for (pairs) |ts| {
        const size = std_encoding.decodeLen(ts.encoded.len);
        var result = try std_encoding.decode(buf[0..size], ts.encoded);
        try testing.expectEqualSlices(u8, ts.decoded, result);
    }
}
