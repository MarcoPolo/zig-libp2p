const std = @import("std");
const uri = @import("uri");

pub const io_mode = .evented;

const c = @cImport({
    @cInclude("quiche.h");
    @cInclude("netdb.h");
    @cInclude("sys/socket.h");
});

const allocator = std.heap.page_allocator;

fn open_socket() !i32 {
    const os = std.os;
    var sockfd: i32 = try std.os.socket(
        os.AF.INET,
        os.SOCK.DGRAM | os.SOCK.CLOEXEC | os.SOCK.NONBLOCK,
        // os.SOCK.DGRAM,
        0,
    );
    // var addr: std.net.Address = try std.net.Address.parseIp4("127.0.0.1", 8125);
    // try os.bind(sockfd, &addr.any, @sizeOf(os.sockaddr.in));
    return sockfd;
}

pub fn main() !void {
    const config = c.quiche_config_new(0xbabababa);
    defer c.quiche_config_free(config);

    const MAX_DATAGRAM_SIZE = 1350;

    _ = c.quiche_config_set_application_protos(config, "\x0ahq-interop\x05hq-29\x05hq-28\x05hq-27\x08http/0.9", 38);

    // *CAUTION*: this should not be set to `false` in production!!!
    c.quiche_config_verify_peer(config, false);

    // var buf: [65535]u8 = undefined;
    var out: [MAX_DATAGRAM_SIZE]u8 = undefined;

    c.quiche_config_set_max_idle_timeout(config, 5000);
    c.quiche_config_set_max_recv_udp_payload_size(config, MAX_DATAGRAM_SIZE);
    c.quiche_config_set_max_send_udp_payload_size(config, MAX_DATAGRAM_SIZE);
    c.quiche_config_set_initial_max_data(config, 10000000);
    c.quiche_config_set_initial_max_stream_data_bidi_local(config, 1000000);
    c.quiche_config_set_initial_max_stream_data_uni(config, 1000000);
    c.quiche_config_set_initial_max_streams_bidi(config, 100);
    c.quiche_config_set_initial_max_streams_uni(config, 100);
    c.quiche_config_set_disable_active_migration(config, true);

    // Generate a random source connection ID for the connection.
    var scid: [c.QUICHE_MAX_CONN_ID_LEN]u8 = undefined;
    std.crypto.random.bytes(&scid);

    std.debug.print("scid: {}\n", .{std.fmt.fmtSliceHexLower(&scid)});
    const url_string = std.mem.sliceTo(std.os.argv[1], 0);
    std.debug.print("url_string: {s}\n", .{url_string});
    const url = try uri.parse(url_string);
    std.debug.print("url: {s}", .{url.host});

    const node_hostname = try std.cstr.addNullByte(allocator, url.host.?);
    defer allocator.free(node_hostname);

    const port_c = try std.fmt.allocPrint(allocator, "{}\x00", .{443});
    defer allocator.free(port_c);

    const hints = c.addrinfo{
        .ai_family = std.os.AF.UNSPEC,
        .ai_socktype = std.os.SOCK.DGRAM,
        .ai_protocol = std.os.IPPROTO.UDP,
        .ai_flags = std.c.AI.NUMERICSERV,
        .ai_canonname = null,
        .ai_addr = null,
        .ai_addrlen = 0,
        .ai_next = null,
    };
    var res: [*c]c.addrinfo = undefined;
    var err_code = c.getaddrinfo(node_hostname, std.meta.assumeSentinel(port_c, 0), &hints, &res);
    if (err_code != 0) {
        std.debug.print("Error: {}", .{err_code});
        return error.UnexpedError;
    }
    defer c.freeaddrinfo(res);

    std.debug.print("peer: {}\n", .{res.*.ai_protocol});
    std.debug.print("byte size: {}\n", .{@sizeOf(@TypeOf(scid))});

    // TODO use cstr
    var conn = c.quiche_connect(node_hostname, &scid, @sizeOf(@TypeOf(scid)), res.*.ai_addr, res.*.ai_addrlen, config);
    defer c.quiche_conn_free(conn);

    std.debug.print("conn: {}\n", .{conn});

    // let (write, send_info) = conn.send(&mut out).expect("initial send failed");
    // conn.

    var send_info: c.quiche_send_info = undefined;
    var written = c.quiche_conn_send(conn, &out, @sizeOf(@TypeOf(out)), &send_info);
    std.debug.print("wrote: {}\n", .{written});

    if (written < 0) {
        std.debug.print("failed to write error: {}\n", .{written});
        return error.UnexpedError;
    }

    var sockfd: i32 = try open_socket();
    // const os = std.os;
    // var sockfd = c.socket(res.*.ai_family,
    //     // os.SOCK.DGRAM | os.SOCK.CLOEXEC | os.SOCK.NONBLOCK,
    //     // os.SOCK.DGRAM | os.SOCK.CLOEXEC ,
    //     os.SOCK.DGRAM ,
    //     0,
    //  );
     if (sockfd < 0) {
       std.debug.print("Failed to open socket: {}\n", .{sockfd});
       return error.UnexpectedError;
     }

    const written_usize: usize = @intCast(usize, written);
    // const send_info_wrap = std.os.sockaddr{
    //     // .family = 2,
    //     .family = std.os.AF.INET,
    //     .len = ,
    //     .data = .{
    //         104,
    //         22,
    //         8,
    //         38,
    //         0,
    //         0,
    //         0,
    //         0,
    //         0,
    //         0,
    //         0,
    //         0,
    //         0,
    //         0,
    //     },
    // };

    // std.debug.print("wrote: {}\n", .{send_info.to});
    const loop = std.event.Loop.instance orelse return error.UnexpectedError;
    const sent = try loop.sendto(sockfd, out[0..written_usize], 0, @ptrCast(*const std.os.sockaddr, &send_info.to), send_info.to_len);
    // const sent = try loop.sendto(sockfd, out[0..written_usize], 0, &send_info_wrap, @sizeOf(@TypeOf(send_info_wrap)));
    // const sent = c.sendto(sockfd, &out, written_usize, 0, @ptrCast(*const c.sockaddr, &send_info.to), send_info.to_len);
    std.debug.print("sent: {}\n", .{sent});
    if (sent != written) {
        std.debug.print("failed to send error: {}\n", .{sent});
        return error.UnexpectedError;
    }
}
