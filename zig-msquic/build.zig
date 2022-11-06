const std = @import("std");
const builtin = @import("builtin");
const os = std.os;

pub fn linkOpenssl(allocator: std.mem.Allocator, l: *std.build.LibExeObjStep) anyerror!void {
    const openssl_path = try std.fs.path.join(allocator, &.{ os.getenv("LIB_OPENSSL").?, "/lib" });
    const openssl_inc_path = try std.fs.path.join(allocator, &.{ os.getenv("LIB_OPENSSL").?, "/include" });
    l.addLibraryPath(openssl_path);
    l.addIncludePath(openssl_inc_path);

    l.linkSystemLibraryName("ssl");
    l.linkSystemLibraryName("crypto");
}

pub fn linkMsquic(allocator: std.mem.Allocator, target: std.zig.CrossTarget, l: *std.build.LibExeObjStep) anyerror!void {
    // Built with nix. See flake.nix (which sets this), and `msquic.nix` for build details.
    const msquic_dir = os.getenv("LIB_MSQUIC").?;

    l.addLibraryPath(try std.fs.path.join(allocator, &.{
        msquic_dir,
        "src/inc",
    }));

    const os_tag = target.os_tag orelse builtin.os.tag;
    const arch = target.cpu_arch orelse builtin.cpu.arch;

    if (os_tag == .linux) {
        l.linkLibC();
    }

    const libmsquic_os_path = switch (os_tag) {
        .macos => "macos",
        .linux => "linux",
        else => {
            @panic("untested OS. fixme :)");
        },
    };
    const arch_str = switch (arch) {
        .aarch64 => "arm64",
        .x86_64 => "x64",
        else => {
            @panic("untested arch. fixme :)");
        },
    };

    // Debug to catch issues
    // const libmsquic_arch_path = try std.fmt.allocPrint(allocator, "{s}_{s}_{s}", .{ arch_str, "Debug", "openssl" });
    // std.debug.print("{any}_\n", .{arch_str});
    const libmsquic_arch_path = try std.fmt.allocPrint(allocator, "{s}_{s}_{s}", .{ arch_str, "Release", "openssl" });

    l.addLibraryPath(try std.fs.path.join(allocator, &.{
        msquic_dir,
        "artifacts/bin",
        libmsquic_os_path,
        libmsquic_arch_path,
    }));

    try linkOpenssl(allocator, l);
    l.linkSystemLibraryName("msquic");

    // Pull framework paths from Nix CFLAGS env
    var frameworks_in_nix_cflags = std.mem.split(u8, os.getenv("NIX_CFLAGS_COMPILE").?, " ");
    var next_is_framework = false;
    while (frameworks_in_nix_cflags.next()) |val| {
        if (next_is_framework) {
            // std.debug.print("nix framework paths: {s}\n", .{val});
            l.addFrameworkPath(val);
        }
        next_is_framework = std.mem.eql(u8, val, "-iframework");
    }

    if (os_tag == .macos) {
        l.linkFramework("Security");
        l.linkFramework("Foundation");
        l.linkFramework("CoreFoundation");
    }
}

pub fn build_msquic_wrapper(allocator: std.mem.Allocator, b: *std.build.Builder) anyerror!void {
    // From Nix devshell
    const msquic_path = std.os.getenv("LIB_MSQUIC").?;

    const msquic_zig = b.addTranslateC(.{ .path = try std.fs.path.join(allocator, &.{ msquic_path, "/src/inc/msquic.h" }) });
    // Print where our msquic.h header is
    // std.debug.print("Path is {s}", .{try std.fs.path.join(allocator, &.{ msquic_path, "/src/inc/msquic.h" })});

    msquic_zig.addIncludeDir(try std.fs.path.join(allocator, &.{ msquic_path, "/src/inc/" }));

    const msquic_zig_step = b.step("msquicWrapper", "Build Zig wrapper around msquic API");
    const f: std.build.FileSource = .{ .generated = &msquic_zig.output_file };
    msquic_zig_step.dependOn(&msquic_zig.step);
    msquic_zig_step.dependOn(&b.addInstallFile(f, "msquic_wrapper.zig").step);
}

pub fn build(b: *std.build.Builder) anyerror!void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const allocator = arena.allocator();
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const tests = b.addTestExe("tests", "src/msquic.zig");
    tests.setBuildMode(mode);
    tests.filter = b.option([]const u8, "test-filter", "Skip tests that do not match filter") orelse "";
    try linkMsquic(allocator, target, tests);
    std.debug.print("Exe is in: {s} in {any}\n", .{ tests.out_filename, tests.output_dir });
    const tests_step = b.step("tests", "Build zig-msquic tests");
    tests_step.dependOn(&b.addInstallArtifact(tests).step);

    const run_tests = tests.run();
    const run_tests_step = b.step("run-tests", "Run zig-msquic tests");
    run_tests_step.dependOn(&run_tests.step);

    try build_msquic_wrapper(allocator, b);
}
