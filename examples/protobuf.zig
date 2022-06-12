// Example of calling openssl from zig
const std = @import("std");
const print = std.debug.print;
// const protobuf = @import("protobuf");
// const fd = protobuf.fd;
// const pb_decode = protobuf.pb_decode;
// const pb_encode = protobuf.pb_encode;
// const pb_deinit = protobuf.pb_deinit;
// const pb_init = protobuf.pb_init;
// const mem = std.mem;
// const Allocator = mem.Allocator;
// const eql = mem.eql;
// const FieldType = protobuf.FieldType;

const addrBook = @import("./address_book.zig");

pub fn main() !void {
    // _ = c;
    _ = addrBook;
    print("Hello, world! \n", .{});
}

// const c = @cImport({
//     // See https://github.com/ziglang/zig/issues/515
//     @cDefine("_NO_CRT_STDIO_INLINE", "1");
//     @cInclude("./keys/gen/keys.pb-c.c");
// });

// const Key = struct {
//     key_type: ?u32,

//     pub const _desc_table = .{ .key_type = fd(1, FieldType{ .Varint = .Simple }) };

//     pub fn encode(self: Key, allocator: Allocator) ![]u8 {
//         return pb_encode(self, allocator);
//     }

//     pub fn decode(input: []const u8, allocator: Allocator) !Key {
//         return pb_decode(Key, input, allocator);
//     }

//     pub fn deinit(self: Key) void {
//         pb_deinit(self);
//     }
// };

// pub fn main() !void {
//     const allocator = blk: {
//         const _Allocator = std.heap.GeneralPurposeAllocator(.{});
//         var _allocator = _Allocator{};
//         break :blk _allocator.allocator();
//     };
//     // _ = c;
//     _ = protobuf;
//     _ = allocator;

//     const d = Key{ .a = 1 };
//     const v = try d.encode(allocator);
//     print("Hello, world! 0x{s}\n", .{std.fmt.fmtSliceHexLower(v)});
// }
