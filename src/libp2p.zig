pub const crypto = @import("./crypto.zig");
pub const multiaddr = @import("./multiaddr.zig");
pub const util = struct {
    pub usingnamespace @import("./util/memory_pool.zig");
    pub const test_util = @import("./util/test_util.zig");
};

pub const protocols = struct {
    pub const ping = @import("./protocols/ping.zig");
    pub const perf = @import("./protocols/perf.zig");
    pub const mss = @import("./protocols/multistream_select.zig");
};

const MsQuic = @import("msquic");

var libp2p_proto_name = "libp2p".*;
pub const alpn = MsQuic.QUIC_BUFFER{
    .Length = @sizeOf(@TypeOf(libp2p_proto_name)) - 1,
    .Buffer = @ptrCast([*c]u8, libp2p_proto_name[0..]),
};

test {
    _ = util.test_util;
    _ = protocols.perf;
    _ = protocols.ping;
    _ = protocols.mss;
}
