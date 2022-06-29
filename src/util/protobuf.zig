// copied partly from https://github.com/Arwalk/zig-protobuf/blob/master/src/protobuf.zig
const std = @import("std");
const StructField = std.builtin.TypeInfo.StructField;
const isSignedInt = std.meta.trait.isSignedInt;
const isIntegral = std.meta.trait.isIntegral;
const Allocator = std.mem.Allocator;

// common definitions

const ArrayList = std.ArrayList;

/// Type of encoding for a Varint value.
pub const VarintType = enum { Simple, ZigZagOptimized };

/// Appends an unsigned varint value.
/// Awaits a u64 value as it's the biggest unsigned varint possible,
// so anything can be cast to it by definition
fn append_raw_varint(pb: *ArrayList(u8), value: u64) !void {
    var copy = value;
    while (copy > 0x7F) {
        try pb.append(0x80 + @intCast(u8, copy & 0x7F));
        copy = copy >> 7;
    }
    try pb.append(@intCast(u8, copy & 0x7F));
}

pub fn append_raw_varint_to_writer(dest: anytype, value: u64) !void {
    var copy = value;
    while (copy > 0x7F) {
        try dest.writeByte(0x80 + @intCast(u8, copy & 0x7F));
        copy = copy >> 7;
    }
    try dest.writeByte(@intCast(u8, copy & 0x7F));
}

/// Appends a varint to the pb array.
/// Mostly does the required transformations to use append_raw_varint
/// after making the value some kind of unsigned value.
fn append_as_varint(pb: *ArrayList(u8), value: anytype, comptime varint_type: VarintType) !void {
    if (value < 0x7F and value >= 0) {
        try pb.append(@intCast(u8, value));
    } else {
        const type_of_val = @TypeOf(value);
        const bitsize = @bitSizeOf(type_of_val);
        const val: u64 = comptime blk: {
            if (isSignedInt(type_of_val)) {
                switch (varint_type) {
                    .ZigZagOptimized => {
                        break :blk @intCast(u64, (value >> (bitsize - 1)) ^ (value << 1));
                    },
                    .Simple => {
                        break :blk @bitCast(std.meta.Int(.unsigned, bitsize), value);
                    },
                }
            } else {
                break :blk @intCast(u64, value);
            }
        };

        try append_raw_varint(pb, val);
    }
}

/// Append a value of any complex type that can be transfered as a varint
/// Only serves as an indirection to manage Enum and Booleans properly.
pub fn append_varint(pb: *ArrayList(u8), value: anytype, comptime varint_type: VarintType) !void {
    switch (@typeInfo(@TypeOf(value))) {
        .Enum => try append_as_varint(pb, @as(i32, @enumToInt(value)), varint_type),
        .Bool => try append_as_varint(pb, @as(u8, @boolToInt(value)), varint_type),
        else => try append_as_varint(pb, value, varint_type),
    }
}

/// Decoded varint value generic type
fn DecodedVarint(comptime T: type) type {
    return struct {
        value: T,
        size: usize,
    };
}

/// Decodes a varint from a slice, to type T.
pub fn decode_varint(comptime T: type, input: []const u8) DecodedVarint(T) {
    var value: T = 0;
    var index: usize = 0;

    while ((input[index] & 0b10000000) != 0) : (index += 1) {
        value += (@as(T, input[index] & 0x7F)) << (@intCast(std.math.Log2Int(T), index * 7));
    }

    value += (@as(T, input[index] & 0x7F)) << (@intCast(std.math.Log2Int(T), index * 7));

    return DecodedVarint(T){
        .value = value,
        .size = index + 1,
    };
}
