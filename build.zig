const std = @import("std");

const pkgs = struct {
    const network = std.build.Pkg{
        .name = "network",
        .path = .{ .path = "network/network.zig" },
    };
};

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const lib = b.addStaticLibrary("zig-libp2p", "src/main.zig");
    lib.setBuildMode(mode);
    lib.addPackage(pkgs.network);
    lib.install();

    const main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);
    main_tests.addPackage(pkgs.network);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
