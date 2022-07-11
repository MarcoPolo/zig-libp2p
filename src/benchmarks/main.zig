const benchmark = @import("benchmark").benchmark;
const std = @import("std");
const io = std.io;

test "benchmark" {
    try benchmark(struct {
        // The functions will be benchmarked with the following inputs.
        // If not present, then it is assumed that the functions
        // take no input.
        pub const args = [_][]const u8{
            &([_]u8{ 1, 10, 100 } ** 16),
            &([_]u8{ 1, 10, 100 } ** 32),
            &([_]u8{ 1, 10, 100 } ** 64),
            &([_]u8{ 1, 10, 100 } ** 128),
            &([_]u8{ 1, 10, 100 } ** 256),
        };

        // You can specify `arg_names` to give the inputs more meaningful
        // names. If the index of the input exceeds the available string
        // names, the index is used as a backup.
        pub const arg_names = [_][]const u8{
            "block=16",
            "block=32",
            "block=64",
            "block=128",
            "block=512",
        };

        // How many iterations to run each benchmark.
        // If not present then a default will be used.
        pub const min_iterations = 1000;
        pub const max_iterations = 100000;

        pub fn sum_slice(slice: []const u8) u64 {
            var res: u64 = 0;
            for (slice) |item|
                res += item;

            return res;
        }

        pub fn sum_reader(slice: []const u8) u64 {
            var reader = &io.fixedBufferStream(slice).reader();
            var res: u64 = 0;
            while (reader.readByte()) |c| {
                res += c;
            } else |_| {}

            return res;
        }
    });
}
