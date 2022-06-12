// Example of calling openssl from zig
const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    // See https://github.com/ziglang/zig/issues/515
    @cDefine("_NO_CRT_STDIO_INLINE", "1");
    @cInclude("openssl/evp.h");
    @cInclude("openssl/ec.h");
    @cInclude("openssl/pem.h");
    @cInclude("openssl/x509.h");
    @cInclude("openssl/err.h");
    @cInclude("openssl/pkcs12.h");
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

    // See: https://stackoverflow.com/questions/256405/programmatically-create-x509-certificate-using-openssl
    var x509: ?*c.X509 = null;
    x509 = c.X509_new();
    if (x509 == null) {
        print("Failed to create X509\n", .{});
        return error.genX509Failed;
    }
    defer c.X509_free(x509);

    _ = c.ASN1_INTEGER_set(c.X509_get_serialNumber(x509), 1);
    _ = c.X509_gmtime_adj(c.X509_get_notBefore(x509), 0);
    _ = c.X509_gmtime_adj(c.X509_get_notAfter(x509), 60 * 60 * 24 * 365);

    if (c.X509_set_pubkey(x509, pkey) == 0) {
        return error.setPubKeyFailed;
    }
    var name: ?*c.X509_NAME = null;
    name = c.X509_get_subject_name(x509);
    // Self signed. Issuer == subject
    if (c.X509_set_issuer_name(x509, name) == 0) {
        return error.setIssuerFailed;
    }

    _ = c.X509_NAME_add_entry_by_txt(name, "C", c.MBSTRING_ASC, "US", -1, -1, 0);
    _ = c.X509_NAME_add_entry_by_txt(name, "O", c.MBSTRING_ASC, "zig-libp2p", -1, -1, 0);
    _ = c.X509_NAME_add_entry_by_txt(name, "CN", c.MBSTRING_ASC, "localhost", -1, -1, 0);

    // Null since ed25519 doesn't support digest here
    if (c.X509_sign(x509, pkey, null) == 0) {
        var err = c.ERR_get_error();
        var err_str = [_]u8{0} ** 1024;
        while (err != 0) {
            c.ERR_error_string_n(err, err_str[0..], 1024);
            print("err code {}.\n{s}\n", .{ err, err_str });
            err = c.ERR_get_error();
        }

        return error.signFailed;
    }
    var pkcs12bundle = c.PKCS12_create(null, // certbundle access password
        "pkcs12test", // friendly certname
        pkey, // the certificate private key
        x509, // the main certificate
        null, // stack of CA cert chain
        0, // int nid_key (default 3DES)
        0, // int nid_cert (40bitRC2)
        0, // int iter (default 2048)
        0, // int mac_iter (default 1)
        0 // int keytype (default no flag)
    );

    if (pkcs12bundle == null) {
        return error.pkcs12Failed;
    }

    var bytes_buf: [*c]u8 = null;
    const bytes_written = c.i2d_PKCS12(pkcs12bundle, &bytes_buf);
    if (bytes_written <= 0) {
        return error.pkcs12SerFailed;
    }
    const bytes = bytes_buf[0..@intCast(usize, bytes_written)];
    print("pkcs12 bundle size: {}\n", .{bytes_written});
    _ = bytes;

    return;
}
