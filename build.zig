const std = @import("std");

pub const log_level: std.log.Level = .debug;

const allocator = blk: {
    const Allocator = std.heap.GeneralPurposeAllocator(.{});
    var _allocator = Allocator{};
    break :blk _allocator.allocator();
};

// const mbedtls = @import("zig-mbedtls/mbedtls.zig");
// const msquic = @import("msquic.zig");
const pkgs = struct {
    const network = std.build.Pkg{
        .name = "network",
        .path = .{ .path = "network/network.zig" },
    };
    const uri = std.build.Pkg{
        .name = "uri",
        .path = .{ .path = "zig-uri/uri.zig" },
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
    // TODO get this from somewhere else
    l.addIncludeDir("/nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include");
    l.addIncludeDir("/Users/marco/code/quiche/quiche/include");
    l.addLibPath("/Users/marco/code/quiche/target/release");
    l.linkSystemLibraryName("quiche");
    l.linkLibC();
}

fn includeLibSystemFromNix(l: anytype) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);
    l.addIncludeDir(vars.get("LIBSYSTEM_INCLUDE").?);
}

fn linkMsquic(l: *std.build.LibExeObjStep) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);

    l.addIncludeDir("./msquic/src/inc/");
    // TODO Use nix to build this and set an env
    // TODO 2 What about using Zig to build this?
    l.addLibPath("./msquic/artifacts/bin/macos/arm64_Debug_openssl");
    // TODO read this from NIX
    l.addLibPath("/nix/store/dj7wifb93h9yjkg46kpsxqhl2wjsyrsf-openssl-1.1.1n/lib");
    l.linkSystemLibraryName("ssl");
    l.linkSystemLibraryName("crypto");
    l.linkSystemLibraryName("msquic");

    // Pull framework paths from Nix CFLAGS env
    var frameworks_in_nix_cflags = std.mem.split(u8, vars.get("NIX_CFLAGS_COMPILE").?, " ");
    var next_is_framework = false;
    while (frameworks_in_nix_cflags.next()) |val| {
        if (next_is_framework) {
            std.debug.print("nix framework paths: {s}\n", .{val});
            l.addFrameworkDir(val);
        }
        next_is_framework = std.mem.eql(u8, val, "-iframework");
    }

    l.linkFramework("Security");
    l.linkFramework("Foundation");
    l.linkFramework("CoreFoundation");
    // l.linkLibC();
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
    quiche_example.addPackage(pkgs.uri);
    const quiche_example_step = b.step("quicheExample", "Run quiche example");
    quiche_example_step.dependOn(&b.addInstallArtifact(quiche_example).step);

    const msquic_example = b.addExecutable("msquicExample", "examples/msquic.zig");
    msquic_example.setBuildMode(mode);
    try linkMsquic(msquic_example);
    msquic_example.addPackage(pkgs.uri);
    const msquic_example_step = b.step("msquicExample", "Run msquic example");
    msquic_example_step.dependOn(&b.addInstallArtifact(msquic_example).step);

    const msquic_zig = b.addTranslateC(.{ .path = "./msquic/src/inc/msquic.h" });
    try includeLibSystemFromNix(msquic_zig);
    msquic_zig.addIncludeDir("./msquic/src/inc/");
    const msquic_zig_step = b.step("msquicZig", "Build Zig wrapper around msquic api");
    const f: std.build.FileSource = .{ .generated = &msquic_zig.output_file };
    msquic_zig_step.dependOn(&msquic_zig.step);
    msquic_zig_step.dependOn(&b.addInstallFile(f, "msquic_wrapper.zig").step);

    const msquic_sample = b.addTranslateC(.{ .path = "./msquic/src/tools/sample/sample.c" });
    try includeLibSystemFromNix(msquic_sample);
    msquic_sample.addIncludeDir("./msquic/src/inc/");
    const msquic_sample_step = b.step("msquicSample", "Build Zig sample of msquic ");
    const f2: std.build.FileSource = .{ .generated = &msquic_sample.output_file };
    msquic_sample_step.dependOn(&msquic_sample.step);
    msquic_sample_step.dependOn(&b.addInstallFile(f2, "msquic_sample.zig").step);

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
