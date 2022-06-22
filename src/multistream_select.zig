const std = @import("std");
const Allocator = std.mem.Allocator;
const MsQuicTransport = @import("./transport/msquic.zig").MsQuicTransport;
const crypto = @import("./crypto.zig");
const protobuf = @import("./util/protobuf.zig");
const HandleAllocator = @import("./handle.zig").HandleAllocator;

const protocol_id = "/multistream/1.0.0";

fn delimWrite(dest: anytype, to_write: []const u8) !void {
    try protobuf.append_raw_varint_to_writer(dest, @intCast(u64, to_write.len + 1));
    try dest.writeAll(to_write);
    try dest.writeByte("\n");
}

// fn delimRead(reader: anytype, to_write: []const u8) !void {
//     try protobuf.append_raw_varint_to_writer(dest, @intCast(u64, to_write.len + 1));
//     try dest.writeAll(to_write);
//     try dest.writeByte("\n");
// }

const MultistreamSelect = struct {
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

    fn negotiateInboundMultistreamSelect(stream: MsQuicTransport.StreamSystem.Handle) !void {
        _ = stream;
        return error.ImplementMe;
        // TODO negotiate inbound handle
    }

    fn negotiateOutboundMultistreamSelect(self: MultistreamSelect, stream: MsQuicTransport.StreamSystem.Handle) !void {
        var stream_ptr = try self.transport.stream_system.handle_allocator.getPtr(stream);
        var stream_writer = MsQuicTransport.Stream.Writer{ .Context = stream_ptr };
        var stream_reader = MsQuicTransport.Stream.Reader{ .Context = stream_ptr };
        _ = stream_reader;

        delimWrite(stream_writer, protocol_id);
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

test "multistream select" {
    const allocator = std.testing.allocator;
    // var p = GenericProtocol{};
    // _ = try MultistreamSelect.init(allocator, .{GenericProtocol{}});
    // _ = allocator;
    // _ = MultistreamSelect.getAllSupportedProtocolNames(.{GenericProtocol{}});

    // Create the transport
    var host_key = try crypto.ED25519KeyPair.new();
    var cert_key = try crypto.ED25519KeyPair.new();
    defer host_key.deinit();
    defer cert_key.deinit();

    var x509 = try crypto.X509.init(cert_key);
    defer x509.deinit();

    try crypto.Libp2pTLSCert.insertExtension(&x509, try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }));

    var pkcs12 = try crypto.PKCS12.init(cert_key, x509);
    defer pkcs12.deinit();

    var transport = try MsQuicTransport.init(allocator, "zig-libp2p", &pkcs12, MsQuicTransport.Options.default());
    _ = transport;
    // defer transport.deinit();

    // Use multistream select

    // var mss = try MultistreamSelect.init(&transport, allocator);
    // defer mss.deinit();

    // var listener = mss.listen(my_protocol_id)
    // negotiated_incoming_stream = listener.accept()
    // Do something with negotiated_incoming_stream

    {
        // Dialer side
        // var mss_dialer = try MultistreamSelect.init(&transport, allocator);
        // defer mss_dialer.deinit();

        // var negotiated_outgoing_stream = mss_dialer.connect(allocator, some_addr)
        // negotiated_outgoing_stream.send("hello world")
    }
}
