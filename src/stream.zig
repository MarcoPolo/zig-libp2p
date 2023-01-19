const std = @import("std");
const TailQueue = std.TailQueue;
const Allocator = std.mem.Allocator;
const log = std.log;
const assert = std.debug.assert;

const multistream_protocol_id_with_newline = "/multistream/1.0.0\n";
const na_with_newline = "na\n";

pub const BufferedManyBufsReader = struct {
    allocator: Allocator,
    owned_bufs: TailQueue([]u8) = .{},
    borrowed_bufs: [][]const u8 = empty_bufs,
    len: usize = 0,

    const empty_bufs = &[0][]const u8{};

    pub const Error = error{
        /// We don't have enough bytes to fulfill the request
        NotEnoughBytes,
    };

    pub fn init(allocator: Allocator) @This() {
        return .{
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *@This()) void {
        while (self.owned_bufs.pop()) |node| {
            self.allocator.free(node.*.data);
            self.allocator.destroy(node);
        }
    }

    /// Reads slice.len bytes from the stream and returns if they are the same as the passed slice
    pub fn isBytes(self: *@This(), s: []const u8) !bool {
        var slice = s;
        var maybe_node = self.owned_bufs.first;
        while (maybe_node) |node| {
            if (slice.len <= node.data.len) {
                // compare the whole slice against this buf
                return std.mem.eql(u8, node.data[0..slice.len], slice);
            } else {
                // compare the partial slice against this buf
                if (!std.mem.eql(u8, node.data, slice[0..node.data.len])) {
                    return false;
                }
                slice = slice[node.data.len..];
            }

            maybe_node = node.next;
        }

        // start reading from the borrowed bufs
        for (self.borrowed_bufs) |buf| {
            if (slice.len <= buf.len) {
                // compare the whole slice against this buf
                return std.mem.eql(u8, buf[0..slice.len], slice);
            } else {
                // compare the partial slice against this buf
                if (!std.mem.eql(u8, buf, slice[0..buf.len])) {
                    return false;
                }
                slice = slice[buf.len..];
            }
        }

        return Error.NotEnoughBytes;
    }

    /// Reads 1 byte from the stream or returns Error.NotEnoughBytes.
    pub fn readByte(self: *@This()) Error!u8 {
        if (self.owned_bufs.first) |owned_buf| {
            return owned_buf.data[0];
        }

        if (self.borrowed_bufs.len > 0) {
            return self.borrowed_bufs[0][0];
        }

        return Error.NotEnoughBytes;
    }

    /// Consumes this number of bytes
    pub fn consume(self: *@This(), l: usize) void {
        var len = l;
        assert(len <= self.len);
        self.len -= len;

        while (len > 0 and self.owned_bufs.len > 0) {
            var owned_buf = self.owned_bufs.first.?;
            if (len >= owned_buf.data.len) {
                len -= owned_buf.data.len;
                self.allocator.free(owned_buf.data);
                self.allocator.destroy(owned_buf);
                _ = self.owned_bufs.popFirst();

                continue;
            }

            owned_buf.data = owned_buf.data[len..];
            len = 0;
            return;
        }

        while (len > 0 and self.borrowed_bufs.len > 0) {
            var borrowed_buf = &self.borrowed_bufs[0];
            if (len >= borrowed_buf.len) {
                len -= borrowed_buf.len;
                self.borrowed_bufs = self.borrowed_bufs[1..];
                continue;
            }

            borrowed_buf.* = borrowed_buf.*[len..];
            len = 0;
            return;
        }

        assert(len == 0);
    }

    pub fn copyBorrowedBufs(self: *@This()) !void {
        var size: usize = 0;
        for (self.borrowed_bufs) |buf| {
            size += buf.len;
        }
        if (size == 0) {
            return;
        }

        var node = try self.allocator.create(TailQueue([]u8).Node);

        node.*.data = try self.allocator.alloc(u8, size);
        var idx: usize = 0;
        for (self.borrowed_bufs) |buf| {
            std.mem.copy(u8, node.*.data[idx..], buf);
            idx += buf.len;
        }
        self.owned_bufs.append(node);

        self.borrowed_bufs = empty_bufs;
    }

    /// sets borrowed bufs
    pub fn withBorrowedBufs(self: *@This(), borrowed_bufs: [][]const u8) void {
        var size: usize = 0;
        for (borrowed_bufs) |buf| {
            size += buf.len;
        }

        self.len += size;
        self.borrowed_bufs = borrowed_bufs;
    }

    pub fn clearBorrowedBufs(self: *@This()) void {
        var size: usize = 0;
        for (self.borrowed_bufs) |buf| {
            size += buf.len;
        }

        self.len -= size;

        self.borrowed_bufs = empty_bufs;
    }
};

pub const StreamStateMachine = struct {
    state: State,
    supported_protocols: []const []const u8,
    buf: BufferedManyBufsReader,
    is_initiator: bool,

    // A small buf to keep state between reads (just when negotiating)
    pub const State = union(enum) {
        negotiating_multistream: struct {
            sent_ms_id: bool = false,
            got_back_ms_id: bool = false,
            waiting_for_protocol_resp: bool = false,
        },
        using_protocol: []const u8,
    };

    pub const Events = struct {
        sends: [][]u8,

        pub fn format(value: Events, comptime fmt: []const u8, options: std.fmt.FormatOptions, writer: anytype) !void {
            _ = options;
            _ = fmt;
            for (value.sends) |send| {
                try writer.print("{{ Send = {{ to_send.len = {} }} }}", .{send.len});
            }
        }
    };

    pub const StreamError = error{
        FailedToNegotiateMS,
        VarIntTooLarge,
        OOM,
    };

    pub fn init(allocator: Allocator, supported_protocols: []const []const u8, is_initiator: bool) @This() {
        return .{
            .state = State{ .negotiating_multistream = .{
                .waiting_for_protocol_resp = !is_initiator,
            } },
            .is_initiator = is_initiator,
            .supported_protocols = supported_protocols,
            .buf = BufferedManyBufsReader.init(allocator),
        };
    }

    pub fn deinit(self: *@This()) void {
        self.buf.deinit();
    }

    pub fn negotiateMultistream(self: *StreamStateMachine, in_bufs: [][]const u8, send_b: []u8, events_buf: Events) StreamError!Events {
        var sends = events_buf.sends[0..];
        var send_buf = send_b;
        self.buf.withBorrowedBufs(in_bufs);
        defer self.buf.clearBorrowedBufs();

        var state = &self.state.negotiating_multistream;

        if (!state.sent_ms_id) {
            send_buf[0] = multistream_protocol_id_with_newline.len;
            std.mem.copy(u8, send_buf[1..], multistream_protocol_id_with_newline[0..]);

            assert(sends.len > 0);
            sends[0] = send_buf[0 .. multistream_protocol_id_with_newline.len + 1];
            sends = sends[1..];

            send_buf = send_buf[multistream_protocol_id_with_newline.len + 1 ..];
            state.sent_ms_id = true;
        }

        if (!state.got_back_ms_id) {
            if (self.buf.len < multistream_protocol_id_with_newline.len + 1) {
                self.buf.copyBorrowedBufs() catch {
                    return StreamError.OOM;
                };
            } else {
                const proto_len = self.buf.readByte() catch unreachable;
                self.buf.consume(1);
                if (proto_len == (multistream_protocol_id_with_newline.len) and (self.buf.isBytes(multistream_protocol_id_with_newline) catch unreachable)) {
                    self.buf.consume(multistream_protocol_id_with_newline.len);
                    state.got_back_ms_id = true;
                } else {
                    return StreamError.FailedToNegotiateMS;
                }
            }
        }

        if (state.sent_ms_id and !state.waiting_for_protocol_resp and self.is_initiator) {
            if (self.supported_protocols.len == 0) {
                return StreamError.FailedToNegotiateMS;
            }

            const next_proto = self.supported_protocols[0];
            send_buf[0] = @intCast(u8, next_proto.len + 1);
            std.mem.copy(u8, send_buf[1..], next_proto);
            send_buf[next_proto.len + 1] = '\n';

            assert(sends.len > 0);
            sends[0] = send_buf[0..(next_proto.len + 2)];
            sends = sends[1..];

            send_buf = send_buf[next_proto.len + 2 ..];
            state.waiting_for_protocol_resp = true;
        }

        if (state.got_back_ms_id) {
            if (state.waiting_for_protocol_resp and self.buf.len > 0 and self.is_initiator) {
                const proto_len = self.buf.readByte() catch unreachable;
                if (proto_len > 0x7F) {
                    return StreamError.VarIntTooLarge;
                }
                if (self.buf.len < proto_len + 1) {
                    self.buf.copyBorrowedBufs() catch {
                        return StreamError.OOM;
                    };
                } else {
                    self.buf.consume(1);

                    if (self.buf.isBytes("na") catch unreachable) {
                        // Try next protocol
                        self.supported_protocols = self.supported_protocols[1..];
                        state.waiting_for_protocol_resp = false;
                    } else if (self.buf.isBytes(self.supported_protocols[0]) catch unreachable) {
                        self.state = StreamStateMachine.State{ .using_protocol = self.supported_protocols[0] };
                        return Events{
                            .sends = events_buf.sends[0..(events_buf.sends.len - sends.len)],
                        };
                    } else {
                        std.debug.print("here??\n\n", .{});
                        return StreamError.FailedToNegotiateMS;
                    }
                }
            }

            if (state.waiting_for_protocol_resp and self.buf.len > 0 and !self.is_initiator) {
                const proto_len = self.buf.readByte() catch unreachable;
                if (proto_len > 0x7F) {
                    return StreamError.VarIntTooLarge;
                }
                if (self.buf.len < proto_len + 1) {
                    // Wait until we get the full protocol
                    self.buf.copyBorrowedBufs() catch {
                        return StreamError.OOM;
                    };
                } else {
                    self.buf.consume(1);

                    for (self.supported_protocols) |candidate_protocol| {
                        if (candidate_protocol.len + 1 == proto_len and self.buf.isBytes(candidate_protocol) catch unreachable) {
                            // Found match, echo back the protocol
                            send_buf[0] = @intCast(u8, candidate_protocol.len + 1);
                            std.mem.copy(u8, send_buf[1..], candidate_protocol);
                            send_buf[candidate_protocol.len + 1] = '\n';

                            assert(sends.len > 0);
                            sends[0] = send_buf[0 .. candidate_protocol.len + 2];
                            sends = sends[1..];

                            send_buf = send_buf[candidate_protocol.len + 2 ..];

                            self.state = StreamStateMachine.State{ .using_protocol = candidate_protocol };
                            return Events{
                                .sends = events_buf.sends[0..(events_buf.sends.len - sends.len)],
                            };
                        }
                    }
                    self.buf.consume(proto_len);

                    // Send na
                    send_buf[0] = na_with_newline.len;
                    std.mem.copy(u8, send_buf[1..], na_with_newline);

                    assert(sends.len > 0);
                    sends[0] = send_buf[0 .. na_with_newline.len + 1];
                    sends = sends[1..];

                    send_buf = send_buf[na_with_newline.len + 1 ..];
                }
            }
        }

        return Events{
            .sends = events_buf.sends[0..(events_buf.sends.len - sends.len)],
        };
    }

    pub fn processIn(self: *StreamStateMachine, in_bufs: [][]const u8, send_buf: []u8, events_buf: Events) StreamError!Events {
        switch (self.state) {
            .negotiating_multistream => {
                return self.negotiateMultistream(in_bufs, send_buf, events_buf);
            },
            .using_protocol => {
                // Nothing to do, we've negotiated the protocol
                return Events{
                    .sends = events_buf.sends[0..0],
                };
            },
        }
    }
};

test "BufferedManyBufsReader" {
    const testing = std.testing;
    const allocator = testing.allocator;

    var br = BufferedManyBufsReader.init(allocator);
    defer br.deinit();
    var borrowed_bufs = [_][]const u8{
        "hello", "world",
    };
    br.withBorrowedBufs(borrowed_bufs[0..]);

    try testing.expect(try br.isBytes("hel"));
    try testing.expect(try br.isBytes("helloworld"));

    try testing.expectEqual(@as(usize, 10), br.len);
    try testing.expectEqual(@as(u8, 'h'), try br.readByte());

    br.clearBorrowedBufs();
    try testing.expectEqual(@as(usize, 0), br.len);

    br.withBorrowedBufs(borrowed_bufs[0..]);
    br.consume(1);
    try testing.expectEqual(@as(u8, 'e'), try br.readByte());
    try testing.expectEqual(@as(usize, 9), br.len);

    br.consume(6);
    try testing.expectEqual(@as(u8, 'r'), try br.readByte());
    try testing.expectEqual(@as(usize, 3), br.len);

    try br.copyBorrowedBufs();
    try testing.expectEqual(@as(u8, 'r'), try br.readByte());
    try testing.expectEqual(@as(usize, 3), br.len);

    br.consume(1);
    try testing.expectEqual(@as(u8, 'l'), try br.readByte());
    try testing.expectEqual(@as(usize, 2), br.len);

    try testing.expect(try br.isBytes("ld"));

    try testing.expectError(BufferedManyBufsReader.Error.NotEnoughBytes, br.isBytes("ldhello"));

    var borrowed_bufs2 = [_][]const u8{
        "hello", "world",
    };
    br.withBorrowedBufs(borrowed_bufs2[0..]);
    try testing.expect(try br.isBytes("ldhelloworld"));
    try testing.expectEqual(@as(usize, 12), br.len);

    br.clearBorrowedBufs();
    try testing.expect(try br.isBytes("ld"));
    br.clearBorrowedBufs();
    try testing.expect(try br.isBytes("ld"));
    try testing.expectEqual(@as(usize, 2), br.len);
    try testing.expect(!(try br.isBytes("lo")));
}
