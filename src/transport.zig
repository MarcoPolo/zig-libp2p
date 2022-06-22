const std = @import("std");
const MsQuicTransport = @import("./transport/msquic.zig");

const Transport = union {
    MsQuicTransport: MsQuicTransport,

    fn init() !Transport {
        return try .{ .MsQuicTransport = MsQuicTransport.init() };
    }

    fn deinit() void {
        self.MsQuicTransport.deinit();
    }

    fn listen(self: Transport, addr: std.net.Address) !Transport {
        return try .{ .MsQuicTransport = self.MsQuicTransport.listen(addr) };
    }
};
