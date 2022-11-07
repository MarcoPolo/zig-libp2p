const std = @import("std");
const Allocator = std.mem.Allocator;
const MsQuic = @import("../msquic_wrapper.zig");
const QuicStatus = MsQuic.QuicStatus;
const ArrayList = std.ArrayList;
const Instant = std.time.Instant;
const Semaphore = std.Thread.Semaphore;

const ThroughputClient = struct {
    allocator: Allocator,
    msquic: *MsQuic.QUIC_API_TABLE,
    registration: MsQuic.HQUIC,
    configuration: MsQuic.HQUIC,

    semaphore: Semaphore = Semaphore{},

    data_buffer: MsQuic.QUIC_BUFFER,
    data_buffer_slice: []u8,

    streams: ArrayList(*StreamContext),

    settings: Settings = .{},

    start_time: ?Instant = null,
    end_time: ?Instant = null,

    const Settings = struct {
        use_send_buffering: bool = true,
        // download_length: u64 = 0x2fffffff,
        download_length: u64 = 0,
        upload_length: u64 = 0xfffffff,
        // upload_length: u64 = 0,
        io_size: u32 = 0x10000,

        // target: [:0]const u8 = "127.0.0.1",
        target: [:0]const u8 = "localhost",
        target_port: u16 = 4433,
    };

    var libp2p_proto_name = "perf".*;
    const alpn = MsQuic.QUIC_BUFFER{
        .Length = @sizeOf(@TypeOf(libp2p_proto_name)) - 1,
        .Buffer = @ptrCast([*c]u8, libp2p_proto_name[0..]),
    };

    pub fn init(allocator: Allocator, client_settings: Settings) !@This() {
        // TODO create/fill data buffer

        var msquic: *MsQuic.QUIC_API_TABLE = undefined;
        const msquic_ptr = @ptrCast([*c]?*const anyopaque, &msquic);
        if (QuicStatus.isError(MsQuic.MsQuicOpenVersion(MsQuic.QUIC_API_VERSION_2, msquic_ptr))) {
            return error.MsQuicOpenFailed;
        }
        errdefer MsQuic.MsQuicClose(msquic);

        const app_name: [:0]const u8 = "secnetperf-client-tput-zig";
        const reg_config = MsQuic.QUIC_REGISTRATION_CONFIG{
            .AppName = @ptrCast([*c]const u8, app_name),
            .ExecutionProfile = MsQuic.QUIC_EXECUTION_PROFILE_TYPE_MAX_THROUGHPUT,
        };
        var registration: MsQuic.HQUIC = undefined;

        if (QuicStatus.isError(msquic.RegistrationOpen.?(&reg_config, &registration))) {
            return error.RegistrationFailed;
        }
        errdefer msquic.RegistrationClose.?(registration);

        // Start configuration
        var configuration: MsQuic.HQUIC = undefined;
        var settings = std.mem.zeroes(MsQuic.QuicSettings);

        settings.IdleTimeoutMs = 5000;
        settings.IsSet.flags.IdleTimeoutMs = true;

        settings.ConnFlowControlWindow = 0x8000000;
        settings.IsSet.flags.ConnFlowControlWindow = true;

        settings.CongestionControlAlgorithm = MsQuic.QUIC_CONGESTION_CONTROL_ALGORITHM_CUBIC;
        settings.IsSet.flags.CongestionControlAlgorithm = true;

        // Configures the server's resumption level to allow for resumption and
        // 0-RTT.
        settings.bitfields.ServerResumptionLevel = MsQuic.QUIC_SERVER_RESUME_AND_ZERORTT;
        settings.IsSet.flags.ServerResumptionLevel = true;

        // Configures the server's settings to allow for the peer to open a single
        // bidirectional stream. By default connections are not configured to allow
        // any streams from the peer.
        settings.PeerBidiStreamCount = 1024;
        settings.IsSet.flags.PeerBidiStreamCount = true;

        var cred_config = std.mem.zeroes(MsQuic.QUIC_CREDENTIAL_CONFIG);

        cred_config.Flags = MsQuic.QUIC_CREDENTIAL_FLAG_NONE;
        cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_CLIENT;
        cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_NO_CERTIFICATE_VALIDATION;

        if (MsQuic.QuicStatus.isError(msquic.ConfigurationOpen.?(registration, &alpn, 1, &settings, @sizeOf(@TypeOf(settings)), null, &configuration))) {
            return error.ConfigurationFailed;
        }
        errdefer msquic.ConfigurationClose.?(configuration);

        const status = msquic.ConfigurationLoadCredential.?(configuration, &cred_config);
        if (MsQuic.QuicStatus.isError(status)) {
            std.debug.print("Failed to load credential: {}\n", .{status});
            return error.ConfigurationLoadCredentialFailed;
        }

        var data_buffer_slice = blk: {
            if (client_settings.download_length > 0) {
                var buf = try allocator.alloc(u8, @sizeOf(u64));
                var buf_ptr_hack = @ptrCast(*u64, @alignCast(8, &buf[0]));
                buf_ptr_hack.* = std.mem.nativeToBig(u64, client_settings.download_length);
                break :blk buf;
            } else {
                var buf = try allocator.alloc(u8, client_settings.io_size);
                var buf_ptr_hack = @ptrCast(*u64, @alignCast(8, &buf[0]));
                buf_ptr_hack.* = std.mem.nativeToBig(u64, 0);
                var i: usize = @sizeOf(u64);
                while (i < client_settings.io_size) : (i += 1) {
                    buf[i] = @truncate(u8, i);
                }
                break :blk buf;
            }
        };

        const data_buffer = MsQuic.QUIC_BUFFER{ .Length = @intCast(u32, data_buffer_slice.len), .Buffer = data_buffer_slice.ptr };

        return ThroughputClient{
            .allocator = allocator,
            .msquic = msquic,
            .registration = registration,
            .configuration = configuration,
            .streams = ArrayList(*StreamContext).init(allocator),
            .data_buffer = data_buffer,
            .data_buffer_slice = data_buffer_slice,
            .settings = client_settings,
        };
    }
    pub fn deinit(self: *@This()) void {
        defer MsQuic.MsQuicClose(self.msquic);
        defer self.msquic.RegistrationClose.?(self.registration);
        defer self.msquic.ConfigurationClose.?(self.configuration);

        defer self.allocator.free(self.data_buffer_slice);
    }

    pub fn start(self: *@This()) !void {
        self.start_time = try Instant.now();
        var conn: MsQuic.HQUIC = undefined;
        if (QuicStatus.isError(self.msquic.ConnectionOpen.?(self.registration, ThroughputClient.connectionCallback, self, &conn))) {
            return error.FailedToOpenConn;
        }

        errdefer {
            self.msquic.ConnectionShutdown.?(conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);
        }

        if (!self.settings.use_send_buffering) {
            var settings = std.mem.zeroes(MsQuic.QuicSettings);
            settings.bitfields.SendBufferingEnabled = false;
            settings.IsSet.flags.SendBufferingEnabled = true;
            const status = self.msquic.SetParam.?(conn, MsQuic.QUIC_PARAM_CONN_SETTINGS, @sizeOf(@TypeOf(settings)), &settings);
            if (QuicStatus.isError(status)) {
                std.debug.print("MsQuic->SetParam (CONN_SETTINGS) failed! {}\n", .{status});
                return error.FailedToSetParam;
            }
        }

        var stream_context = try self.allocator.create(StreamContext);
        stream_context.* = StreamContext{
            .client = self,
            .handle = undefined,
        };
        errdefer {
            self.allocator.destroy(stream_context);
        }

        var status = self.msquic.StreamOpen.?(
            conn,
            MsQuic.QUIC_STREAM_OPEN_FLAG_NONE,
            StreamContext.streamCallback,
            stream_context,
            &stream_context.handle,
        );

        if (MsQuic.QuicStatus.isError(status)) {
            return error.StreamOpenFailed;
        }

        status = self.msquic.StreamStart.?(stream_context.handle, MsQuic.QUIC_STREAM_START_FLAG_NONE);
        if (MsQuic.QuicStatus.isError(status)) {
            return error.StreamStartFailed;
        }

        if (self.settings.download_length > 0) {
            // Download only, close send side
            _ = self.msquic.StreamSend.?(
                stream_context.handle,
                &self.data_buffer,
                1,
                MsQuic.QUIC_SEND_FLAG_FIN,
                &self.data_buffer,
            );
        } else {
            std.debug.assert(self.settings.upload_length > 0);
            self.sendQuicData(stream_context);
        }

        status = self.msquic.ConnectionStart.?(
            conn,
            self.configuration,
            MsQuic.QUIC_ADDRESS_FAMILY_UNSPEC,
            @ptrCast([*c]const u8, self.settings.target),
            self.settings.target_port,
        );
        if (MsQuic.QuicStatus.isError(status)) {
            return error.ConnectionStartFailed;
        }
    }

    fn sendQuicData(self: *@This(), stream_context: *StreamContext) void {
        while (!stream_context.complete and stream_context.outstanding_bytes < stream_context.ideal_send_buffer) {
            var bytes_Left_to_send = (self.settings.upload_length - stream_context.bytes_sent);
            var data_len = self.settings.io_size;
            var buffer = &self.data_buffer;
            var flags = MsQuic.QUIC_SEND_FLAG_NONE;

            if (data_len >= bytes_Left_to_send) {
                data_len = @intCast(u32, bytes_Left_to_send);
                stream_context.last_buffer.Buffer = buffer.Buffer;
                stream_context.last_buffer.Length = data_len;
                buffer = &stream_context.last_buffer;
                flags = MsQuic.QUIC_SEND_FLAG_FIN;
                stream_context.complete = true;
            }

            stream_context.bytes_sent += data_len;
            stream_context.outstanding_bytes += data_len;

            _ = self.msquic.StreamSend.?(
                stream_context.handle,
                buffer,
                1,
                @bitCast(c_uint, flags),
                buffer,
            );
        }
    }

    const StreamContext = struct {
        client: *ThroughputClient,

        ideal_send_buffer: u64 = 1,
        handle: MsQuic.HQUIC,
        complete: bool = false,
        outstanding_bytes: u64 = 0,
        bytes_sent: u64 = 0,
        bytes_completed: u64 = 0,

        last_buffer: MsQuic.QUIC_BUFFER = undefined,

        fn streamCallback(stream: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
            const self = @ptrCast(*StreamContext, @alignCast(@alignOf(StreamContext), self_ptr));
            return self.client.streamCallback(stream, self, event);
        }
    };

    fn streamCallback(self: *@This(), stream: MsQuic.HQUIC, stream_context: *StreamContext, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) MsQuic.QUIC_STATUS {
        switch (event.*.Type) {
            MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                stream_context.bytes_completed += event.*.unnamed_0.RECEIVE.TotalBufferLength;
                if (stream_context.bytes_completed >= self.settings.download_length) {
                    stream_context.complete = true;
                }
            },

            MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                if (self.settings.upload_length > 0) {
                    var buf = @ptrCast(*MsQuic.QUIC_BUFFER, @alignCast(@alignOf(MsQuic.QUIC_BUFFER), event.*.unnamed_0.SEND_COMPLETE.ClientContext));
                    stream_context.outstanding_bytes -= buf.Length;
                    if (event.*.unnamed_0.SEND_COMPLETE.Canceled == 0) {
                        // not canceled
                        stream_context.bytes_completed += buf.Length;
                        self.sendQuicData(stream_context);
                    }
                }
            },
            MsQuic.QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE => {
                if (self.settings.upload_length > 0 and
                    !self.settings.use_send_buffering and
                    stream_context.ideal_send_buffer < event.*.unnamed_0.IDEAL_SEND_BUFFER_SIZE.ByteCount)
                {
                    stream_context.ideal_send_buffer = event.*.unnamed_0.IDEAL_SEND_BUFFER_SIZE.ByteCount;
                    self.sendQuicData(stream_context);
                }
            },

            MsQuic.QUIC_STREAM_EVENT_PEER_SEND_ABORTED, MsQuic.QUIC_STREAM_EVENT_PEER_RECEIVE_ABORTED => {
                if (!stream_context.complete) {
                    std.debug.print("Peer aborted stream\n", .{});
                }
                _ = self.msquic.StreamShutdown.?(stream, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT, 0);
            },

            MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                self.onStreamShutdownComplete(stream_context) catch {
                    @panic("Failed to complete shutdown");
                };
            },

            else => {},
        }

        return 0;
    }

    fn onStreamShutdownComplete(self: *@This(), stream_context: *StreamContext) !void {
        self.end_time = try Instant.now();
        const elapsed_ms = (self.end_time.?.since(self.start_time.?)) / std.time.ns_per_ms;
        const send_rate = (stream_context.bytes_completed * 1_000 * 8) / (elapsed_ms * 1000);

        if (!stream_context.complete and stream_context.bytes_completed == 0) {
            std.debug.print("Error: Did not complete any bytes! Failed to connect?\n", .{});
            std.debug.print("Run the server with something like: $LIB_MSQUIC/artifacts/bin/<OS>/<ARCH>_Release_openssl/secnetperf \n", .{});
        } else {
            std.debug.print("Result: {} bytes @ {} kbps ({} ms). \n", .{ stream_context.bytes_completed, send_rate, elapsed_ms });
            std.debug.print("Result: {} bytes @ {} kbps ({} ms). \n", .{ stream_context.bytes_sent, send_rate, elapsed_ms });
            if (!stream_context.complete) {
                std.debug.print("Did not complete all bytes (sent: {} completed: {}).\n", .{ stream_context.bytes_sent, stream_context.bytes_completed });
            }
        }

        self.allocator.destroy(stream_context);

        self.semaphore.post();
        std.debug.print("Done\n", .{});
    }

    fn connectionCallback(connection: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
        const self = @ptrCast(*ThroughputClient, @alignCast(@alignOf(ThroughputClient), self_ptr));
        // std.debug.print("Connection event: from={any} {}\n", .{ connection, event.*.Type });

        switch (event.*.Type) {
            MsQuic.QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE => {
                if (!event.*.unnamed_0.SHUTDOWN_COMPLETE.AppCloseInProgress) {
                    self.msquic.ConnectionClose.?(connection);
                }
            },
            else => {},
        }

        return 0;
    }

    fn wait(self: *@This()) void {
        self.semaphore.wait();
    }
};

test "throughputclient" {
    const allocator = std.testing.allocator;

    std.debug.print("\n", .{});
    var c = try ThroughputClient.init(allocator, .{ .use_send_buffering = false });
    defer c.deinit();

    try c.start();
    c.wait();
    std.debug.print("Done waiting\n", .{});
}
