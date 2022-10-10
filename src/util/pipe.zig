const std = @import("std");
const SyncChannel = @import("./channel.zig").SyncChannel;
const AsyncChannel = @import("./channel.zig").AsyncChannel;

fn Pipe(comptime Context: type) type {
    return struct {
        pub const Queue = std.atomic.Queue(Context);
        pub const Node = Queue.Node;

        const Self = @This();

        queue: Queue = Queue.init(),

        const Publisher = struct {
            pipe: *Self,
            pub fn publish(self: @This(), node: *Node) void {
                self.pipe.queue.put(node);
            }
        };

        const Consumer = struct {
            pipe: *Self,

            pub fn consume(self: @This()) ?*Node {
                return self.pipe.queue.get();
            }
        };

        fn init() Self {
            return Self{};
        }

        fn publisher(self: *@This()) Publisher {
            return Publisher{ .pipe = self };
        }

        fn consumer(self: *@This()) Consumer {
            return Consumer{ .pipe = self };
        }
    };
}

fn NoAllocBufferedPipe(comptime Context: type) type {
    return struct {
        // Pre allocated nodes to use for our pipe buffer.
        node_pool: Queue = Queue.init(),
        // Our buffered pipe
        buffered_pipe: Queue = Queue.init(),

        pub const Queue = std.atomic.Queue(Context);
        pub const Node = Queue.Node;

        const Self = @This();

        const Publisher = struct {
            pipe: *Self,
            pub fn publish(self: @This(), context: Context) !void {
                var node = self.pipe.node_pool.get() orelse {
                    return error.EmptyBuffer;
                };
                node.*.data = context;
                self.pipe.buffered_pipe.put(node);
            }
        };

        const Consumer = struct {
            pipe: *Self,

            const LeasedContext = struct {
                context: *Context,

                pub inline fn getNode(self: @This()) *Node {
                    return @fieldParentPtr(Node, "data", self.context);
                }
            };

            pub fn consumeWithLease(self: @This()) ?LeasedContext {
                const node = self.pipe.buffered_pipe.get() orelse {
                    return null;
                };
                return LeasedContext{ .context = &node.*.data };
            }

            pub fn returnLease(self: @This(), leased_node: LeasedContext) void {
                return self.pipe.node_pool.put(leased_node.getNode());
            }
        };

        // Convenience. Inits this pipe with the allocator with capacity number of nodes.
        fn initWithCapacity(allocator: std.mem.Allocator, capacity: usize) !Self {
            var self = Self{};
            var i = capacity;
            while (i > 0) : (i -= 1) {
                self.node_pool.put(try allocator.create(Node));
            }
            return self;
        }

        // // Destroy the node pool memory. Caller
        // fn freeNodePool(allocator: std.mem.Allocator) void {
        //     while (self.node_pool.get()) |node| {
        //         allocator.destroy(node);
        //     }
        // }

        /// returns the pipe with no preallocated nodes in the buffer. Callers
        /// should push allocated nodes to the pool manually.
        ///
        /// No deinit is provided. Users should clean up the node_pool and
        /// buffered_pipe manually. One simple strategy is to free nodes in the
        /// node pool, and finish up things left in the buffered_pipe.
        fn init() Self {
            return Self{};
        }

        // Push a node to our pool. Used if you init this with no capacity and
        // need to add nodes to poll for this to work.
        fn pushNodeToPool(self: @This(), node: *Node) void {
            self.node_pool.put(node);
        }

        fn publisher(self: *@This()) Publisher {
            return Publisher{ .pipe = self };
        }

        fn consumer(self: *@This()) Consumer {
            return Consumer{ .pipe = self };
        }
    };
}

fn NoAllocBufferedPipeNotAtomic(comptime Context: type) type {
    return struct {
        // Pre allocated nodes to use for our pipe buffer.
        node_pool: Queue = Queue{},
        // Our buffered pipe
        buffered_pipe: Queue = Queue{},

        pub const Queue = std.TailQueue(Context);
        pub const Node = Queue.Node;

        const Self = @This();

        const Publisher = struct {
            pipe: *Self,
            pub fn publish(self: @This(), context: Context) !void {
                var node = self.pipe.node_pool.pop() orelse {
                    return error.EmptyBuffer;
                };
                node.*.data = context;
                self.pipe.buffered_pipe.prepend(node);
            }
        };

        const Consumer = struct {
            pipe: *Self,

            const LeasedContext = struct {
                context: *Context,

                pub inline fn getNode(self: @This()) *Node {
                    return @fieldParentPtr(Node, "data", self.context);
                }
            };

            pub fn consumeWithLease(self: @This()) ?LeasedContext {
                const node = self.pipe.buffered_pipe.pop() orelse {
                    return null;
                };
                return LeasedContext{ .context = &node.*.data };
            }

            pub fn returnLease(self: @This(), leased_node: LeasedContext) void {
                return self.pipe.node_pool.prepend(leased_node.getNode());
            }
        };

        // Convenience. Inits this pipe with the allocator with capacity number of nodes.
        fn initWithCapacity(allocator: std.mem.Allocator, capacity: usize) !Self {
            var self = Self{};
            var i = capacity;
            while (i > 0) : (i -= 1) {
                self.node_pool.prepend(try allocator.create(Node));
            }
            return self;
        }

        // // Destroy the node pool memory. Caller
        // fn freeNodePool(allocator: std.mem.Allocator) void {
        //     while (self.node_pool.get()) |node| {
        //         allocator.destroy(node);
        //     }
        // }

        /// returns the pipe with no preallocated nodes in the buffer. Callers
        /// should push allocated nodes to the pool manually.
        ///
        /// No deinit is provided. Users should clean up the node_pool and
        /// buffered_pipe manually. One simple strategy is to free nodes in the
        /// node pool, and finish up things left in the buffered_pipe.
        fn init() Self {
            return Self{};
        }

        // Push a node to our pool. Used if you init this with no capacity and
        // need to add nodes to poll for this to work.
        fn pushNodeToPool(self: @This(), node: *Node) void {
            self.node_pool.prepend(node);
        }

        fn publisher(self: *@This()) Publisher {
            return Publisher{ .pipe = self };
        }

        fn consumer(self: *@This()) Consumer {
            return Consumer{ .pipe = self };
        }
    };
}

test "noallocbufferedpipe" {
    var allocator = std.testing.allocator;

    var pipe = try NoAllocBufferedPipe(u8).initWithCapacity(allocator, 3);
    defer {
        while (pipe.node_pool.get()) |node| {
            allocator.destroy(node);
        }
    }

    // Create a publisher
    const publisher = pipe.publisher();

    inline for (.{ 0, 1, 2 }) |n| {
        try publisher.publish(n);
    }

    // Fails because we reached our buffer limit
    try std.testing.expectError(error.EmptyBuffer, publisher.publish(3));

    const consumer = pipe.consumer();

    inline for (.{ 0, 1, 2 }) |n| {
        var leased_node = consumer.consumeWithLease().?;
        defer consumer.returnLease(leased_node);
        try std.testing.expect(n == leased_node.context.*);
    }

    try std.testing.expect(pipe.buffered_pipe.get() == null);
}

test "simple pipe" {
    var allocator = std.testing.allocator;

    var pipe = Pipe(u8){};

    inline for (.{ 0, 1, 2 }) |n| {
        var node = try allocator.create(Pipe(u8).Node);
        node.*.data = n;
        pipe.publisher().publish(node);
    }

    inline for (.{ 0, 1, 2 }) |n| {
        var node = pipe.consumer().consume();
        try std.testing.expect(n == node.?.data);
        allocator.destroy(node.?);
    }
}

// Attempt to use gotta go fast. Doesn't work on macOS.
// test "benchmark pipe 2" {
//     const benchmark = @import("gotta-go-fast");

//     const bench_to_run = struct {
//         pub fn f(a: u8) !void {
//             _ = a + 1;
//         }
//     };

//     _ = benchmark.bench(.{
//         .zig_exe = "/nix/store/w3sijlahbl6rr4239bzgm2v5gq3ll077-zig-0.10.0-dev.2842+d65e248ed/bin/zig",
//         .zig_src_root = "/nix/store/w3sijlahbl6rr4239bzgm2v5gq3ll077-zig-0.10.0-dev.2842+d65e248ed/lib/zig/",
//     }, bench_to_run.f, .{3});
// }

test "benchmark pipe" {
    if (std.os.getenv("RUN_BENCHMARK") == null) {
        return error.SkipZigTest;
    }
    const benchmark = @import("benchmark").benchmark;
    try benchmark(struct {
        pub const args = [_][]const u8{
            &([_]u8{ 1, 2, 3 } ** 32),
            &([_]u8{ 1, 2, 3 } ** 64),
            &([_]u8{ 1, 2, 3 } ** 128),
            &([_]u8{ 1, 2, 3 } ** 256),
        };

        // crashes
        // pub fn publishAndConsumeChannel(items: []const u8) !void {
        //     const Channel = std.event.Channel(u8);
        //     var channel: Channel = undefined;
        //     var buf = ([_]u8{0} ** (1 << 3));

        //     channel.init(&buf);
        //     for (items) |item| {
        //         channel.put(item);

        //         _ = await async channel.get();
        //     }
        // }

        pub fn publishAndConsumeSyncChannel(items: []const u8) !void {
            var c = SyncChannel(u8){};
            for (items) |item| {
                nosuspend {
                    var send_frame = async c.send(item, true);
                    _ = async c.send(item, true);
                    _ = c.recv(true);
                    _ = await send_frame;
                }
            }
        }

        pub fn publishAndConsumeAsyncChannel(items: []const u8) !void {
            var c = AsyncChannel(u8, 2){};
            for (items) |item| {
                _ = c.try_send(item);
                _ = c.try_recv().?;
            }
        }

        pub fn publishAndConsume(items: []const u8) !void {
            var allocator = std.testing.allocator;

            var pipe = try NoAllocBufferedPipe(u8).initWithCapacity(allocator, 3);
            defer {
                while (pipe.node_pool.get()) |node| {
                    allocator.destroy(node);
                }
            }

            var publisher = pipe.publisher();
            var consumer = pipe.consumer();
            for (items) |item| {
                try publisher.publish(item);
                var leasedItem = consumer.consumeWithLease();
                consumer.returnLease(leasedItem.?);
            }
        }

        pub fn publishAndConsumeNotAtomic(items: []const u8) !void {
            var allocator = std.testing.allocator;

            var pipe = try NoAllocBufferedPipeNotAtomic(u8).initWithCapacity(allocator, 3);
            defer {
                while (pipe.node_pool.pop()) |node| {
                    allocator.destroy(node);
                }
            }

            var publisher = pipe.publisher();
            var consumer = pipe.consumer();
            var mu = std.Thread.Mutex{};
            for (items) |item| {
                {
                    mu.lock();
                    defer mu.unlock();
                    try publisher.publish(item);
                }
                {
                    mu.lock();
                    var leasedItem = consumer.consumeWithLease();
                    mu.unlock();

                    mu.lock();
                    consumer.returnLease(leasedItem.?);
                    mu.unlock();
                }
            }
        }
    });
}
