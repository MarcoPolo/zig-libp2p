const std = @import("std");
const LibExeObjStep = std.build.LibExeObjStep;
const Allocator = std.mem.Allocator;

const msquic_srcs = @import("msquic_srcs.zig").srcs;

fn linkMsquic(allocator: *Allocator, l: *std.build.LibExeObjStep) anyerror!void {
    var vars = try std.process.getEnvMap(allocator.*);

    l.addIncludeDir("./msquic/src/inc/");
    // TODO Use nix to build this and set an env
    // TODO 2 What about using Zig to build this?
    // l.addLibPath("./msquic2/artifacts/bin/macos/arm64_Debug_openssl");
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
            // std.debug.print("nix framework paths: {s}\n", .{val});
            l.addFrameworkDir(val);
        }
        next_is_framework = std.mem.eql(u8, val, "-iframework");
    }

    l.linkFramework("Security");
    l.linkFramework("Foundation");
    l.linkFramework("CoreFoundation");
    // l.linkLibC();
}

pub fn build_msquic(b: *std.build.Builder) !*LibExeObjStep {
    const ret = b.addStaticLibrary("msquic", null);
    var _allocator = std.heap.GeneralPurposeAllocator(.{}){};
    var allocator = _allocator.allocator();
    try linkMsquic(&allocator, ret);

    const src_folder = std.fs.path.dirname(@src().file).?;
    std.debug.print("src folder is: {s}\n", .{src_folder});

    // ret.addCSourceFiles()
    // ret.addCSourceFiles()
    // var src_dir = try std.fs.cwd().openDir("", .{ .iterate = true });
    const msquic_src_path = try std.fs.path.join(allocator, &.{ src_folder, "msquic/src/core" });
    var src_dir = try std.fs.openDirAbsolute(msquic_src_path, .{ .iterate = true });
    defer src_dir.close();
    var dir_iterator = src_dir.iterate();

    const src_prefix = "./msquic/src/core/";
    const max_buf_size = 2048;
    var buf = try allocator.alloc(u8, max_buf_size);
    defer allocator.free(buf);
    std.mem.copy(u8, buf[0..src_prefix.len], src_prefix);
    // std.fs.openDirAbsolute()

    // const stat = try src_dir.stat();
    // std.debug.print("Stat: {}", .{stat});
    // std.fs
    // const p = try (src_dir.iterate().next());
    // std.debug.print("Stat: {s}", .{p.?.name});

    std.debug.print("\n\nHere!\n\n", .{});
    while (try dir_iterator.next()) |entry| {
        if (entry.kind == .File) {
            if (std.mem.endsWith(u8, entry.name, ".c")) {
                const name_len = src_prefix.len + entry.name.len;
                std.mem.copy(u8, buf[src_prefix.len..], entry.name);
                std.debug.print("C Source: {s}\n", .{buf[0..name_len]});
                const rel_path = buf[0..name_len];
                _ = rel_path;

                // const name = buf[0..name_len];
                // ret.addCSourceFile(rel_path, &.{});
            }
        }
    }

    // ret.addCSourceFiles(msquic_srcs, &.{"-Os"});
    ret.addCSourceFiles(msquic_srcs, &.{});

    return ret;
}
