const std = @import("std");
const uri = @import("uri");
const Allocator = std.mem.Allocator;

// pub const io_mode = .evented;

const MsQuic = @import("msquic_wrapper.zig");

const udp_port: u16 = 4567;

fn open_socket() !i32 {
    const os = std.os;
    var sockfd: i32 = try std.os.socket(
        os.AF.INET,
        os.SOCK.DGRAM | os.SOCK.CLOEXEC | os.SOCK.NONBLOCK,
        0,
    );
    // var addr: std.net.Address = try std.net.Address.parseIp4("127.0.0.1", 8125);
    // try os.bind(sockfd, &addr.any, @sizeOf(os.sockaddr.in));
    return sockfd;
}

fn hasFlag(f: []const u8) bool {
    for (std.os.argv) |flag| {
        const s = std.mem.sliceTo(flag, 0);
        if (std.mem.eql(u8, f, s)) {
            return true;
        }
    }
    return false;
}

fn getFlag(f: []const u8) ?[]u8 {
    for (std.os.argv) |flag| {
        const s = std.mem.sliceTo(flag, 0);
        if (std.mem.startsWith(u8, s, f)) {
            return s[f.len..];
        }
    }
    return null;
}

pub fn main() !void {
    var status: u32 = 0;
    var msquic: *MsQuic.QUIC_API_TABLE = undefined;
    const msQuicPtr = @ptrCast([*c]?*const anyopaque, &msquic);
    status = MsQuic.MsQuicOpenVersion(MsQuic.QUIC_API_VERSION_2, msQuicPtr);
    if (status > 0) {
        std.debug.print("MsQuicOpen2 failed: {}\n", .{status});
        return;
    }
    defer MsQuic.MsQuicClose(msquic);

    const app_name: [:0]const u8 = "quicsample";
    const reg_config = MsQuic.QUIC_REGISTRATION_CONFIG{
        .AppName = app_name,
        .ExecutionProfile = MsQuic.QUIC_EXECUTION_PROFILE_LOW_LATENCY,
    };
    var registration: MsQuic.HQUIC = undefined;
    status = msquic.RegistrationOpen.?(&reg_config, &registration);
    if (status > 0) {
        std.debug.print("registration failed: {}\n", .{status});
        return;
    }
    defer msquic.RegistrationClose.?(registration);

    const flags = std.os.argv;
    const is_help = flags.len < 2 or hasFlag("-h") or hasFlag("--help");

    if (is_help) {
        std.debug.print(
            \\ Usage:
            \\ --client  Run the quic client
            \\ --server  Run the quic server
        ,
            .{},
        );
        return;
    }
    const is_client = hasFlag("--client");
    const is_server = hasFlag("--server");

    std.debug.print("Hello, world! {s}\n", .{is_client});
    const allocator = std.heap.c_allocator;

    if (is_client) {
        runClient(allocator, hasFlag("--unsecure"), msquic, &registration) catch |err| {
            std.debug.print("Client failed: {}\n", .{err});
            return;
        };
        std.debug.print("Client done\n", .{});
    } else if (is_server) {
        runServer(allocator, msquic, &registration) catch |err| {
            std.debug.print("server failed: {}\n", .{err});
            return;
        };
        std.debug.print("server done\n", .{});
    }
}

const ClientCallback = struct {
    const Self = @This();
    pub fn connectionCallback(connection: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) callconv(.C) c_uint {
        const self: *ClientCallback = @ptrCast(*ClientCallback, @alignCast(@alignOf(ClientCallback), self_ptr));

        switch (event.*.Type) {
            MsQuic.QUIC_CONNECTION_EVENT_CONNECTED => {
                // The handshake has completed for the connection.
                std.debug.print("conn={any} Client connected\n", .{connection});
                self.clientSend(self.allocator, connection) catch |err| {
                    std.debug.print("conn={any} Failed to send: {any}\n", .{ connection, err });
                    self.msquic.ConnectionShutdown.?(connection, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);
                };
                // TODO send
            },
            MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_TRANSPORT => {
                // The connection has been shut down by the transport. Generally, this
                // is the expected way for the connection to shut down with this
                // protocol, since we let idle timeout kill the connection.
                if (event.*.unnamed_0.SHUTDOWN_INITIATED_BY_TRANSPORT.Status == MsQuic.QuicStatus.ConnectionIdle) {
                    std.debug.print("conn={any} successfully shut down on idle\n", .{connection});
                } else {
                    std.debug.print("conn={any} shut down by transport status={x}\n", .{ connection, event.*.unnamed_0.SHUTDOWN_INITIATED_BY_TRANSPORT.Status });
                }
            },
            MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_PEER => {
                // The connection was explicitly shut down by the peer.
                std.debug.print("conn={any} shut down by peer err={x}\n", .{ connection, event.*.unnamed_0.SHUTDOWN_INITIATED_BY_PEER.ErrorCode });
            },
            MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => {
                std.debug.print("conn={any} All done\n", .{connection});
                if (!event.*.unnamed_0.SHUTDOWN_COMPLETE.AppCloseInProgress) {
                    std.debug.print("Closing conn\n", .{});
                    self.msquic.ConnectionClose.?(connection);
                }
            },
            MsQuic.QUIC_CONNECTION_EVENT_RESUMPTION_TICKET_RECEIVED => {
                const resumption_ticket = event.*.unnamed_0.RESUMPTION_TICKET_RECEIVED;
                std.debug.print("conn={any} Resumption ticket received: ", .{connection});
                var i: usize = 0;
                while (i < resumption_ticket.ResumptionTicketLength) : (i += 1) {
                    std.debug.print("{x}", .{resumption_ticket.ResumptionTicket[i]});
                    i = i + 1;
                }
                std.debug.print("\n", .{});
            },
            else => {
                std.debug.print("conn={any} Unknown event: {}\n", .{ connection, event.*.Type });
            },
        }

        return MsQuic.QuicStatus.Success;
    }
    fn clientSend(self: *Self, allocator: Allocator, connection: MsQuic.HQUIC) !void {
        var stream: MsQuic.HQUIC = undefined;
        // Create/allocate a new bidirectional stream. The stream is just allocated
        // and no QUIC stream identifier is assigned until it's started.
        var status = self.msquic.StreamOpen.?(connection, MsQuic.QUIC_STREAM_OPEN_FLAG_NONE, Self.streamCallback, self, &stream);
        if (MsQuic.QuicStatus.isError(status)) {
            std.debug.print("Stream open failed: {x}\n", .{status});
            return error.StreamOpenFailed;
        }
        errdefer self.msquic.StreamClose.?(stream);

        // Starts the bidirectional stream. By default, the peer is not notified of
        // the stream being started until data is sent on the stream.
        status = self.msquic.StreamStart.?(stream, MsQuic.QUIC_STREAM_START_FLAG_NONE);
        if (MsQuic.QuicStatus.isError(status)) {
            std.debug.print("Stream start failed: {x}\n", .{status});
            return error.StreamStartFailed;
        }

        const send_buffer = try SendBuffer(send_buffer_size).init(allocator);
        errdefer send_buffer.deinit(allocator);
        std.mem.copy(u8, send_buffer.buffer[0..], "Hello, world from client!");

        status = self.msquic.StreamSend.?(
            stream,
            send_buffer.asQuicBufPtr(),
            1,
            MsQuic.QUIC_SEND_FLAG_FIN,
            send_buffer,
        );

        if (MsQuic.QuicStatus.isError(status)) {
            std.debug.print("Stream send failed: {x}\n", .{status});
            return error.streamSendFailed;
        }
    }

    pub fn streamCallback(stream: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) callconv(.C) c_uint {
        const self: *ClientCallback = @ptrCast(*ClientCallback, @alignCast(@alignOf(ClientCallback), self_ptr));

        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                // A previous StreamSend call has completed, and the context is being
                // returned back to the app.
                std.debug.print("strm={any} data sent\n", .{stream});
                if (event.*.unnamed_0.SEND_COMPLETE.ClientContext) |client_context| {
                    const T = SendBuffer(send_buffer_size);
                    const send_buffer = @ptrCast(*T, @alignCast(@alignOf(T), client_context));
                    send_buffer.deinit(self.allocator);
                }
            },
            MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                std.debug.print("strm={any} data recv\n", .{stream});
                const limit = event.*.unnamed_0.RECEIVE.BufferCount;
                var i: usize = 0;
                while (i < limit) : (i += 1) {
                    const buf = event.*.unnamed_0.RECEIVE.Buffers[i];
                    const slice = buf.Buffer[0..buf.Length];
                    std.debug.print("strm={any} data: {s}\n", .{ stream, slice });
                }
            },
            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_ABORTED => {
                std.debug.print("strm={any} peer aborted\n", .{stream});
            },
            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_SHUTDOWN => {
                std.debug.print("strm={any} peer shutdown\n", .{stream});
            },
            MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                std.debug.print("strm={any} all done\n", .{stream});
                if (!event.*.unnamed_0.SHUTDOWN_COMPLETE.AppCloseInProgress) {
                    self.msquic.StreamClose.?(stream);
                }
            },
            else => {},
        }

        return MsQuic.QuicStatus.Success;
    }
    const send_buffer_size = 100;

    something: u32,
    allocator: Allocator,
    msquic: *MsQuic.QUIC_API_TABLE,
};

fn runClient(allocator: Allocator, unsecure: bool, msquic: *MsQuic.QUIC_API_TABLE, registration: *MsQuic.HQUIC) !void {
    var configuration = try loadClientConfig(unsecure, msquic, registration);
    defer msquic.ConfigurationClose.?(configuration);
    std.debug.print("Config loaded\n", .{});

    // var resumption_ticket: [*c]u8 = undefined;
    var connection: MsQuic.HQUIC = undefined;

    var callback = ClientCallback{
        .something = 43,
        .msquic = msquic,
        .allocator = allocator,
    };
    std.debug.print("cb ptr is: {any}\n", .{@ptrCast(*anyopaque, &callback)});

    if (MsQuic.QuicStatus.isError(msquic.ConnectionOpen.?(registration.*, ClientCallback.connectionCallback, &callback, &connection))) {
        return error.ConnectionOpenFailed;
    }
    std.debug.print("Connection opened\n", .{});

    // TODO handle resumption

    // TODO get this from cli
    const target = "localhost";
    const status = msquic.ConnectionStart.?(connection, configuration, MsQuic.QUIC_ADDRESS_FAMILY_UNSPEC, target, udp_port);
    errdefer msquic.ConnectionClose.?(connection);
    if (MsQuic.QuicStatus.isError(status)) {
        std.debug.print("Connection failed: {}\n", .{status});
        return error.ConnectionStartFailed;
    }
    std.debug.print("Connection started\n", .{});
    std.debug.print("Press enter to exit\n\n", .{});
    const stdin = std.io.getStdIn().reader();
    var buf = [_]u8{0} ** 8;
    _ = try stdin.readUntilDelimiterOrEof(&buf, "\n"[0]);
}

fn loadClientConfig(unsecure: bool, msquic: *MsQuic.QUIC_API_TABLE, registration: *MsQuic.HQUIC) !MsQuic.HQUIC {
    var settings = std.mem.zeroes(MsQuic.QuicSettings);
    settings.IdleTimeoutMs = 1000;
    settings.IsSet.IdleTimeoutMs = true;

    var cred_config = std.mem.zeroes(MsQuic.QUIC_CREDENTIAL_CONFIG);
    cred_config.Type = MsQuic.QUIC_CREDENTIAL_TYPE_NONE;
    cred_config.Flags = MsQuic.QUIC_CREDENTIAL_FLAG_CLIENT;

    if (unsecure) {
        cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_NO_CERTIFICATE_VALIDATION;
    }

    var configuration: MsQuic.HQUIC = undefined;

    var r: MsQuic.HQUIC = registration.*;
    if (MsQuic.QuicStatus.isError(msquic.ConfigurationOpen.?(r, &alpn, 1, &settings, @sizeOf(@TypeOf(settings)), null, &configuration))) {
        std.debug.print("configuration failed: \n", .{});
        return error.ConfigurationFailed;
    }

    if (MsQuic.QuicStatus.isError(msquic.ConfigurationLoadCredential.?(configuration, &cred_config))) {
        return error.ConfigurationLoadCredentialFailed;
    }

    return configuration;
}

const ServerCallback = struct {
    const Self = @This();
    pub fn streamCallback(stream: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) callconv(.C) c_uint {
        const self: *Self = @ptrCast(*Self, @alignCast(@alignOf(Self), self_ptr));
        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                // A previous StreamSend call has completed, and the context is being
                // returned back to the app.
                std.debug.print("strm={any} data sent\n", .{stream});
                if (event.*.unnamed_0.SEND_COMPLETE.ClientContext) |client_context| {
                    const T = SendBuffer(send_buffer_size);
                    const send_buffer = @ptrCast(*T, @alignCast(@alignOf(T), client_context));
                    send_buffer.deinit(self.allocator);
                }
            },
            MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                // Data was received from the peer on the stream.
                std.debug.print("strm={any} data received\n", .{stream});
                const limit = event.*.unnamed_0.RECEIVE.BufferCount;
                var i: usize = 0;
                while (i < limit) : (i += 1) {
                    const buf = event.*.unnamed_0.RECEIVE.Buffers[i];
                    const slice = buf.Buffer[0..buf.Length];
                    std.debug.print("strm={any} data: {s}\n", .{ stream, slice });
                }
            },
            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_SHUTDOWN => {
                // The peer gracefully shut down its send direction of the stream.
                std.debug.print("strm={any} peer shutdown send direction\n", .{stream});
                self.serverSend(self.allocator, stream) catch |err| {
                    std.debug.print("strm={any} err={any} sending data\n", .{ stream, err });
                    _ = self.msquic.StreamShutdown.?(stream, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT, 0);
                    return 0;
                };
            },
            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_ABORTED => {
                // The peer aborted its send direction of the stream.
                std.debug.print("strm={any} peer aborted\n", .{stream});
                _ = self.msquic.StreamShutdown.?(stream, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT, 0);
            },
            MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                std.debug.print("strm={any} all done\n", .{stream});
                self.msquic.StreamClose.?(stream);
            },
            else => {},
        }
        return 0;
    }

    fn serverSend(self: *Self, allocator: Allocator, stream: MsQuic.HQUIC) !void {
        // Allocates and builds the buffer to send over the stream.
        const send_buffer = try SendBuffer(send_buffer_size).init(allocator);
        errdefer send_buffer.deinit(allocator);
        std.mem.copy(u8, send_buffer.buffer[0..], "Hello, world from server!");

        std.debug.print("send_buffer={any}\n", .{send_buffer});
        const status = self.msquic.StreamSend.?(
            stream,
            send_buffer.asQuicBufPtr(),
            1,
            MsQuic.QUIC_SEND_FLAG_FIN,
            send_buffer,
        );

        if (MsQuic.QuicStatus.isError(status)) {
            std.debug.print("Stream send failed: {x}\n", .{status});
            return error.streamSendFailed;
        }
    }

    pub fn connectionCallback(connection: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) callconv(.C) c_uint {
        const self: *Self = @ptrCast(*Self, @alignCast(@alignOf(Self), self_ptr));
        switch (event.*.Type) {
            // The handshake has completed for the connection.
            MsQuic.QUIC_CONNECTION_EVENT_CONNECTED => {
                std.debug.print("Connection connected: {any}\n", .{connection});
                _ = self.msquic.ConnectionSendResumptionTicket.?(connection, MsQuic.QUIC_SEND_RESUMPTION_FLAG_NONE, 0, null);
            },
            MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_TRANSPORT => {
                // The connection has been shut down by the transport. Generally, this
                // is the expected way for the connection to shut down with this
                // protocol, since we let idle timeout kill the connection.
                if (event.*.unnamed_0.SHUTDOWN_INITIATED_BY_TRANSPORT.Status == MsQuic.QUIC_STATUS_CONNECTION_IDLE) {
                    std.debug.print("Shutting down because of idle: {any}\n", .{connection});
                } else {
                    std.debug.print("Shutting down by transport: conn={any} status={any}\n", .{ connection, event.*.unnamed_0.SHUTDOWN_INITIATED_BY_TRANSPORT.Status });
                }
            },
            MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_PEER => {
                std.debug.print("conn={any} shutdown by peer. errror={any}\n", .{ connection, event.*.unnamed_0.SHUTDOWN_INITIATED_BY_PEER.ErrorCode });
            },
            MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => {
                std.debug.print("conn={any} all done\n", .{connection});
                self.msquic.ConnectionClose.?(connection);
            },
            MsQuic.QUIC_CONNECTION_EVENT_PEER_STREAM_STARTED => {
                std.debug.print("strm={any} all done\n", .{event.*.unnamed_0.PEER_STREAM_STARTED.Stream});
                self.msquic.SetCallbackHandler.?(event.*.unnamed_0.PEER_STREAM_STARTED.Stream, Self.streamCallback, self);
            },
            MsQuic.QUIC_CONNECTION_EVENT_RESUMED => {
                std.debug.print("conn={any} resumed!\n", .{connection});
            },
            else => {},
        }

        return MsQuic.QuicStatus.Success;
    }

    pub fn callback(listener: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_LISTENER_EVENT) callconv(.C) c_uint {
        var status = @bitCast(u32, MsQuic.EOPNOTSUPP);

        _ = listener;
        const self: *Self = @ptrCast(*Self, @alignCast(@alignOf(Self), self_ptr));
        std.debug.print("\n\nself is {any}\n", .{self_ptr});
        // const events_slice = std.mem.sliceTo(events, 0);
        // for (events_slice) |ev| {
        //     std.debug.print("Slice: {any}\n", .{ev});
        // }
        std.debug.print("Event: {any}\n", .{event.*.Type});

        switch (event.*.Type) {
            MsQuic.QUIC_LISTENER_EVENT_NEW_CONNECTION => {
                self.msquic.SetCallbackHandler.?(
                    event.*.unnamed_0.NEW_CONNECTION.Connection,
                    ServerCallback.connectionCallback,
                    self_ptr,
                );
                status = self.msquic.ConnectionSetConfiguration.?(
                    event.*.unnamed_0.NEW_CONNECTION.Connection,
                    self.configuration.*,
                );
            },
            else => {},
        }

        return status;
    }

    const send_buffer_size = 100;

    allocator: Allocator,
    something: u32,
    msquic: *MsQuic.QUIC_API_TABLE,
    configuration: *MsQuic.HQUIC,
};

fn SendBuffer(size: u16) type {
    return extern struct {
        quic_buff: MsQuic.QUIC_BUFFER,
        buffer: [size:0]u8,

        const Self = @This();

        fn init(allocator: std.mem.Allocator) !*Self {
            var ptr = try allocator.create(Self);
            ptr.* = Self{
                .quic_buff = MsQuic.QUIC_BUFFER{
                    .Buffer = &ptr.*.buffer,
                    .Length = size,
                },
                .buffer = [_:0]u8{0} ** size,
            };
            return ptr;
        }

        fn deinit(self: *Self, allocator: std.mem.Allocator) void {
            allocator.destroy(self);
        }

        fn asQuicBufPtr(self: *Self) *MsQuic.QUIC_BUFFER {
            return &self.*.quic_buff;
        }
    };
}

fn runServer(allocator: Allocator, msquic: *MsQuic.QUIC_API_TABLE, registration: *MsQuic.HQUIC) !void {
    var configuration = try loadServerConfig(msquic, registration);
    defer msquic.ConfigurationClose.?(configuration);

    var cb = ServerCallback{
        .something = 41,
        .msquic = msquic,
        .configuration = &configuration,
        .allocator = allocator,
    };

    var listener: MsQuic.HQUIC = undefined;

    if (MsQuic.QuicStatus.isError(msquic.ListenerOpen.?(registration.*, ServerCallback.callback, &cb, &listener))) {
        return error.ListenerOpenFailed;
    }
    defer msquic.ListenerClose.?(listener);

    var addr = std.mem.zeroes(MsQuic.QUIC_ADDR);
    MsQuic.QuicAddrSetFamily(&addr, MsQuic.QUIC_ADDRESS_FAMILY_UNSPEC);
    MsQuic.QuicAddrSetPort(&addr, udp_port);

    const status = msquic.ListenerStart.?(listener, &alpn, 1, &addr);
    if (MsQuic.QuicStatus.isError(status)) {
        std.debug.print("Listener failed: {}\n", .{status});

        return error.ListenerStartFailed;
    }

    const stdin = std.io.getStdIn().reader();
    var buf = [_]u8{0} ** 8;
    std.debug.print("Press enter to exit\n\n", .{});
    _ = try stdin.readUntilDelimiterOrEof(&buf, "\n"[0]);
}

var proto_name = "sample".*;
const alpn = MsQuic.QUIC_BUFFER{
    .Length = @sizeOf(@TypeOf("sample")),
    .Buffer = @ptrCast([*c]u8, proto_name[0..]),
};

fn loadServerConfig(msquic: *MsQuic.QUIC_API_TABLE, registration: *MsQuic.HQUIC) !MsQuic.HQUIC {
    var settings = std.mem.zeroes(MsQuic.QuicSettings);

    settings.IdleTimeoutMs = 1000;
    settings.IsSet.IdleTimeoutMs = true;

    // Configures the server's resumption level to allow for resumption and
    // 0-RTT.
    settings.ServerResumptionLevel = MsQuic.QUIC_SERVER_RESUME_AND_ZERORTT;
    settings.IsSet.ServerResumptionLevel = true;

    // Configures the server's settings to allow for the peer to open a single
    // bidirectional stream. By default connections are not configured to allow
    // any streams from the peer.
    settings.PeerBidiStreamCount = 1;
    settings.IsSet.PeerBidiStreamCount = true;

    var cred_helper = CredentialConfigHelper{
        .cred_config = std.mem.zeroes(MsQuic.QUIC_CREDENTIAL_CONFIG),
        .cert = undefined,
    };

    cred_helper.cred_config.Flags = MsQuic.QUIC_CREDENTIAL_FLAG_NONE;

    // TODO get this from the args
    cred_helper.cert.CertificateFile = "example-data/server.cert";
    cred_helper.cert.PrivateKeyFile = "example-data/server.key";
    cred_helper.cred_config.Type = MsQuic.QUIC_CREDENTIAL_TYPE_CERTIFICATE_FILE;
    cred_helper.cred_config.CertPtr.CertificateFile = &cred_helper.cert;

    var configuration: MsQuic.HQUIC = undefined;

    if (MsQuic.QuicStatus.isError(msquic.ConfigurationOpen.?(registration.*, &alpn, 1, &settings, @sizeOf(@TypeOf(settings)), null, &configuration))) {
        return error.ConfigurationFailed;
    }
    errdefer msquic.ConfigurationClose.?(configuration);

    const status = msquic.ConfigurationLoadCredential.?(configuration, &cred_helper.cred_config);
    if (MsQuic.QuicStatus.isError(status)) {
        std.debug.print("Failed to load credential: {}\n", .{status});
        return error.ConfigurationLoadCredentialFailed;
    }

    return configuration;
}

const CredentialConfigHelper = struct {
    cred_config: MsQuic.QUIC_CREDENTIAL_CONFIG,
    cert: MsQuic.QUIC_CERTIFICATE_FILE,
};
