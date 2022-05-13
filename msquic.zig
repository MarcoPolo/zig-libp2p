const std = @import("std");
const Builder = std.build.Builder;
const LibExeObjStep = std.build.LibExeObjStep;

pub const Library = struct {
    step: *LibExeObjStep,

    pub fn link(self: Library, other: *LibExeObjStep) void {
        other.addIncludeDir(core_include_dir);
        other.linkLibrary(self.step);
    }
};

fn root() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

const root_path = root() ++ "/" ++ "msquic";
pub const include_dir = root_path ++ "/src/inc";
pub const core_include_dir = root_path ++ "/src/core";
// const library_include = root_path ++ "/library";

pub fn create(b: *Builder, target: std.zig.CrossTarget, mode: std.builtin.Mode) Library {
    const ret = b.addStaticLibrary("msquic", null);
    ret.setTarget(target);
    ret.setBuildMode(mode);
    ret.addIncludeDir(include_dir);
    ret.addIncludeDir(core_include_dir);
    ret.defi

    // ret.addCSourceFiles(srcs, &.{"-Os"});
    ret.addCSourceFiles(srcs, &.{});
    ret.linkLibC();

    // if (target.isWindows())
    //     ret.linkSystemLibrary("ws2_32");

    return Library{ .step = ret };
}

const srcs = &.{
    core_include_dir ++ "/ack_tracker.c",
    core_include_dir ++ "/api.c",
    core_include_dir ++ "/binding.c",
    core_include_dir ++ "/configuration.c",
    core_include_dir ++ "/congestion_control.c",
    core_include_dir ++ "/connection.c",
    core_include_dir ++ "/crypto.c",
    core_include_dir ++ "/crypto_tls.c",
    core_include_dir ++ "/cubic.c",
    core_include_dir ++ "/datagram.c",
    core_include_dir ++ "/frame.c",
    core_include_dir ++ "/library.c",
    core_include_dir ++ "/listener.c",
    core_include_dir ++ "/lookup.c",
    core_include_dir ++ "/loss_detection.c",
    core_include_dir ++ "/mtu_discovery.c",
    core_include_dir ++ "/operation.c",
    core_include_dir ++ "/packet.c",
    core_include_dir ++ "/packet_builder.c",
    core_include_dir ++ "/packet_space.c",
    core_include_dir ++ "/path.c",
    core_include_dir ++ "/range.c",
    core_include_dir ++ "/recv_buffer.c",
    core_include_dir ++ "/registration.c",
    core_include_dir ++ "/send.c",
    core_include_dir ++ "/send_buffer.c",
    core_include_dir ++ "/sent_packet_metadata.c",
    core_include_dir ++ "/settings.c",
    core_include_dir ++ "/stream.c",
    core_include_dir ++ "/stream_recv.c",
    core_include_dir ++ "/stream_send.c",
    core_include_dir ++ "/stream_set.c",
    core_include_dir ++ "/timer_wheel.c",
    core_include_dir ++ "/worker.c",
    core_include_dir ++ "/version_neg.c",
    core_include_dir ++ "/operation.h",
    core_include_dir ++ "/stream.h",
    core_include_dir ++ "/connection.h",
};
