usingnamespace @import("./crypto/openssl.zig");
const base32 = @import("base32");

const b32_alphabet = "abcdefghijklmnopqrstuvwxyz234567";
pub const no_padding_encoding = base32.Encoding.initWithPadding(b32_alphabet, null);

test "base32" {
    const std = @import("std");
    const src = "Hello World";
    const size = comptime base32.std_encoding.encodeLen(src.len);
    var buf: [size]u8 = undefined;
    var out = no_padding_encoding.encode(&buf, src);
    std.debug.print("source: \"{s}\"\noutput: {s}\n", .{ src, out });
}
