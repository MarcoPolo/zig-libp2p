const std = @import("std");
const builtin = @import("builtin");
const Mutex = std.Thread.Mutex;
const SinglyLinkedList = std.SinglyLinkedList;

// An implementation of channels similar to Go's:
// https://docs.google.com/document/d/1yIAYmbvL3JxOKOjuCyon7JhW4cSv1wy5hC0ApeGMV9s/pub

fn Receiver(comptime T: type) type {
    return struct {
        val: T,
        completed: bool = false,
        frame: anyframe,
    };
}

fn Sender(comptime T: type) type {
    return struct {
        val: T,
        completed: bool = false,
        frame: anyframe,
    };
}

pub fn SyncChannel(comptime T: type) type {
    return struct {
        mutex: Mutex = .{},
        closed: bool = false,

        // Pending senders/receivers
        sendq: SinglyLinkedList(Sender(T)) = .{},
        recvq: SinglyLinkedList(Receiver(T)) = .{},

        pub fn try_send(self: *@This(), val: T) bool {
            return self.send_impl(val, false);
        }

        pub fn send(self: *@This(), val: T) void {
            _ = self.send_impl(val, true);
        }

        fn send_impl(self: *@This(), val: T, block: bool) bool {
            if (self.closed) {
                // Fast path
                @panic("send on closed");
            }

            if (!block and self.recvq.first == null) {
                // Fast path
                return false;
            }

            self.mutex.lock();

            if (self.closed) {
                // check again
                self.mutex.unlock();
                @panic("send on closed");
            }

            if (self.recvq.popFirst()) |receiver| {
                // Have a blocked receiver, communicate with it.
                self.mutex.unlock();
                receiver.data.val = val;
                receiver.data.completed = true;
                resume receiver.data.frame;
                return true;
            }

            if (!block) {
                self.mutex.unlock();
                return false;
            }

            var node = SinglyLinkedList(Sender(T)).Node{
                .data = Sender(T){
                    .frame = undefined,
                    .val = val,
                },
            };

            // Block and wait for a pair.
            suspend {
                node.data.frame = @frame();
                self.sendq.prepend(&node);
                self.mutex.unlock();
            }

            if (!node.data.completed) {
                @panic("send on closed");
            }

            // Unblocked by a recv.
            return true;
        }

        pub fn try_recv(self: *@This()) ?T {
            return self.recv_impl(false);
        }
        pub fn recv(self: *@This()) T {
            return self.recv_impl(true).?;
        }

        fn recv_impl(self: *@This(), block: bool) ?T {
            if (self.closed) {
                // Fast path
                @panic("recv on closed");
            }

            if (!block and self.sendq.first == null) {
                // Fast path
                return null;
            }

            self.mutex.lock();

            if (self.closed) {
                // check again
                self.mutex.unlock();
                @panic("recv on closed");
            }

            if (self.sendq.popFirst()) |sender| {
                // Have a blocked sender, communicate with it.
                self.mutex.unlock();

                sender.data.completed = true;
                const val = sender.data.val;
                resume sender.data.frame;
                return val;
            }

            if (!block) {
                self.mutex.unlock();
                return null;
            }

            var node = SinglyLinkedList(Receiver(T)).Node{
                .data = Receiver(T){
                    .frame = undefined,
                    .val = undefined,
                },
            };

            // Block and wait for a pair.
            suspend {
                node.data.frame = @frame();
                self.recvq.prepend(&node);
                self.mutex.unlock();
            }

            if (!node.data.completed) {
                @panic("recv on closed");
            }

            // Unblocked by a send.
            return node.data.val;
        }
    };
}

pub fn AsyncChannel(comptime T: type, cap: usize) type {
    const PosAndLap = packed struct { pos: u32 = 0, lap: u32 = 0 };

    const Elem = struct {
        lap: u32 = 0,
        val: T = undefined,
    };

    if (@sizeOf(T) == 0) {
        return AsyncChannelZeroSized(cap);
    }

    return struct {
        cap: u32 = cap,
        buf: [cap]Elem = [_]Elem{.{}} ** cap,
        sendx: PosAndLap align(8) = .{},
        recvx: PosAndLap align(8) = .{ .lap = 1 },

        mutex: Mutex = .{},
        closed: bool = false,

        // Pending senders/receivers
        sendq: SinglyLinkedList(anyframe) = .{},
        recvq: SinglyLinkedList(anyframe) = .{},

        /// sends a value on the chan. Does not block.
        pub fn try_send(self: *@This(), val: T) bool {
            var x = @atomicLoad(u64, @ptrCast(*const u64, &self.sendx), .SeqCst);
            while (true) {
                var pos_and_lap = @bitCast(PosAndLap, x);
                const e = &self.buf[pos_and_lap.pos];
                const e_lap = @atomicLoad(u32, &e.lap, .SeqCst);

                if (pos_and_lap.lap == e_lap) {
                    // The element is ready for writing on this lap.
                    // Try to claim the right to write to this element.
                    if (pos_and_lap.pos + 1 < self.cap) {
                        pos_and_lap.pos += 1;
                    } else {
                        pos_and_lap.pos = 0;
                        pos_and_lap.lap += 2;
                    }
                    if (@cmpxchgWeak(u64, @ptrCast(*u64, &self.sendx), x, @bitCast(u64, pos_and_lap), .SeqCst, .SeqCst)) |current_x| {
                        x = current_x;
                        // We lost the race, retry
                        continue;
                    }

                    // We own the element, do non-atomic write.
                    e.val = val;
                    // Make the element available for reading.
                    @atomicStore(u32, &e.lap, e_lap + 1, .SeqCst);
                    return true;
                } else if (pos_and_lap.lap - e_lap > 0) {
                    // The element is not yet read on the previous lap,
                    // the chan is full.
                    return false;
                }

                // The element has already been written on this lap,
                // this means that c->sendx has been changed as well,
                // retry.
                x = @atomicLoad(u64, @ptrCast(*const u64, &self.sendx), .SeqCst);
            }
        }

        pub fn try_recv(self: *@This()) ?T {
            var x = @atomicLoad(u64, @ptrCast(*const u64, &self.recvx), .SeqCst);
            while (true) {
                var pos_and_lap = @bitCast(PosAndLap, x);
                const e = &self.buf[pos_and_lap.pos];
                const e_lap = @atomicLoad(u32, &e.lap, .SeqCst);

                if (pos_and_lap.lap == e_lap) {
                    // The element is ready for reading on this lap.
                    // Try to claim the right to read to this element.
                    if (pos_and_lap.pos + 1 < self.cap) {
                        pos_and_lap.pos += 1;
                    } else {
                        pos_and_lap.pos = 0;
                        pos_and_lap.lap += 2;
                    }
                    if (@cmpxchgWeak(u64, @ptrCast(*u64, &self.recvx), x, @bitCast(u64, pos_and_lap), .SeqCst, .SeqCst)) |current_x| {
                        x = current_x;
                        // We lost the race, retry
                        continue;
                    }

                    // We own the element, do non-atomic read.
                    const val = e.val;
                    // Make the element available for reading.
                    @atomicStore(u32, &e.lap, e_lap + 1, .SeqCst);
                    return val;
                } else if (pos_and_lap.lap - e_lap > 0) {
                    // The element is not yet written,
                    // the chan is empty.
                    return null;
                }

                // The element has already been written on this lap,
                // this means that c->recvx has been changed as well,
                // retry.
                x = @atomicLoad(u64, @ptrCast(*const u64, &self.recvx), .SeqCst);
            }
        }

        // Will suspend if cannot send immediately
        pub fn send(self: *@This(), val: T) void {
            while (true) {
                if (self.try_send(val)) {
                    // Send succeeded, see if we need to unblock a receiver.
                    if (self.recvq.first != null) {
                        self.mutex.lock();
                        if (self.recvq.popFirst()) |receiver_frame| {
                            self.mutex.unlock();
                            resume receiver_frame.data;
                            return;
                        }
                        self.mutex.unlock();
                    }
                    return;
                } else {
                    // full channel
                    self.mutex.lock();
                    var node = SinglyLinkedList(anyframe).Node{ .data = @frame() };
                    self.sendq.prepend(&node);
                    if (!self.full()) {
                        _ = self.sendq.popFirst();
                        self.mutex.unlock();
                        continue;
                    }
                    self.mutex.unlock();
                    suspend {}
                }
            }
        }

        // Will suspend if cannot recv immediately
        pub fn recv(self: *@This()) T {
            while (true) {
                if (self.try_recv()) |val| {
                    // Recv succeeded, see if we need to unblock a sender.
                    if (self.sendq.first != null) {
                        self.mutex.lock();
                        if (self.sendq.popFirst()) |sender_frame| {
                            self.mutex.unlock();
                            resume sender_frame.data;
                            return val;
                        }
                        self.mutex.unlock();
                    }
                    return val;
                } else {
                    // empty channel
                    self.mutex.lock();
                    var node = SinglyLinkedList(anyframe).Node{ .data = @frame() };
                    self.recvq.prepend(&node);
                    if (!self.empty()) {
                        _ = self.recvq.popFirst();
                        self.mutex.unlock();
                        continue;
                    }
                    self.mutex.unlock();
                    suspend {}
                }
            }
        }

        pub fn full(self: *@This()) bool {
            var x = @atomicLoad(u64, @ptrCast(*const u64, &self.sendx), .SeqCst);
            var pos_and_lap = @bitCast(PosAndLap, x);
            const e = &self.buf[pos_and_lap.pos];
            const e_lap = @atomicLoad(u32, &e.lap, .SeqCst);
            return (pos_and_lap.lap - e_lap > 0);
        }

        pub fn empty(self: *@This()) bool {
            var x = @atomicLoad(u64, @ptrCast(*const u64, &self.recvx), .SeqCst);
            var pos_and_lap = @bitCast(PosAndLap, x);
            const e = &self.buf[pos_and_lap.pos];
            const e_lap = @atomicLoad(u32, &e.lap, .SeqCst);
            return (pos_and_lap.lap - e_lap > 0);
        }
    };
}

pub fn AsyncChannelZeroSized(cap: usize) type {
    return struct {
        cap: u32 = cap,
        count: u32 = 0,

        mutex: Mutex = .{},
        closed: bool = false,

        // Pending senders/receivers
        sendq: SinglyLinkedList(anyframe) = .{},
        recvq: SinglyLinkedList(anyframe) = .{},

        /// sends a value on the chan. Does not block.
        pub fn try_send(self: *@This(), _: void) bool {
            var count = @atomicLoad(u32, &self.count, .SeqCst);
            while (true) {
                if (count < cap) {
                    if (@cmpxchgWeak(u32, &self.count, count, count + 1, .SeqCst, .SeqCst)) |current_count| {
                        count = current_count;
                        // We lost the race, retry
                        continue;
                    }

                    return true;
                }
                // the chan is full.
                return false;
            }
        }

        pub fn try_recv(self: *@This()) ?void {
            var count = @atomicLoad(u32, &self.count, .SeqCst);
            while (true) {
                if (count != 0) {
                    if (@cmpxchgWeak(u32, &self.count, count, count - 1, .SeqCst, .SeqCst)) |current_count| {
                        count = current_count;
                        // We lost the race, retry
                        continue;
                    }

                    const t: void = .{};
                    return t;
                }
                // The element is not yet read on the previous lap,
                // the chan is empty.
                return null;
            }
        }

        // Will suspend if cannot send immediately
        pub fn send(self: *@This(), val: void) void {
            while (true) {
                if (self.try_send(val)) {
                    // Send succeeded, see if we need to unblock a receiver.
                    if (self.recvq.first != null) {
                        self.mutex.lock();
                        if (self.recvq.popFirst()) |receiver_frame| {
                            self.mutex.unlock();
                            resume receiver_frame.data;
                            return;
                        }
                        self.mutex.unlock();
                    }
                    return;
                } else {
                    // full channel
                    self.mutex.lock();
                    var node = SinglyLinkedList(anyframe).Node{ .data = @frame() };
                    self.sendq.prepend(&node);
                    if (!self.full()) {
                        _ = self.sendq.popFirst();
                        self.mutex.unlock();
                        continue;
                    }
                    self.mutex.unlock();
                    suspend {}
                }
            }
        }

        // Will suspend if cannot recv immediately
        pub fn recv(self: *@This()) void {
            while (true) {
                if (self.try_recv()) |val| {
                    // Recv succeeded, see if we need to unblock a sender.
                    if (self.sendq.first != null) {
                        self.mutex.lock();
                        if (self.sendq.popFirst()) |sender_frame| {
                            self.mutex.unlock();
                            resume sender_frame.data;
                            return val;
                        }
                        self.mutex.unlock();
                    }
                    return val;
                } else {
                    // empty channel
                    self.mutex.lock();
                    var node = SinglyLinkedList(anyframe).Node{ .data = @frame() };
                    self.recvq.prepend(&node);
                    if (!self.empty()) {
                        _ = self.recvq.popFirst();
                        self.mutex.unlock();
                        continue;
                    }
                    self.mutex.unlock();
                    suspend {}
                }
            }
        }

        pub fn full(self: *@This()) bool {
            var count = @atomicLoad(u32, &self.count, .SeqCst);
            return count == self.cap;
        }

        pub fn empty(self: *@This()) bool {
            var count = @atomicLoad(u32, &self.count, .SeqCst);
            return count == 0;
        }
    };
}

test "Sync channel" {
    const testing = std.testing;
    const expect = testing.expect;

    nosuspend {
        var c = SyncChannel(u8){};

        // No blocking, no problems
        try expect(!c.try_send(1));
        try expect(c.try_recv() == null);

        // Send first
        var send_frame = async c.send(1);
        var val = c.recv();
        try expect(val == 1);
        await send_frame;

        // Recv first
        var recv_frame = async c.recv();
        c.send(2);
        try expect((await recv_frame) == 2);
    }
}

test "Async channel" {
    const testing = std.testing;
    const expect = testing.expect;

    {
        var c = AsyncChannel(u8, 4){};

        try expect(c.try_send(1));
        try expect(c.buf[0].val == 1);

        try expect(c.try_send(2));
        try expect(c.buf[1].val == 2);

        try expect(c.try_send(3));
        try expect(c.buf[2].val == 3);

        try expect(c.try_send(4));
        try expect(c.buf[3].val == 4);

        try expect(!c.try_send(5));
    }

    // send + recv
    {
        var c = AsyncChannel(u8, 4){};

        try expect(c.try_send(1));
        try testing.expectEqual(@as(u8, 1), c.try_recv().?);

        try expect(c.try_recv() == null);
    }

    // async send + recv. Blocking send
    nosuspend {
        var c = AsyncChannel(u8, 1){};

        c.send(42);
        var send_frame = async c.send(43);

        try expect(c.recv() == 42);
        await send_frame;
        try expect(c.recv() == 43);
    }

    // async send + recv. Blocking recv
    nosuspend {
        var c = AsyncChannel(u8, 1){};

        var recv_frame = async c.recv();
        c.send(42);

        const val = await recv_frame;
        try testing.expectEqual(@as(u8, 42), val);
    }

    nosuspend {
        var c = AsyncChannel(void, 1){};

        // constant size
        try testing.expectEqual(@sizeOf(AsyncChannel(void, 100)), @sizeOf(AsyncChannel(void, 1000)));

        var recv_frame = async c.recv();
        c.send(.{});

        _ = await recv_frame;
    }
}
