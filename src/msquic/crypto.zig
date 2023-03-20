const std = @import("std");
const log = std.log;
const MsQuic = @import("msquic");
const crypto = @import("../crypto.zig");

pub const CredentialConfigHelper = struct {
    cred_config: *MsQuic.QUIC_CREDENTIAL_CONFIG,
    cert: MsQuic.QUIC_CERTIFICATE_PKCS12 = undefined,
    pkcs12_bytes: [1024]u8 = [_]u8{0} ** 1024,

    pub fn init(cred_config: *MsQuic.QUIC_CREDENTIAL_CONFIG) CredentialConfigHelper {
        return .{ .cred_config = cred_config };
    }

    pub inline fn setupCert(self: *@This(), host_key: crypto.OpenSSLKey.ED25519KeyPair) !void {
        var cert_key = try crypto.OpenSSLKey.ED25519KeyPair.new();
        defer cert_key.deinit();

        var x509 = try crypto.X509.init(cert_key, (try crypto.Libp2pTLSCert.serializeLibp2pExt(.{ .host_key = host_key, .cert_key = cert_key }))[0..]);
        defer x509.deinit();

        var pkcs12 = try crypto.PKCS12.init(cert_key, x509);
        defer pkcs12.deinit();

        self.cred_config.Flags = MsQuic.QUIC_CREDENTIAL_FLAG_NONE;

        const pkcs12_len = try pkcs12.read(self.pkcs12_bytes[0..]);
        const pkcs12_slice = self.pkcs12_bytes[0..pkcs12_len];

        self.cert.Asn1Blob = pkcs12_slice.ptr;
        self.cert.Asn1BlobLength = @intCast(u32, pkcs12_slice.len);
        self.cert.PrivateKeyPassword = "";
        self.cred_config.Type = MsQuic.QUIC_CREDENTIAL_TYPE_CERTIFICATE_PKCS12;
        self.cred_config.QuicCert.CertificatePkcs12 = &self.cert;
        self.cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_USE_PORTABLE_CERTIFICATES;
        self.cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_INDICATE_CERTIFICATE_RECEIVED;
        self.cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_REQUIRE_CLIENT_AUTHENTICATION;
        // We do the cert validation ourselves with https://github.com/libp2p/specs/blob/master/tls/tls.md
        self.cred_config.Flags |= MsQuic.QUIC_CREDENTIAL_FLAG_NO_CERTIFICATE_VALIDATION;
    }
};

pub const PeerCertError = error{ NullPeerCert, FailedToParsePeerCert, FailedToValidate };

pub fn getPeerPubKey(allocator: std.mem.Allocator, certificate: ?*MsQuic.QUIC_CERTIFICATE) PeerCertError!crypto.Key {
    var peer_cert_opaq = certificate orelse {
        return PeerCertError.NullPeerCert;
    };

    var peer_cert_buf = @ptrCast(*MsQuic.QUIC_BUFFER, @alignCast(@alignOf(MsQuic.QUIC_BUFFER), peer_cert_opaq));
    var peer_cert = peer_cert_buf.Buffer[0..peer_cert_buf.Length];
    var peer_x509 = crypto.X509.initFromDer(peer_cert) catch |err| {
        log.err("Failed to parse peer cert: {any}", .{err});
        return PeerCertError.FailedToParsePeerCert;
    };
    defer peer_x509.deinit();

    var peer_pub_key = crypto.Libp2pTLSCert.verify(peer_x509, allocator) catch |err| {
        std.log.debug("Failed to validate conn, closing: {any}\n", .{err});
        return PeerCertError.FailedToValidate;
    };
    return peer_pub_key;
}
