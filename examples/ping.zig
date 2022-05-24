const std = @import("std");
const uri = @import("uri");

pub const io_mode = .evented;

pub fn main() !void {
    // A demo of how writing protocols looks like in Zig.
    std.debug.print("Hello, world!\n", .{});
    // handle_message(.{ .ping = .{} });
}

const SwarmMessage = union(enum) {
    NewStreamFromRemote: struct {},
    NewConnection: struct {},
};

const Peer = struct {};
const PingMessage = struct {
    id: u64,
    /// Serializes and writes the message to the writer.
    fn write_to(self: PingMessage, writer: std.io.Writer) anyerror!void {
        _ = self;
        _ = writer;
    }
    /// Deserializes from the reader
    fn read_from(self: PingMessage, reader: std.io.Reader) anyerror!void {
        _ = self;
        _ = reader;
    }

    fn response_matches(self: PingMessage, msg: ProtocolMessage) bool {
        return msg == .peer_message and msg.peer_message.id == self.id;
    }
};

const ProtocolMessage = union(enum) {
    start_ping: struct {
        to: Peer,
    },
    peer_message: struct {
        from: Peer,
        msg: union(enum) {
            ping: PingMessage,
        },
    },
    swarm: SwarmMessage,
};

const Swarm = struct {
    fn send_message_to(self: Swarm, peer: Peer, msg: anytype, response_checker: fn (msg: ProtocolMessage, writer: std.io.Writer) bool) anyerror!void {
        _ = self;
        _ = peer;
        _ = msg;
        _ = response_checker;
    }
    fn send_message_to_2(
        self: Swarm,
        peer: Peer,
        msg: anytype,
        serializer: fn (msg: @TypeOf(msg), writer: std.io.Writer) anyerror!void,
        deserializer: fn (msg: @TypeOf(msg), reader: std.io.Reader) anyerror!void,
        response_checker: fn (msg: anytype) bool,
    ) anyerror!void {
        _ = self;
        _ = peer;
        _ = msg;
        _ = serializer;
        _ = deserializer;
        _ = response_checker;
    }
};

fn Stream(comptime T: type) type {
    return struct {
        fn recv(self: @This()) anyerror!T {
            _ = self;
        }
        fn send(self: @This(), msg: T) anyerror!void {
            _ = self;
            _ = msg;
        }
        /// Sends the msg, and waits for a response that passes the matches fn.
        fn send_and_recv_match(self: @This(), msg: T, matches: fn (msg: T) bool) anyerror!void {
            _ = self;
            _ = msg;
            _ = matches;
        }
    };
}

const PingProtocol = struct {
    streams: std.AutoHashMap(Peer, Stream(ProtocolMessage)),

    fn init() PingProtocol {
        return PingProtocol{
            .streams = std.AutoHashMap(Peer, Stream(ProtocolMessage)).init(),
        };
    }

    fn deinit(self: PingProtocol) void {
        self.streams.deinit();
    }
    // std.AutoHashMap(K, V).init(allocator);
    // streams: map from peer id to array of streams?,
    // streams: map from peer id to array of streams?,
    fn ping_remote(self: PingProtocol, swarm: Swarm, peer: Peer) anyerror!PingMessage {
        _ = self;
        _ = swarm;
        _ = peer;
        const stream = self.streams.get(peer) orelse return error.NoStreamFound;
        _ = stream;
        // stream.send()
        // stream.recv

        return await async swarm.send_message_to();
    }
    fn handle_message(self: PingProtocol, swarm: Swarm, message: ProtocolMessage) anyerror!void {
        switch (message) {
            .start_ping => {
                // 1. Start our timer
                const now = std.time.nanoTimestamp();
                // 2. Ping the remote peer
                const response = await async self.ping_remote(swarm, message.start_ping.to);
                _ = response;

                const duration_ns = std.time.nanoTimestamp() - now;
                std.debug.print("Ping response took: {}", .{std.fmt.fmtDuration(duration_ns)});
            },
            .peer_message => |peer_message| {
                switch (peer_message.msg) {
                    .ping => |ping_message| {
                        // Reply to ping
                        _ = ping_message;
                    },
                }
            },
            .swarm => {},
        }
    }

    // Takes a stream that sends and receives bytes, and turns it into a stream that sends and receives protocol specific messages
    fn stream_adapter() void {}
};
