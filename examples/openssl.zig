// Example of calling openssl from zig
const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    // See https://github.com/ziglang/zig/issues/515
    @cDefine("_NO_CRT_STDIO_INLINE", "1");
    @cInclude("openssl/evp.h");
    @cInclude("openssl/ec.h");
    @cInclude("openssl/pem.h");
});

pub fn main() !void {
    var pkey: ?*c.EVP_PKEY = null;
    print("Key is {}\n", .{c.EVP_PKEY_ED25519});
    {
        var pctx: ?*c.EVP_PKEY_CTX = c.EVP_PKEY_CTX_new_id(c.EVP_PKEY_ED25519, null);
        _ = c.EVP_PKEY_keygen_init(pctx);
        _ = c.EVP_PKEY_keygen(pctx, &pkey);
        defer c.EVP_PKEY_CTX_free(pctx);
    }

    // Print private key to stdout
    _ = c.PEM_write_PrivateKey(c.__stdoutp, pkey, null, null, @as(c_int, 0), null, @intToPtr(?*anyopaque, @as(c_int, 0)));
    return;
}
