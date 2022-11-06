const std = @import("std");
const MsQuic = @import("msquic");
const crypto = @import("libp2p").crypto;
const CredentialConfigHelper = @import("libp2p-msquic").crypto.CredentialConfigHelper;
// const MsQuic = @import("msquic/msquic-wrapper.zig");

const workaround = @cImport({
    @cInclude("link_workaround.h");
});

const Allocator = std.mem.Allocator;
const QuicStatus = MsQuic.QuicStatus;
const ArrayList = std.ArrayList;
const Instant = std.time.Instant;
const Semaphore = std.Thread.Semaphore;

const Ping = struct {
    allocator: Allocator,

    host_key: crypto.OpenSSLKey.ED25519KeyPair,
    msquic: *MsQuic.QUIC_API_TABLE,
    registration: MsQuic.HQUIC,
    configuration: MsQuic.HQUIC,
    settings: Settings,

    const Settings = struct {};

    var libp2p_proto_name = "libp2p".*;
    const alpn = MsQuic.QUIC_BUFFER{
        .Length = @sizeOf(@TypeOf(libp2p_proto_name)) - 1,
        .Buffer = @ptrCast([*c]u8, libp2p_proto_name[0..]),
    };

    pub fn init(allocator: Allocator, ping_settings: Settings) !@This() {
        // Workaround a bug in the zig compiler. It loses this symbol.
        var max_mem = workaround.CGroupGetMemoryLimit();
        _ = max_mem;

        const host_key = try crypto.OpenSSLKey.ED25519KeyPair.new();
        var msquic: *MsQuic.QUIC_API_TABLE = undefined;
        const msquic_ptr = @ptrCast([*c]?*const anyopaque, &msquic);
        if (QuicStatus.isError(MsQuic.MsQuicOpenVersion(MsQuic.QUIC_API_VERSION_2, msquic_ptr))) {
            return error.MsQuicOpenFailed;
        }
        errdefer MsQuic.MsQuicClose(msquic);

        const app_name: [:0]const u8 = "ping-protocol-example";
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

        // Configures the server's settings to allow for the peer to open a single
        // bidirectional stream. By default connections are not configured to allow
        // any streams from the peer.
        settings.PeerBidiStreamCount = 128;
        settings.IsSet.flags.PeerBidiStreamCount = true;

        var cred_config = std.mem.zeroes(MsQuic.QUIC_CREDENTIAL_CONFIG);

        var cred_config_helper = CredentialConfigHelper.init(&cred_config);
        // try cred_config_helper.setupCert(host_key);

        var cert_key = try crypto.OpenSSLKey.ED25519KeyPair.new();
        defer cert_key.deinit();

        var x509 = try crypto.X509.init(cert_key, (try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }))[0..]);
        defer x509.deinit();

        var pkcs12 = try crypto.PKCS12.init(cert_key, x509);
        defer pkcs12.deinit();

        cred_config_helper.cred_config.Flags = MsQuic.QUIC_CREDENTIAL_FLAG_NONE;

        const pkcs12_len = try pkcs12.read(cred_config_helper.pkcs12_bytes[0..]);
        const pkcs12_slice = cred_config_helper.pkcs12_bytes[0..pkcs12_len];

        cred_config_helper.cert.Asn1Blob = pkcs12_slice.ptr;
        cred_config_helper.cert.Asn1BlobLength = @intCast(u32, pkcs12_slice.len);
        cred_config_helper.cert.PrivateKeyPassword = "";
        cred_config_helper.cred_config.Type = MsQuic.QUIC_CREDENTIAL_TYPE_CERTIFICATE_PKCS12;
        cred_config_helper.cred_config.QuicCert.CertificatePkcs12 = &cred_config_helper.cert;
        cred_config_helper.cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_USE_PORTABLE_CERTIFICATES;
        cred_config_helper.cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_INDICATE_CERTIFICATE_RECEIVED;
        cred_config_helper.cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_REQUIRE_CLIENT_AUTHENTICATION;

        if (MsQuic.QuicStatus.isError(msquic.ConfigurationOpen.?(registration, &alpn, 1, &settings, @sizeOf(@TypeOf(settings)), null, &configuration))) {
            return error.ConfigurationFailed;
        }
        errdefer msquic.ConfigurationClose.?(configuration);

        const status = msquic.ConfigurationLoadCredential.?(configuration, cred_config_helper.cred_config);
        if (MsQuic.QuicStatus.isError(status)) {
            std.debug.print("Failed to load credential: {}\n", .{status});
            return error.ConfigurationLoadCredentialFailed;
        }

        return Ping{
            .host_key = host_key,
            .allocator = allocator,
            .msquic = msquic,
            .registration = registration,
            .configuration = configuration,
            .settings = ping_settings,
        };
    }
    pub fn deinit(self: *@This()) void {
        defer MsQuic.MsQuicClose(self.msquic);
        defer self.msquic.RegistrationClose.?(self.registration);
        defer self.msquic.ConfigurationClose.?(self.configuration);
    }

    pub fn ping(self: *@This()) !void {
        _ = self;
        // self.start_time = try Instant.now();
        // var conn: MsQuic.HQUIC = undefined;
        // if (QuicStatus.isError(self.msquic.ConnectionOpen.?(self.registration, ThroughputClient.connectionCallback, self, &conn))) {
        //     return error.FailedToOpenConn;
        // }

        // errdefer {
        //     self.msquic.ConnectionShutdown.?(conn, MsQuic.QUIC_CONNECTION_SHUTDOWN_FLAG_NONE, 0);
        // }

        // if (!self.settings.use_send_buffering) {
        //     var settings = std.mem.zeroes(MsQuic.QuicSettings);
        //     settings.bitfields.SendBufferingEnabled = false;
        //     settings.IsSet.flags.SendBufferingEnabled = true;
        //     const status = self.msquic.SetParam.?(conn, MsQuic.QUIC_PARAM_CONN_SETTINGS, @sizeOf(@TypeOf(settings)), &settings);
        //     if (QuicStatus.isError(status)) {
        //         std.debug.print("MsQuic->SetParam (CONN_SETTINGS) failed! {}\n", .{status});
        //         return error.FailedToSetParam;
        //     }
        // }

        // var stream_context = try self.allocator.create(StreamContext);
        // stream_context.* = StreamContext{
        //     .client = self,
        //     .handle = undefined,
        // };
        // errdefer {
        //     self.allocator.destroy(stream_context);
        // }

        // var status = self.msquic.StreamOpen.?(
        //     conn,
        //     MsQuic.QUIC_STREAM_OPEN_FLAG_NONE,
        //     StreamContext.streamCallback,
        //     stream_context,
        //     &stream_context.handle,
        // );

        // if (MsQuic.QuicStatus.isError(status)) {
        //     return error.StreamOpenFailed;
        // }

        // status = self.msquic.StreamStart.?(stream_context.handle, MsQuic.QUIC_STREAM_START_FLAG_NONE);
        // if (MsQuic.QuicStatus.isError(status)) {
        //     return error.StreamStartFailed;
        // }

        // if (self.settings.download_length > 0) {
        //     // Download only, close send side
        //     _ = self.msquic.StreamSend.?(
        //         stream_context.handle,
        //         &self.data_buffer,
        //         1,
        //         MsQuic.QUIC_SEND_FLAG_FIN,
        //         &self.data_buffer,
        //     );
        // } else {
        //     std.debug.assert(self.settings.upload_length > 0);
        //     self.sendQuicData(stream_context);
        // }

        // status = self.msquic.ConnectionStart.?(
        //     conn,
        //     self.configuration,
        //     MsQuic.QUIC_ADDRESS_FAMILY_UNSPEC,
        //     @ptrCast([*c]const u8, self.settings.target),
        //     self.settings.target_port,
        // );
        // if (MsQuic.QuicStatus.isError(status)) {
        //     return error.ConnectionStartFailed;
        // }
    }

    const StreamContext = struct {
        client: *Ping,

        start_time: std.time.Instant,

        fn streamCallback(stream: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_STREAM_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
            const self = @ptrCast(*StreamContext, @alignCast(@alignOf(StreamContext), self_ptr));
            _ = self;
            _ = stream;
            switch (event.*.Type) {
                // MsQuic.QUIC_STREAM_EVENT_RECEIVE => {
                //     stream_context.bytes_completed += event.*.unnamed_0.RECEIVE.TotalBufferLength;
                //     if (stream_context.bytes_completed >= self.settings.download_length) {
                //         stream_context.complete = true;
                //     }
                // },

                // MsQuic.QUIC_STREAM_EVENT_SEND_COMPLETE => {
                //     if (self.settings.upload_length > 0) {
                //         var buf = @ptrCast(*MsQuic.QUIC_BUFFER, @alignCast(@alignOf(MsQuic.QUIC_BUFFER), event.*.unnamed_0.SEND_COMPLETE.ClientContext));
                //         stream_context.outstanding_bytes -= buf.Length;
                //         if (event.*.unnamed_0.SEND_COMPLETE.Canceled == 0) {
                //             // not canceled
                //             stream_context.bytes_completed += buf.Length;
                //             self.sendQuicData(stream_context);
                //         }
                //     }
                // },
                // MsQuic.QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE => {
                //     if (self.settings.upload_length > 0 and
                //         !self.settings.use_send_buffering and
                //         stream_context.ideal_send_buffer < event.*.unnamed_0.IDEAL_SEND_BUFFER_SIZE.ByteCount)
                //     {
                //         stream_context.ideal_send_buffer = event.*.unnamed_0.IDEAL_SEND_BUFFER_SIZE.ByteCount;
                //         self.sendQuicData(stream_context);
                //     }
                // },

                // MsQuic.QUIC_STREAM_EVENT_PEER_SEND_ABORTED, MsQuic.QUIC_STREAM_EVENT_PEER_RECEIVE_ABORTED => {
                //     if (!stream_context.complete) {
                //         std.debug.print("Peer aborted stream\n", .{});
                //     }
                //     _ = self.msquic.StreamShutdown.?(stream, MsQuic.QUIC_STREAM_SHUTDOWN_FLAG_ABORT, 0);
                // },

                // MsQuic.QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE => {
                //     self.onStreamShutdownComplete(stream_context) catch {
                //         @panic("Failed to complete shutdown");
                //     };
                // },

                else => {},
            }

            return 0;
        }
    };

    fn connectionCallback(connection: MsQuic.HQUIC, self_ptr: ?*anyopaque, event: [*c]MsQuic.struct_QUIC_CONNECTION_EVENT) callconv(.C) MsQuic.QUIC_STATUS {
        const self = @ptrCast(*Ping, @alignCast(@alignOf(Ping), self_ptr));
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
};

pub fn main() anyerror!void {
    const allocator = std.heap.c_allocator;
    std.debug.print("\n", .{});
    std.debug.print("Crypto is: {any}\n", .{@typeInfo(@TypeOf(crypto))});
    std.debug.print("Starting ping\n", .{});
    var client = try Ping.init(allocator, .{});
    defer client.deinit();

    try client.ping();
    std.time.sleep(10 * std.time.ns_per_s);
}
