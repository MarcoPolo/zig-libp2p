const std = @import("std");
const Allocator = std.mem.Allocator;
const MsQuicTransport = @import("./transport/msquic.zig").MsQuicTransport;
const crypto = @import("./crypto.zig");
const protobuf = @import("./util/protobuf.zig");
const HandleAllocator = @import("./handle.zig").HandleAllocator;

const multistream_protocol_id = "/multistream/1.0.0";

fn delimWrite(dest: anytype, to_write: []const u8) !void {
    try protobuf.append_raw_varint_to_writer(dest, @intCast(u64, to_write.len + 1)); // +1 for the newline
    try dest.writeAll(to_write);
    try dest.writeByte('\n');
}

fn smallDelimRead(reader: anytype, buf: []u8) !usize {
    const msg_len = try reader.readByte();
    if (msg_len > 0x7F) {
        return error.VarIntTooLarge;
    }
    try reader.readNoEof(buf[0..msg_len]);

    if (buf[msg_len - 1] != '\n') {
        return error.MissingNewline;
    }
    return msg_len - 1;
}

pub const MultistreamSelect = struct {
    transport: *MsQuicTransport,
    active_conns: std.ArrayList(MsQuicTransport.ConnectionSystem.Handle),

    pub const Listener = struct {
        const Handle = MsQuicTransport.ListenerSystem.Handle;
        h: Handle,

        fn init(allocator: Allocator, transport: *MsQuicTransport, addr: std.net.Address) !Listener {
            const listener = try transport.listen(allocator, addr);
            return Listener{ .h = listener };
        }

        fn deinit(self: @This(), transport: *MsQuicTransport) void {
            defer MsQuicTransport.Listener.deinitHandle(self.h, transport);
        }
        fn accept(self: *Listener) !MsQuicTransport.StreamSystem.Handle {
            _ = self;
            return error.ImplementMe;
        }
    };

    fn init(transport: *MsQuicTransport, allocator: Allocator) !MultistreamSelect {
        return MultistreamSelect{
            .transport = transport,
            .active_conns = std.ArrayList(MsQuicTransport.ConnectionSystem.Handle).init(allocator),
        };
    }

    fn deinit(self: MultistreamSelect) void {
        self.active_conns.deinit();
    }

    fn acceptIncomingConns(self: MultistreamSelect) !void {
        const listener_ptr = try self.transport.listener_system.handle_allocator.getPtr(self.msquic_listener);
        var incoming_conn_frame = await async listener_ptr.accept();
        _ = incoming_conn_frame;
    }

    fn acceptIncomingStream(self: MultistreamSelect, allocator: Allocator, conn_handle: MsQuicTransport.ConnectionSystem.Handle) !void {
        var conn_ptr = try self.transport.connection_system.handle_allocator.getPtr(conn_handle);
        const incoming_stream = try await async conn_ptr.acceptStream(allocator);
        _ = incoming_stream;
    }

    // matched_proto_buf should be at least 128 bytes
    pub fn negotiateInboundMultistreamSelect(writer: anytype, reader: anytype, supportedProtoMatcher: anytype, matched_proto_buf: []u8) !usize {
        std.debug.assert(matched_proto_buf.len >= 128);
        {
            // Messsages here should never be over 128 bytes. We check that the msg_len is <0x7f. (127 + 1 for newline)
            // separate read_buf so these can run async
            var read_buf = [_]u8{0} ** 128;
            const msg_len = try smallDelimRead(reader, read_buf[0..]);
            if (!std.mem.eql(u8, read_buf[0..msg_len], multistream_protocol_id[0..])) {
                return error.NotMultistreamSelect;
            }
            try delimWrite(writer, multistream_protocol_id);
        }

        while (true) {
            const msg_len = try smallDelimRead(reader, matched_proto_buf[0..]);
            std.debug.print("Got proto {s}\n", .{matched_proto_buf[0..msg_len]});
            if (supportedProtoMatcher.isSupportedProto(matched_proto_buf[0..msg_len])) {
                try delimWrite(writer, matched_proto_buf[0..msg_len]);
                return msg_len;
            } else {
                try delimWrite(writer, "na");
            }
        }
    }

    pub fn negotiateOutboundMultistreamSelect(writer: anytype, reader: anytype, application_protocol_id: []const u8) !void {
        for ([_][]const u8{ multistream_protocol_id[0..], application_protocol_id }) |proto_id| {
            std.debug.print("!!sending {s}\n", .{proto_id});
            try delimWrite(writer, proto_id);
        }

        for ([_][]const u8{ multistream_protocol_id[0..], application_protocol_id }) |expected_proto_id| {
            // Messsages here should never be over 128 bytes. We check that the msg_len is <0x7f. (127 + 1 for newline)
            var read_buf = [_]u8{0} ** 128;
            const msg_len = try reader.readByte();
            std.debug.print("!!Read byte {}\n", .{msg_len});
            if (msg_len > 0x7F) {
                return error.VarIntTooLarge;
            }
            try reader.readNoEof(read_buf[0..msg_len]);
            if (!std.mem.eql(u8, read_buf[0 .. msg_len - 1], expected_proto_id)) {
                return error.UnexpectedEcho;
            }
            if (read_buf[msg_len - 1] != '\n') {
                return error.MissingNewline;
            }
        }
    }

    fn listen(self: MultistreamSelect) !Listener {
        _ = self;
        return error.ImplementMe;
    }

    fn connect(self: MultistreamSelect, allocator: Allocator, address: std.net.Address) !MsQuicTransport.StreamSystem.Handle {
        const ip_addr = switch (address) {
            .in => try std.fmt.allocPrint(allocator, "{}", address.in),
            .in => try std.fmt.allocPrint(allocator, "{}", address.in6),
        };
        defer allocator.destroy(ip_addr);

        var conn_handle = try self.transport.startConnection(allocator, ip_addr, address.getPort());
        self.active_conns.append(conn_handle);

        // Todo broadcast new connection event

        var conn_ptr = try self.transport.connection_system.handle_allocator.getPtr(conn_handle);
        var stream_handle = try conn_ptr.newStream(self.transport);

        self.negotiateOutboundMultistreamSelect(stream_handle);

        return stream_handle;
    }

    fn totalCountSupportedProtocolNames(protocols: anytype) usize {
        const total_supported_protocols = comptime blk: {
            var count: usize = 0;
            inline for (protocols) |protocol| {
                const Protocol = @TypeOf(protocol);
                count += Protocol.protocol_names.len;
            }
            break :blk count;
        };
        return total_supported_protocols;
    }

    fn getAllSupportedProtocolNames(protocols: anytype) [totalCountSupportedProtocolNames(protocols)][]const u8 {
        var supported_protocols_idx: usize = 0;
        var supported_protocols: [totalCountSupportedProtocolNames(protocols)][]const u8 = undefined;

        inline for (protocols) |protocol| {
            const Protocol = @TypeOf(protocol);
            const protocol_info = @typeInfo(Protocol);

            if (protocol_info != .Struct) {
                @compileError("MultistreamSelect: protocols must be structs");
            }

            // std.debug.print("protocol_info: {any}", Protocol.Struct.child.protocol_names);
            std.debug.print("protocol_info: {any}\n", .{protocol_info.Struct.decls});
            const protocol_names_decl = comptime blk: {
                for (protocol_info.Struct.decls) |decl| {
                    if (std.mem.eql(u8, decl.name, "protocol_names")) {
                        break :blk decl;
                    }
                }
            };
            std.debug.print("protocol_info: {any}\n", .{protocol_names_decl});

            const protocol_names = Protocol.protocol_names;

            inline for (protocol_names) |protocol_name| {
                std.debug.print("protocol_name: {s}\n", .{protocol_name});
                supported_protocols[supported_protocols_idx] = protocol_name[0..];
                supported_protocols_idx += 1;
            }

            std.debug.print("this protocol supports: {any}\n", .{protocol_names});

            // if (protocol_info.child.protocol_names) {}
        }

        std.debug.print("All supported Protocols: {any}", .{supported_protocols});
        return supported_protocols;
    }

    // fn acceptStream(&self, stream: Stream) {
    //     self.transport.acceptStream(stream);
    // }
};

const GenericProtocol = struct {
    pub const protocol_names = .{"/hi/1.0.0"};
    fn acceptStream() void {}
    fn handleEvent() void {}
};

// test "multistream select" {
//     const allocator = std.testing.allocator;
//     // var p = GenericProtocol{};
//     // _ = try MultistreamSelect.init(allocator, .{GenericProtocol{}});
//     // _ = allocator;
//     // _ = MultistreamSelect.getAllSupportedProtocolNames(.{GenericProtocol{}});

//     // Create the transport
//     var host_key = try crypto.ED25519KeyPair.new();
//     var cert_key = try crypto.ED25519KeyPair.new();
//     defer host_key.deinit();
//     defer cert_key.deinit();

//     var x509 = try crypto.X509.init(cert_key);
//     defer x509.deinit();

//     try crypto.Libp2pTLSCert.insertExtension(&x509, try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }));

//     var pkcs12 = try crypto.PKCS12.init(cert_key, x509);
//     defer pkcs12.deinit();

//     var transport = try MsQuicTransport.init(allocator, "zig-libp2p", &pkcs12, MsQuicTransport.Options.default());
//     defer transport.deinit();

//     // Use multistream select

//     // -> /multistream/1.0
//     // <- /multistream/1.0
//     // -> /appid
//     // <- /appid
//     // -> data

//     // -> /multistream/1.0
//     // -> /appid
//     // -> data
//     // <- /multistream/1.0
//     // <- /appid

//     // one write
//     // <multistreamproto><appid>data

//     // 3 writes
//     // <multistreamproto>
//     // <appid>
//     // data

//     //

//     // var mss = try MultistreamSelect.init(&transport, allocator);
//     // defer mss.deinit();

//     // var listener = mss.listen(my_protocol_id)
//     // negotiated_incoming_stream = listener.accept()
//     // Do something with negotiated_incoming_stream

//     {
//         // Dialer side
//         // var mss_dialer = try MultistreamSelect.init(&transport, allocator);
//         // defer mss_dialer.deinit();

//         // var negotiated_outgoing_stream = mss_dialer.connect(allocator, some_addr)
//         // negotiated_outgoing_stream.send("hello world")
//     }
// }

test "foo" {
    const a = "aaaaa";
    const b = "B";
    // var foo = [_][]const u8{ a[0..], b[0..] };
    for ([_][]const u8{ a[0..], b[0..] }) |something| {
        var read_buf = [_]u8{0} ** 128;
        std.mem.copy(u8, read_buf[0..], something);
        std.debug.print("\nRead buf is {s}\n", .{read_buf});
    }
}

test "negotiate outbound" {
    const FifoTestStream = std.fifo.LinearFifo(u8, .{ .Static = 1024 });
    var toPeerA = FifoTestStream.init();
    var fromPeerA = FifoTestStream.init();
    var toPeerAWriter = toPeerA.writer();

    try delimWrite(toPeerAWriter, multistream_protocol_id);
    try delimWrite(toPeerAWriter, "/hello/1.0.0");

    const proto_id = "/hello/1.0.0";

    try MultistreamSelect.negotiateOutboundMultistreamSelect(fromPeerA.writer(), toPeerA.reader(), proto_id);

    var allocator = std.testing.allocator;
    var bytes = try fromPeerA.reader().readAllAlloc(allocator, 1024);
    defer allocator.free(bytes);
    try std.testing.expectEqualSlices(u8, bytes, "\x13" ++ multistream_protocol_id ++ "\n" ++ "\x0d" ++ proto_id ++ "\n");
}

test "negotiate inbound" {
    const proto_id = "/hello/1.0.0";
    const second_proto_id = "/hi/1.0.0";
    const mock = struct {
        const isSupported = struct {
            fn isSupportedProto(_: []const u8) bool {
                return true;
            }
        };
        const isNotSupported = struct {
            fn isSupportedProto(_: []const u8) bool {
                return false;
            }
        };
        const hiIsSupported = struct {
            fn isSupportedProto(p: []const u8) bool {
                return std.mem.eql(u8, second_proto_id[0..], p);
            }
        };
    };

    const FifoTestStream = std.fifo.LinearFifo(u8, .{ .Static = 1024 });
    var matched_proto = [_]u8{0} ** 128;
    {
        var toPeerA = FifoTestStream.init();
        var fromPeerA = FifoTestStream.init();
        var toPeerAWriter = toPeerA.writer();

        try delimWrite(toPeerAWriter, multistream_protocol_id);
        try delimWrite(toPeerAWriter, proto_id);

        const msg_len = try MultistreamSelect.negotiateInboundMultistreamSelect(fromPeerA.writer(), toPeerA.reader(), mock.isSupported, matched_proto[0..]);
        try std.testing.expectEqualStrings(matched_proto[0..msg_len], proto_id[0..]);

        var allocator = std.testing.allocator;
        var bytes = try fromPeerA.reader().readAllAlloc(allocator, 1024);
        defer allocator.free(bytes);
        try std.testing.expectEqualSlices(u8, bytes, "\x13" ++ multistream_protocol_id ++ "\n" ++ "\x0d" ++ proto_id ++ "\n");
    }

    // When a proto isn't supported
    {
        var toPeerA = FifoTestStream.init();
        var fromPeerA = FifoTestStream.init();
        var toPeerAWriter = toPeerA.writer();

        try delimWrite(toPeerAWriter, multistream_protocol_id);
        try delimWrite(toPeerAWriter, proto_id);

        try std.testing.expectError(error.EndOfStream, MultistreamSelect.negotiateInboundMultistreamSelect(
            fromPeerA.writer(),
            toPeerA.reader(),
            mock.isNotSupported,
            matched_proto[0..],
        ));
    }

    // When the first proto isn't supported
    {
        var toPeerA = FifoTestStream.init();
        var fromPeerA = FifoTestStream.init();
        var toPeerAWriter = toPeerA.writer();

        try delimWrite(toPeerAWriter, multistream_protocol_id);
        try delimWrite(toPeerAWriter, proto_id);
        try delimWrite(toPeerAWriter, second_proto_id);

        const msg_len = try MultistreamSelect.negotiateInboundMultistreamSelect(
            fromPeerA.writer(),
            toPeerA.reader(),
            mock.hiIsSupported,
            matched_proto[0..],
        );
        try std.testing.expectEqualStrings(matched_proto[0..msg_len], second_proto_id[0..]);

        var allocator = std.testing.allocator;
        var bytes = try fromPeerA.reader().readAllAlloc(allocator, 1024);
        defer allocator.free(bytes);
        try std.testing.expectEqualSlices(u8, bytes, "\x13" ++ multistream_protocol_id ++ "\n" ++ "\x03" ++ "na" ++ "\n" ++ "\x0a" ++ second_proto_id ++ "\n");
    }
}
