const std = @import("std");
const uri = @import("uri");

pub const io_mode = .evented;

const c = @cImport({
    // @cInclude("quiche.h");
    @cInclude("netdb.h");
    @cInclude("sys/socket.h");
    @cInclude("msquic.h");
});

const MsquicWrapper = @import("msquic_wrapper.zig");

const allocator = std.heap.page_allocator;

fn open_socket() !i32 {
    const os = std.os;
    var sockfd: i32 = try std.os.socket(
        os.AF.INET,
        os.SOCK.DGRAM | os.SOCK.CLOEXEC | os.SOCK.NONBLOCK,
        0,
    );
    // var addr: std.net.Address = try std.net.Address.parseIp4("127.0.0.1", 8125);
    // try os.bind(sockfd, &addr.any, @sizeOf(os.sockaddr.in));
    return sockfd;
}

// var MsQuic: *MsquicWrapper.QUIC_API_TABLE = undefined;
// const APItable = opaque {};

pub fn main() !void {
    _ = c;
    var status: u32 = 0;
    var MsQuic: *MsquicWrapper.QUIC_API_TABLE = undefined;
    const msQuicPtr = @ptrCast([*c]?*const anyopaque, &MsQuic);
    status = MsquicWrapper.MsQuicOpenVersion(MsquicWrapper.QUIC_API_VERSION_2, msQuicPtr);
    if (status > 0) {
        std.debug.print("MsQuicOpen2 failed: {}\n", .{status});
        return;
    }

    std.debug.print("Hello, world!\n", .{});
}
