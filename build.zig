const std = @import("std");
const builtin = @import("builtin");
const Allocator = std.mem.Allocator;

fn addZigDeps(allocator: Allocator, step: anytype) !void {
    // Handle reading zig-deps.nix output

    // Open the file

    const file = try std.fs.openFileAbsolute(std.os.getenv("ZIG_DEPS").?, .{ .mode = .read_only });
    defer file.close();

    // Read the contents
    const max_buffer_size = 1_000_000;
    const file_buffer = try file.readToEndAlloc(allocator, max_buffer_size);
    defer allocator.free(file_buffer);

    var parser = std.json.Parser.init(allocator, false);
    defer parser.deinit();

    var tree = parser.parse(file_buffer) catch @panic("failed to parse JSON");
    defer tree.deinit();

    var dep_iterator = tree.root.Object.iterator();
    while (dep_iterator.next()) |dep| {
        const dep_name = dep.key_ptr;
        const dep_location = dep.value_ptr.String;

        const dep_pkg = std.build.Pkg{
            .name = dep_name.*,
            .source = .{ .path = dep_location },
        };
        // std.debug.print("Adding pkg {s} {s}\n", .{ dep_name.*, dep_location });
        step.addPackage(dep_pkg);
    }
}

fn includeLibSystemFromNix(allocator: Allocator, l: anytype) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);
    l.addIncludePath(vars.get("LIBSYSTEM_INCLUDE").?);
}

fn includeLibSystemFromNix2(allocator: Allocator, l: *std.build.TranslateCStep) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);
    l.addIncludeDir(vars.get("LIBSYSTEM_INCLUDE").?);
}

fn includeProtobuf(allocator: Allocator, l: anytype) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);
    l.addIncludePath(vars.get("PB_INCLUDE").?);
    l.addIncludePath("./pb");
}

fn linkOpenssl(allocator: std.mem.Allocator, l: *std.build.LibExeObjStep) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);

    const openssl_path = try std.fs.path.join(allocator, &.{ vars.get("LIB_OPENSSL").?, "/lib" });
    const openssl_inc_path = try std.fs.path.join(allocator, &.{ vars.get("LIB_OPENSSL").?, "/include" });
    l.addLibraryPath(openssl_path);
    l.addIncludePath(openssl_inc_path);

    l.linkSystemLibraryName("ssl");
    l.linkSystemLibraryName("crypto");
}

fn maybePatchElf(allocator: Allocator, b: *std.build.Builder, os: std.Target.Os.Tag, step: *std.build.Step, filename: []const u8) !*std.build.Step {
    const elf_interpreter = std.os.getenv("ELF_INTERPRETER") orelse "";
    if (os == .linux and (elf_interpreter).len > 0) {
        const path = try std.fmt.allocPrint(allocator, "./zig-out/bin/{s}", .{filename});
        defer allocator.free(path);
        const patchElf = b.addSystemCommand(&[_][]const u8{
            "patchelf",
            "--set-interpreter",
            elf_interpreter,
            path,
        });
        patchElf.step.dependOn(step);

        return &patchElf.step;
    } else {
        return step;
    }
}

fn addCryptoTestStep(allocator: std.mem.Allocator, b: *std.build.Builder, mode: std.builtin.Mode, target: std.zig.CrossTarget, test_filter: []const u8) !void {
    const tests = b.addTestExe("crypto-tests", "src/crypto.zig");
    tests.setBuildMode(mode);
    // Handle reading zig-deps.nix output
    try addZigDeps(allocator, tests);
    tests.filter = test_filter;
    try linkOpenssl(allocator, tests);
    try includeLibSystemFromNix(allocator, tests);

    const os = target.os_tag orelse builtin.os.tag;

    if (os == .linux) {
        tests.linkLibC();
    }
    var install_test = b.addInstallArtifact(tests);

    const tests_step = b.step("crypto-tests", "Run libp2p crypto tests");
    tests_step.dependOn(try maybePatchElf(allocator, b, os, &install_test.step, tests.out_filename));
}

pub fn buildTests(b: *std.build.Builder, allocator: Allocator, mode: std.builtin.Mode, target: std.zig.CrossTarget, test_filter: []const u8) anyerror!void {
    const msquic_builder = @import("./zig-msquic/build.zig");

    const libp2p_test = b.addTestExe("libp2p-tests", "src/libp2p.zig");
    libp2p_test.filter = test_filter;

    // Add packages and link
    inline for (.{libp2p_test}) |step| {
        try msquic_builder.linkMsquic(allocator, target, step, true);
        try includeLibSystemFromNix(allocator, step);

        step.addPackage(std.build.Pkg{
            .name = "msquic",
            .source = .{
                .path = "zig-msquic/src/msquic.zig",
            },
        });
        step.addPackage(std.build.Pkg{ .name = "libp2p-msquic", .source = .{
            .path = "src/msquic.zig",
        }, .dependencies = &[_]std.build.Pkg{.{
            .name = "msquic",
            .source = .{
                .path = "zig-msquic/src/msquic_wrapper.zig",
            },
        }} });

        step.setBuildMode(mode);
    }

    const os = target.os_tag orelse builtin.os.tag;

    const build_libp2p_test_step = b.step("libp2p-tests", "Build libp2p tests");
    build_libp2p_test_step.dependOn(try maybePatchElf(allocator, b, os, &b.addInstallArtifact(libp2p_test).step, libp2p_test.out_filename));

    const run_test_interop_step = b.step("run-libp2p-tests", "Run libp2ptests");
    run_test_interop_step.dependOn(&libp2p_test.run().step);
}

pub fn buildInterop(b: *std.build.Builder, allocator: Allocator, mode: std.builtin.Mode, target: std.zig.CrossTarget, test_filter: []const u8) anyerror!void {
    const msquic_builder = @import("./zig-msquic/build.zig");

    const interop = b.addExecutable("interop", "interop/main.zig");
    const interop_test = b.addTestExe("interop-test", "interop/main.zig");
    interop_test.filter = test_filter;

    // Add packages and link
    inline for (.{ interop, interop_test }) |step| {
        try msquic_builder.linkMsquic(allocator, target, step, false);
        try includeLibSystemFromNix(allocator, step);

        step.addPackage(std.build.Pkg{
            .name = "msquic",
            .source = .{
                .path = "zig-msquic/src/msquic_wrapper.zig",
            },
        });

        step.addPackage(std.build.Pkg{
            .name = "okredis",
            .source = .{
                .path = "interop/okredis/src/okredis.zig",
            },
        });

        step.addPackage(std.build.Pkg{ .name = "libp2p-msquic", .source = .{
            .path = "src/msquic.zig",
        }, .dependencies = &[_]std.build.Pkg{.{
            .name = "msquic",
            .source = .{
                .path = "zig-msquic/src/msquic_wrapper.zig",
            },
        }} });
        step.addPackage(std.build.Pkg{
            .name = "libp2p",
            .source = .{
                .path = "src/libp2p.zig",
            },
            .dependencies = &[_]std.build.Pkg{.{
                .name = "msquic",
                .source = .{
                    .path = "zig-msquic/src/msquic_wrapper.zig",
                },
            }},
        });

        step.setBuildMode(mode);
    }

    const os = target.os_tag orelse builtin.os.tag;

    const build_test_interop_step = b.step("interop-test", "Build interop self test");
    build_test_interop_step.dependOn(try maybePatchElf(allocator, b, os, &b.addInstallArtifact(interop_test).step, interop_test.out_filename));

    const run_test_interop_step = b.step("run-interop-test", "Run interop self test");
    run_test_interop_step.dependOn(&interop_test.run().step);

    const interop_step = b.step("interop", "Build interop binary");
    interop_step.dependOn(try maybePatchElf(allocator, b, os, &b.addInstallArtifact(interop).step, interop.out_filename));

    const run_interop_step = b.step("run-interop", "Run interop");
    run_interop_step.dependOn(&interop.run().step);
}

pub fn build(b: *std.build.Builder) anyerror!void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const allocator = arena.allocator();

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();
    const target = b.standardTargetOptions(.{});

    const test_filter = b.option([]const u8, "test-filter", "Skip tests that do not match filter") orelse "";

    try addCryptoTestStep(allocator, b, mode, target, test_filter);
    try buildInterop(b, allocator, mode, target, test_filter);
    try buildTests(b, allocator, mode, target, test_filter);
}
