const std = @import("std");
const builtin = @import("builtin");
const Allocator = std.mem.Allocator;
// const build_msquic = @import("./build_msquic.zig").build_msquic;

// pub const log_level: std.log.Level = .debug;

// const mbedtls = @import("zig-mbedtls/mbedtls.zig");
// const msquic = @import("msquic.zig");
// const pkgs = struct {
// const network = std.build.Pkg{
//     .name = "network",
//     .path = .{ .path = "network/network.zig" },
// };
// const uri = std.build.Pkg{
//     .name = "uri",
//     .path = .{ .path = "zig-uri/uri.zig" },
// };
// };

// fn build_msquic(b: *std.build.Builder) anyerror!void {
//     const DOtherSide_dir = b.addSystemCommand(&[_][]const u8{
//         "mkdir",
//         "-p",
//         "msquic/build",
//     });
//     try DOtherSide_dir.step.make();
//     const DOtherSide_prebuild = b.addSystemCommand(&[_][]const u8{
//         "cmake",
//         "-G",
//         "Unix Makefiles",
//         "..",
//     });
//     DOtherSide_prebuild.cwd = "msquic/build";
//     try DOtherSide_prebuild.step.make();
//     const DOtherSide_build = b.addSystemCommand(&[_][]const u8{
//         "cmake",
//         "--build",
//         ".",
//     });
//     DOtherSide_build.cwd = "msquic/build";
//     try DOtherSide_build.step.make();
// }

fn addZigDeps(allocator: Allocator, step: anytype) !void {
    // Handle reading zig-deps.nix output

    // Open the file
    const file = try std.fs.openFileAbsolute((try std.process.getEnvMap(std.testing.allocator)).get("ZIG_DEPS").?, .{ .mode = .read_only });
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
        step.addPackage(dep_pkg);
    }
}

fn linkQuiche(l: anytype) void {
    // TODO get this from somewhere else
    l.addIncludeDir("/nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include");
    l.addIncludeDir("/Users/marco/code/quiche/quiche/include");
    l.addLibPath("/Users/marco/code/quiche/target/release");
    l.linkSystemLibraryName("quiche");
    l.linkLibC();
}

fn includeLibSystemFromNix(allocator: Allocator, l: anytype) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);
    l.addIncludeDir(vars.get("LIBSYSTEM_INCLUDE").?);
}

fn includeProtobuf(allocator: Allocator, l: anytype) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);
    l.addIncludeDir(vars.get("PB_INCLUDE").?);
    l.addIncludeDir("./pb");
}

fn linkOpenssl(allocator: std.mem.Allocator, l: *std.build.LibExeObjStep) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);

    const openssl_path = try std.fs.path.join(allocator, &.{ vars.get("LIB_OPENSSL").?, "/lib" });
    const openssl_inc_path = try std.fs.path.join(allocator, &.{ vars.get("LIB_OPENSSL").?, "/include" });
    l.addLibPath(openssl_path);
    l.addIncludeDir(openssl_inc_path);

    l.linkSystemLibraryName("ssl");
    l.linkSystemLibraryName("crypto");
}

fn linkMsquic(allocator: std.mem.Allocator, target: std.zig.CrossTarget, l: *std.build.LibExeObjStep) anyerror!void {
    var vars = try std.process.getEnvMap(allocator);
    // Built with nix. See flake.nix (which sets this), and `msquic.nix` for build details.
    const msquic_dir = vars.get("LIB_MSQUIC").?;

    l.addLibPath(try std.fs.path.join(allocator, &.{
        msquic_dir,
        "src/inc",
    }));

    const os = target.os_tag orelse builtin.os.tag;
    const arch = target.cpu_arch orelse builtin.cpu.arch;

    const libmsquic_os_path = switch (os) {
        .macos => "macos",
        else => {
            @panic("untested OS. fixme :)");
        },
    };
    const arch_str = switch (arch) {
        .aarch64 => "arm64",
        else => {
            @panic("untested arch. fixme :)");
        },
    };

    // Debug to catch issues
    const libmsquic_arch_path = try std.fmt.allocPrint(allocator, "{s}_{s}_{s}", .{ arch_str, "Debug", "openssl" });

    l.addLibPath(try std.fs.path.join(allocator, &.{
        msquic_dir,
        "artifacts/bin",
        libmsquic_os_path,
        libmsquic_arch_path,
    }));

    // TODO read this from NIX

    try linkOpenssl(allocator, l);
    l.linkSystemLibraryName("msquic");

    // Pull framework paths from Nix CFLAGS env
    var frameworks_in_nix_cflags = std.mem.split(u8, vars.get("NIX_CFLAGS_COMPILE").?, " ");
    var next_is_framework = false;
    while (frameworks_in_nix_cflags.next()) |val| {
        if (next_is_framework) {
            // std.debug.print("nix framework paths: {s}\n", .{val});
            l.addFrameworkDir(val);
        }
        next_is_framework = std.mem.eql(u8, val, "-iframework");
    }

    l.linkFramework("Security");
    l.linkFramework("Foundation");
    l.linkFramework("CoreFoundation");
}

pub fn build(b: *std.build.Builder) anyerror!void {
    const allocator = blk: {
        const _Allocator = std.heap.GeneralPurposeAllocator(.{});
        var _allocator = _Allocator{};
        break :blk _allocator.allocator();
    };
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();
    const target = b.standardTargetOptions(.{});

    // const target = b.standardTargetOptions(.{
    //     default_target = CrossTarget{

    //     },
    // });

    // const mbedtls_lib = mbedtls.create(b, target, mode);
    // try build_msquic(b);

    // const msquic_lib = msquic.create(b, target, mode);
    // const build_msquic_lib = try build_msquic(b);
    // const msquic_library_step = b.step("MsQuic", "Build the MsQuic library");
    // msquic_library_step.dependOn(&build_msquic_lib.step);

    const udp_example = b.addExecutable("udpExample", "examples/udp.zig");
    udp_example.setBuildMode(mode);
    const udp_example_step = b.step("udpExample", "Run UDP example");
    udp_example_step.dependOn(&b.addInstallArtifact(udp_example).step);

    const quiche_example = b.addExecutable("quicheExample", "examples/quiche.zig");
    quiche_example.setBuildMode(mode);
    linkQuiche(quiche_example);
    // quiche_example.addPackage(pkgs.uri);
    const quiche_example_step = b.step("quicheExample", "Run quiche example");
    quiche_example_step.dependOn(&b.addInstallArtifact(quiche_example).step);

    const libp2p_benchmarks = b.addTest("src/benchmarks/main.zig");
    try addZigDeps(allocator, libp2p_benchmarks);
    const libp2p_benchmarks_step = b.step("benchmark", "Run benchmarks");
    libp2p_benchmarks_step.dependOn(&libp2p_benchmarks.step);

    const libp2p_tests = b.addTest("src/libp2p.zig");
    libp2p_tests.setBuildMode(mode);
    libp2p_tests.test_evented_io = true;

    // const test_filter = b.option([]const u8, "test-filter", "Skip tests that do not match filter") orelse "";
    // const test_cases_options = b.addOptions();
    // libp2p_tests.addOptions("test_options", test_cases_options);
    // test_cases_options.addOption(?[]const u8, "test_filter", test_filter);

    // libp2p_tests.addOptions(test_filter);
    // libp2p_tests.filter = test_filter;

    var vars = try std.process.getEnvMap(allocator);
    libp2p_tests.filter = vars.get("TEST_FILTER") orelse "";
    // libp2p_tests.filter = b.option([]const u8, "test-filter", "Skip tests that do not match filter") orelse "";

    // Handle reading zig-deps.nix output
    try addZigDeps(allocator, libp2p_tests);

    // libp2p_tests.filter = "Sign and Verify";
    // libp2p_tests.filter = "Spin up transport";
    // libp2p_tests.filter = "Deserialize Public Key proto";
    try linkMsquic(allocator, target, libp2p_tests);
    try includeLibSystemFromNix(allocator, libp2p_tests);
    libp2p_tests.addIncludeDir("src/workaround");
    const libp2p_tests_step = b.step("libp2p_tests", "Run libp2p tests");
    libp2p_tests_step.dependOn(&libp2p_tests.step);

    const msquic_example = b.addExecutable("msquicExample", "examples/msquic.zig");
    msquic_example.setBuildMode(mode);
    try linkMsquic(allocator, target, msquic_example);
    // msquic_example.addPackage(pkgs.uri);
    const msquic_example_step = b.step("msquicExample", "Run msquic example");
    msquic_example_step.dependOn(&b.addInstallArtifact(msquic_example).step);

    const openssl_example = b.addExecutable("opensslExample", "examples/openssl.zig");
    openssl_example.setBuildMode(mode);
    // try linkOpenssl(allocator, openssl_example);
    try linkMsquic(allocator, target, openssl_example);
    try includeLibSystemFromNix(allocator, openssl_example);
    const openssl_example_step = b.step("opensslExample", "Run openssl example");
    openssl_example_step.dependOn(&b.addInstallArtifact(openssl_example).step);

    const protobuf_example = b.addExecutable("protobufExample", "examples/protobuf.zig");
    protobuf_example.setBuildMode(mode);
    protobuf_example.addPackagePath("protobuf", "zig-protobuf/src/protobuf.zig");
    try includeLibSystemFromNix(allocator, protobuf_example);
    try includeProtobuf(allocator, protobuf_example);
    const protobuf_example_step = b.step("protobufExample", "Run pb example");
    protobuf_example_step.dependOn(&b.addInstallArtifact(protobuf_example).step);

    const msquic_zig = b.addTranslateC(.{ .path = "./msquic/src/inc/msquic.h" });
    try includeLibSystemFromNix(allocator, msquic_zig);
    msquic_zig.addIncludeDir("./msquic/src/inc/");
    const msquic_zig_step = b.step("msquicZig", "Build Zig wrapper around msquic api");
    const f: std.build.FileSource = .{ .generated = &msquic_zig.output_file };
    msquic_zig_step.dependOn(&msquic_zig.step);
    msquic_zig_step.dependOn(&b.addInstallFile(f, "msquic_wrapper.zig").step);

    // const msquic_sample = b.addTranslateC(.{ .path = "./msquic/src/tools/sample/sample.c" });
    // try includeLibSystemFromNix(msquic_sample);
    // msquic_sample.addIncludeDir("./msquic/src/inc/");
    // const msquic_sample_step = b.step("msquicSample", "Build Zig sample of msquic ");
    // const f2: std.build.FileSource = .{ .generated = &msquic_sample.output_file };
    // msquic_sample_step.dependOn(&msquic_sample.step);
    // msquic_sample_step.dependOn(&b.addInstallFile(f2, "msquic_sample.zig").step);

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
