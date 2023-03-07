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

fn linkQuiche(l: anytype) void {
    // TODO get this from somewhere else
    l.addIncludePath("/nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include");
    l.addIncludePath("/Users/marco/code/quiche/quiche/include");
    l.addLibraryPath("/Users/marco/code/quiche/target/release");
    l.linkSystemLibraryName("quiche");
    l.linkLibC();
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

fn linkMsquic(allocator: std.mem.Allocator, target: std.zig.CrossTarget, l: *std.build.LibExeObjStep) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);
    // Built with nix. See flake.nix (which sets this), and `msquic.nix` for build details.
    const msquic_dir = vars.get("LIB_MSQUIC").?;

    l.addLibraryPath(try std.fs.path.join(allocator, &.{
        msquic_dir,
        "src/inc",
    }));

    const os = target.os_tag orelse builtin.os.tag;
    const arch = target.cpu_arch orelse builtin.cpu.arch;

    if (os == .linux) {
        // l.addLibPath(vars.get("GLIBC").?);
        // l.addLibPath(try std.fs.path.join(allocator, &.{
        //     vars.get("GLIBC").?,
        //     "..",
        //     "lib64",
        // }));
        // l.linkSystemLibraryName("c");
        // l.linkSystemLibrary("c");
        l.linkLibC();
    }

    const libmsquic_os_path = switch (os) {
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
    var frameworks_in_nix_cflags = std.mem.split(u8, vars.get("NIX_CFLAGS_COMPILE").?, " ");
    var next_is_framework = false;
    while (frameworks_in_nix_cflags.next()) |val| {
        if (next_is_framework) {
            // std.debug.print("nix framework paths: {s}\n", .{val});
            l.addFrameworkPath(val);
        }
        next_is_framework = std.mem.eql(u8, val, "-iframework");
    }

    l.linkFramework("Security");
    l.linkFramework("Foundation");
    l.linkFramework("CoreFoundation");
}

fn addCryptoTestStep(allocator: std.mem.Allocator, b: *std.build.Builder, mode: std.builtin.Mode, test_filter: []const u8) !void {
    const tests = b.addTest("src/crypto.zig");
    tests.setBuildMode(mode);
    // Handle reading zig-deps.nix output
    try addZigDeps(allocator, tests);
    tests.filter = test_filter;
    try linkOpenssl(allocator, tests);
    try includeLibSystemFromNix(allocator, tests);
    const tests_step = b.step("crypto-tests", "Run libp2p crypto tests");
    tests_step.dependOn(&tests.step);
}

pub fn buildInterop(b: *std.build.Builder, allocator: Allocator, mode: std.builtin.Mode, target: std.zig.CrossTarget, test_filter: []const u8) anyerror!void {
    const msquic_builder = @import("./zig-msquic/build.zig");
    // const interop = b.addExecutable("interop", "interop/main.zig");

    // interop.addPackage(std.build.Pkg{
    //     .name = "msquic",
    //     .source = .{
    //         .path = "zig-msquic/src/msquic_wrapper.zig",
    //     },
    // });

    // interop.addPackage(std.build.Pkg{ .name = "libp2p-msquic", .source = .{
    //     .path = "src/msquic.zig",
    // }, .dependencies = &[_]std.build.Pkg{.{
    //     .name = "msquic",
    //     .source = .{
    //         .path = "zig-msquic/src/msquic_wrapper.zig",
    //     },
    // }} });
    // interop.addPackage(std.build.Pkg{
    //     .name = "libp2p",
    //     .source = .{
    //         .path = "src/libp2p.zig",
    //     },
    //     .dependencies = &[_]std.build.Pkg{.{
    //         .name = "msquic",
    //         .source = .{
    //             .path = "zig-msquic/src/msquic_wrapper.zig",
    //         },
    //     }},
    // });

    // interop.setBuildMode(mode);

    // try msquic_builder.linkMsquic(allocator, target, interop, true);
    // try includeLibSystemFromNix(allocator, interop);

    // const interop_step = b.step("interop", "Build interop binary");
    // interop_step.dependOn(&b.addInstallArtifact(interop).step);

    // const run_interop_step = b.step("run-interop", "Run interop");
    // run_interop_step.dependOn(&interop.run().step);

    const interop_test = b.addTest("interop/main.zig");
    interop_test.filter = test_filter;
    try msquic_builder.linkMsquic(allocator, target, interop_test, true);
    try includeLibSystemFromNix(allocator, interop_test);

    interop_test.addPackage(std.build.Pkg{
        .name = "msquic",
        .source = .{
            .path = "zig-msquic/src/msquic_wrapper.zig",
        },
    });

    interop_test.addPackage(std.build.Pkg{
        .name = "okredis",
        .source = .{
            .path = "interop/okredis/src/okredis.zig",
        },
    });

    interop_test.addPackage(std.build.Pkg{ .name = "libp2p-msquic", .source = .{
        .path = "src/msquic.zig",
    }, .dependencies = &[_]std.build.Pkg{.{
        .name = "msquic",
        .source = .{
            .path = "zig-msquic/src/msquic_wrapper.zig",
        },
    }} });
    interop_test.addPackage(std.build.Pkg{
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

    interop_test.setBuildMode(mode);

    const test_interop_step = b.step("run-interop-test", "Run interop self test");
    test_interop_step.dependOn(&interop_test.step);
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

    try addCryptoTestStep(allocator, b, mode, test_filter);
    try buildInterop(b, allocator, mode, target, test_filter);
}
