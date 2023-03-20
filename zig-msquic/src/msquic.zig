const std = @import("std");
const wrapper = @import("msquic_wrapper.zig");
pub usingnamespace @import("msquic_wrapper.zig");

pub fn HandleEventWrapper(comptime StreamContext: type, comptime handleEvent: fn (*StreamContext, s: wrapper.HQUIC, [*c]wrapper.QUIC_STREAM_EVENT) wrapper.QuicStatus.EventHandlerError!wrapper.QuicStatus.EventHandlerStatus) type {
    return struct {
        pub fn streamCallback(stream: wrapper.HQUIC, self_ptr: ?*anyopaque, event: [*c]wrapper.struct_QUIC_STREAM_EVENT) callconv(.C) c_uint {
            const self = @ptrCast(*StreamContext, @alignCast(@alignOf(StreamContext), self_ptr));
            const status = handleEvent(self, stream, event) catch |err| {
                return wrapper.QuicStatus.EventHandlerErrorToUint(err);
            };

            return @enumToInt(status);
        }
    };
}

pub fn connectionEventToString(conn_evt_typ: c_uint) []const u8 {
    return switch (conn_evt_typ) {
        wrapper.QUIC_CONNECTION_EVENT_CONNECTED => "CONNECTED",
        wrapper.QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_TRANSPORT => "EVENT_SHUTDOWN_INITIATED_BY_TRANSPORT",
        wrapper.QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_PEER => "EVENT_SHUTDOWN_INITIATED_BY_PEER",
        wrapper.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => "EVENT_SHUTDOWN_COMPLETE",
        wrapper.QUIC_CONNECTION_EVENT_LOCAL_ADDRESS_CHANGED => "EVENT_LOCAL_ADDRESS_CHANGED",
        wrapper.QUIC_CONNECTION_EVENT_PEER_ADDRESS_CHANGED => "EVENT_PEER_ADDRESS_CHANGED",
        wrapper.QUIC_CONNECTION_EVENT_PEER_STREAM_STARTED => "EVENT_PEER_STREAM_STARTED",
        wrapper.QUIC_CONNECTION_EVENT_STREAMS_AVAILABLE => "EVENT_STREAMS_AVAILABLE",
        wrapper.QUIC_CONNECTION_EVENT_PEER_NEEDS_STREAMS => "EVENT_PEER_NEEDS_STREAMS",
        wrapper.QUIC_CONNECTION_EVENT_IDEAL_PROCESSOR_CHANGED => "EVENT_IDEAL_PROCESSOR_CHANGED",
        wrapper.QUIC_CONNECTION_EVENT_DATAGRAM_STATE_CHANGED => "EVENT_DATAGRAM_STATE_CHANGED",
        wrapper.QUIC_CONNECTION_EVENT_DATAGRAM_RECEIVED => "EVENT_DATAGRAM_RECEIVED",
        wrapper.QUIC_CONNECTION_EVENT_DATAGRAM_SEND_STATE_CHANGED => "EVENT_DATAGRAM_SEND_STATE_CHANGED",
        wrapper.QUIC_CONNECTION_EVENT_RESUMED => "EVENT_RESUMED",
        wrapper.QUIC_CONNECTION_EVENT_RESUMPTION_TICKET_RECEIVED => "EVENT_RESUMPTION_TICKET_RECEIVED",
        wrapper.QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED => "EVENT_PEER_CERTIFICATE_RECEIVED",
        else => "UNKNOWN",
    };
}

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
