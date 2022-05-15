const std = @import("std");

// const mbedtls = @import("zig-mbedtls/mbedtls.zig");
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

fn linkQuiche(l: anytype) void {
    l.addIncludeDir("/nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include");
    l.addIncludeDir("/Users/marco/code/quiche/quiche/include");
    l.addLibPath("/Users/marco/code/quiche/target/release");
    l.linkSystemLibraryName("quiche");
    l.linkLibC();
}

pub fn build(b: *std.build.Builder) anyerror!void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    // const target = b.standardTargetOptions(.{
    //     default_target = CrossTarget{

    //     },
    // });

    // const mbedtls_lib = mbedtls.create(b, target, mode);
    // try build_msquic(b);
    // const msquic_lib = msquic.create(b, target, mode);

    const udp_example = b.addExecutable("udpExample", "examples/udp.zig");
    udp_example.setBuildMode(mode);
    const udp_example_step = b.step("udpExample", "Run UDP example");
    udp_example_step.dependOn(&b.addInstallArtifact(udp_example).step);

    const quiche_example = b.addExecutable("quicheExample", "examples/quiche.zig");
    quiche_example.setBuildMode(mode);
    linkQuiche(quiche_example);
    const quiche_example_step = b.step("quicheExample", "Run quiche example");
    quiche_example_step.dependOn(&b.addInstallArtifact(quiche_example).step);

    const lib = b.addStaticLibrary("zig-libp2p", "src/main.zig");
    // lib.linkLibC();
    // lib.linkLibCpp();
    lib.setBuildMode(mode);
    // lib.addPackage(pkgs.network);
    // mbedtls_lib.link(lib);
    lib.install();

    const main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    main_tests.addIncludeDir("/nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include");
    main_tests.addIncludeDir("/Users/marco/code/quiche/quiche/include");
    main_tests.addLibPath("/Users/marco/code/quiche/target/release");
    main_tests.linkSystemLibraryName("quiche");
    main_tests.linkLibC();

    // msquic_lib.link(main_tests);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
