const std = @import("std");
usingnamespace @import("msquic_wrapper.zig");

test {
    _ = @import("./perf/throughput_client.zig");
}

test "start msquic" {
    const MsQuic = @import("msquic_wrapper.zig");
    var status: u32 = 0;
    var msquic: *MsQuic.QUIC_API_TABLE = undefined;
    const msQuicPtr = @ptrCast([*c]?*const anyopaque, &msquic);
    status = MsQuic.MsQuicOpenVersion(MsQuic.QUIC_API_VERSION_2, msQuicPtr);
    if (status > 0) {
        std.debug.print("MsQuicOpen2 failed: {}\n", .{status});
        return;
    }
    defer MsQuic.MsQuicClose(msquic);

    const app_name: [:0]const u8 = "quicsample";
    const reg_config = MsQuic.QUIC_REGISTRATION_CONFIG{
        .AppName = @ptrCast([*c]const u8, app_name),
        .ExecutionProfile = MsQuic.QUIC_EXECUTION_PROFILE_LOW_LATENCY,
    };
    var registration: MsQuic.HQUIC = undefined;
    status = msquic.RegistrationOpen.?(&reg_config, &registration);
    if (status > 0) {
        std.debug.print("registration failed: {}\n", .{status});
        return;
    }
    defer msquic.RegistrationClose.?(registration);
}
