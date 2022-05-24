const std = @import("std");

pub const io_mode = .evented;

fn open_socket() !i32 {
    const os = std.os;
    var sockfd: i32 = try std.os.socket(
        os.AF.INET,
        os.SOCK.DGRAM | os.SOCK.CLOEXEC | os.SOCK.NONBLOCK,
        0,
    );
    var addr: std.net.Address = try std.net.Address.parseIp4("127.0.0.1", 8125);
    try os.bind(sockfd, &addr.any, @sizeOf(os.sockaddr.in));
    return sockfd;
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"world"});
    // reading buffer
    var array: [8192]u8 = undefined;
    var buf: []u8 = &array;

    var sockfd: i32 = try open_socket();
    std.debug.print("starting the listener on 127.0.0.1:8125\n", .{});
    const loop = std.event.Loop.instance orelse return error.UnexpectedError;

    while (true) {
        std.debug.print("Waiting for data\n", .{});

        var f = async loop.recvfrom(sockfd, buf, 0, null, null);
        const rlen = try await f;
        std.debug.print("Read {} bytes. Content: {s}\n", .{ rlen, buf[0..rlen] });
    }
}
