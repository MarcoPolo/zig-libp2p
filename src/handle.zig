const std = @import("std");
const Allocator = std.mem.Allocator;
// pub const Handle = packed struct {
//     // Where in our backing array is this thing?
//     index: u24,
//     // Pattern to check for old handles and free slots. 0 = free or destroyed.
//     pattern: u8,
// };

pub fn TypedHandle(comptime T: type) type {
    _ = T;
    return packed struct {
        // Where in our backing array is this thing?
        index: u24,
        // Pattern to check for old handles and free slots. 0 = free or destroyed.
        pattern: u8,
    };
}

pub fn HandleAllocator(comptime T: type) type {
    return struct {
        const Self = @This();
        pub const Handle = TypedHandle(T);
        pub const SlotNode = struct {
            handle: Handle,
            data: T,
        };

        active_handles: std.ArrayList(SlotNode),
        free_slots: std.ArrayList(Handle),

        pub fn init(allocator: Allocator) Self {
            return .{
                .active_handles = std.ArrayList(SlotNode).init(allocator),
                .free_slots = std.ArrayList(Handle).init(allocator),
            };
        }
        pub fn deinit(self: Self) void {
            self.active_handles.deinit();
            self.free_slots.deinit();
        }

        pub fn allocSlot(self: *Self) !Handle {
            if (self.free_slots.popOrNull()) |free_slot| {
                var slot = self.active_handles.items[free_slot.index];
                slot.handle = free_slot;
            }

            const handle = Handle{
                .index = @intCast(u24, self.active_handles.items.len),
                .pattern = 1,
            };
            var slot = SlotNode{
                .handle = handle,
                .data = undefined,
            };
            try self.active_handles.append(slot);

            return handle;
        }

        pub fn freeSlot(self: *Self, handle: Handle) !void {
            if (self.active_handles.items[handle.index].handle.pattern != handle.pattern) {
                return error.StaleHandle;
            }
            const next_handle = Handle{
                .index = handle.index,
                .pattern = handle.pattern + 1,
            };
            self.free_slots.append(next_handle) catch {
                @panic("Failed to append to free slots");
            };
            self.active_handles.items[handle.index].handle.pattern = 0;
        }

        // Returns a temporary popinter to the underlying listener. The caller
        // should forget this pointer as soon as possible, since it may be
        // invalidated by the handle allocator at any time.
        pub inline fn getPtr(self: *const Self, handle: Handle) !*T {
            const pattern = handle.pattern;
            var slot = &self.active_handles.items[handle.index];
            if (slot.handle.pattern != pattern) {
                return error.StaleHandle;
            }
            return &slot.data;
        }
    };
}

test "Handle system" {
    const Thing = struct { counter: u32 };
    const allocator = std.testing.allocator;

    var thingSystem = HandleAllocator(Thing).init(allocator);
    defer thingSystem.deinit();

    const handle = try thingSystem.allocSlot();

    {
        const handle_ptr = try thingSystem.getPtr(handle);
        handle_ptr.* = .{ .counter = 0 };
    }

    {
        const handle_ptr = try thingSystem.getPtr(handle);
        handle_ptr.*.counter += 1;
    }

    try std.testing.expectEqual(@intCast(u32, 1), (try thingSystem.getPtr(handle)).counter);

    // Now forget the the handle
    try thingSystem.freeSlot(handle);

    // Now try to use it again
    try std.testing.expectError(error.StaleHandle, thingSystem.getPtr(handle));
    try std.testing.expectError(error.StaleHandle, thingSystem.freeSlot(handle));
}
