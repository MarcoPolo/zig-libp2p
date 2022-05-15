const std = @import("std");
// const mbedtls = @cImport({
//     @cInclude("mbedtls/net_sockets.h");
//     @cInclude("mbedtls/debug.h");
//     @cInclude("mbedtls/ssl.h");
//     @cInclude("mbedtls/entropy.h");
//     @cInclude("mbedtls/ctr_drbg.h");
//     @cInclude("mbedtls/error.h");
//     @cInclude("mbedtls/certs.h");
//     @cInclude("mbedtls/timing.h");

//     @cInclude("mbedtls/platform.h");
// });

// const msquic = @cImport({
//     @cInclude("msquic.h");
// });

const c = @cImport({
    @cInclude("quiche.h");
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
    _ = c;
    return a + b;
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}

// test "basic mbedtls test" {
//     var foo: mbedtls.mbedtls_ssl_context = undefined;
//     mbedtls.mbedtls_ssl_init(&foo);
//     _ = foo;

//     try testing.expect(true);
// }

test "basic msquic test" {
    _ = c;
    // _ = c.printf("hello\n");
    // c.srand(11);
    // var r = c.rand();

    // std.debug.print("R: {}\n", .{r});
    const config = c.quiche_config_new(0xbabababa);
    const MAX_DATAGRAM_SIZE = 1350;
    std.debug.print("v: {}\n", .{config});

    var res = c.quiche_config_set_application_protos(config, "\x0ahq-interop\x05hq-29\x05hq-28\x05hq-27\x08http/0.9", 38);
    std.debug.print("res: {}\n", .{res});

    c.quiche_config_set_max_idle_timeout(config, 5000);
    c.quiche_config_set_max_recv_udp_payload_size(config, MAX_DATAGRAM_SIZE);
    c.quiche_config_set_max_send_udp_payload_size(config, MAX_DATAGRAM_SIZE);
    c.quiche_config_set_initial_max_data(config, 10000000);
    c.quiche_config_set_initial_max_stream_data_bidi_local(config, 1000000);
    c.quiche_config_set_initial_max_stream_data_uni(config, 1000000);
    c.quiche_config_set_initial_max_streams_bidi(config, 100);
    c.quiche_config_set_initial_max_streams_uni(config, 100);
    c.quiche_config_set_disable_active_migration(config, true);
}
