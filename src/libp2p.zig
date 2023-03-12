pub const crypto = @import("./crypto.zig");
pub const multiaddr = @import("./multiaddr.zig");
pub const util = struct {
    pub usingnamespace @import("./util/memory_pool.zig");
};

pub const protocols = struct {
    pub const Ping = @import("./protocols/ping.zig");
    pub const Perf = @import("./protocols/perf.zig");
    pub const MSS = @import("./protocols/multistream_select.zig");
};

const MsQuic = @import("msquic");

var libp2p_proto_name = "libp2p".*;
pub const alpn = MsQuic.QUIC_BUFFER{
    .Length = @sizeOf(@TypeOf(libp2p_proto_name)) - 1,
    .Buffer = @ptrCast([*c]u8, libp2p_proto_name[0..]),
};
