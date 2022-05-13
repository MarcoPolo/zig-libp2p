const std = @import("std");

const mbedtls = @import("zig-mbedtls/mbedtls.zig");
// const msquic = @import("msquic.zig");
const pkgs = struct {
    const network = std.build.Pkg{
        .name = "network",
        .path = .{ .path = "network/network.zig" },
    };
};

fn build_msquic(b: *std.build.Builder) anyerror!void {
    const DOtherSide_dir = b.addSystemCommand(&[_][]const u8{
        "mkdir",
        "-p",
        "msquic/build",
    });
    try DOtherSide_dir.step.make();
    const DOtherSide_prebuild = b.addSystemCommand(&[_][]const u8{
        "cmake",
        "-G",
        "Unix Makefiles",
        "..",
    });
    DOtherSide_prebuild.cwd = "msquic/build";
    try DOtherSide_prebuild.step.make();
    const DOtherSide_build = b.addSystemCommand(&[_][]const u8{
        "cmake",
        "--build",
        ".",
    });
    DOtherSide_build.cwd = "msquic/build";
    try DOtherSide_build.step.make();
}

pub fn build(b: *std.build.Builder) anyerror!void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const target = b.standardTargetOptions(.{});

    const mbedtls_lib = mbedtls.create(b, target, mode);
    try build_msquic(b);
    // const msquic_lib = msquic.create(b, target, mode);

    const lib = b.addStaticLibrary("zig-libp2p", "src/main.zig");
    lib.setBuildMode(mode);
    lib.addPackage(pkgs.network);
    mbedtls_lib.link(lib);
    lib.install();

    const main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);
    main_tests.addPackage(pkgs.network);
    mbedtls_lib.link(main_tests);
    // msquic_lib.link(main_tests);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
