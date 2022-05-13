const std = @import("std");
const mbedtls = @cImport({
    @cInclude("mbedtls/net_sockets.h");
    @cInclude("mbedtls/debug.h");
    @cInclude("mbedtls/ssl.h");
    @cInclude("mbedtls/entropy.h");
    @cInclude("mbedtls/ctr_drbg.h");
    @cInclude("mbedtls/error.h");
    @cInclude("mbedtls/certs.h");
    @cInclude("mbedtls/timing.h");

    @cInclude("mbedtls/platform.h");
});

const msquic = @cImport({
    @cInclude("msquic.h");
});
const testing = std.testing;

// What needs to be built
//
// PoC ping protocol.
// 1. Peer Identity
// 2. TCP connection
// 3. TLS upgrade
// 4. Yamux stream
// 5. quic ? Maybe replace 2->4

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}

test "basic mbedtls test" {
    var foo: mbedtls.mbedtls_ssl_context = undefined;
    mbedtls.mbedtls_ssl_init(&foo);
    _ = foo;

    try testing.expect(true);
}

test "basic msquic test" {
    const api_table: *msquic.MsQuic = undefined;
    _ = api_table;
}
