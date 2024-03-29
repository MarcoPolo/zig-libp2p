const std = @import("std");
const builtin = @import("builtin");
const TLS_ERROR_BASE = @import("msquic_wrapper.zig").TLS_ERROR_BASE;
const CERT_ERROR_BASE = @import("msquic_wrapper.zig").CERT_ERROR_BASE;
fn codeAndCodeForMacOS(code: c_uint, code_for_macos: c_uint) c_uint {
    if (builtin.os.tag == .macos) {
        return code_for_macos;
    }
    return code;
}

pub const Success = 0;
pub const Pending = -2;
pub const Continue = -1;
pub const OutOfMemory = 12;
pub const InvalidParameter = 22;
pub const InvalidState = 1;
pub const NotSupported = codeAndCodeForMacOS(95, 102);
pub const NotFound = 2;
pub const BufferTooSmall = codeAndCodeForMacOS(75, 84);
pub const HandshakeFailure = codeAndCodeForMacOS(103, 53);
pub const Aborted = codeAndCodeForMacOS(125, 89);
pub const AddressInUse = codeAndCodeForMacOS(98, 48);
pub const InvalidAddress = codeAndCodeForMacOS(97, 47);
pub const ConnectionTimeout = codeAndCodeForMacOS(110, 60);
pub const ConnectionIdle = codeAndCodeForMacOS(62, 101);
pub const InternalError = 5;
pub const ConnectionRefused = codeAndCodeForMacOS(111, 61);
pub const ProtocolError = codeAndCodeForMacOS(71, 100);
pub const VerNegError = codeAndCodeForMacOS(93, 43);
pub const Unreachable = codeAndCodeForMacOS(113, 65);
pub const TlsError = 126;
pub const UserCanceled = codeAndCodeForMacOS(130, 105);
pub const AlpnNegFailure = codeAndCodeForMacOS(92, 42);
pub const StreamLimitReached = 86;

pub const EventHandlerStatus = enum(c_uint) {
    Success = 0,
    Pending = @bitCast(c_uint, @as(c_int, -2)),
    Continue = @bitCast(c_uint, @as(c_int, -1)),
};

pub const EventHandlerError = error{
    OutOfMemory,
    InvalidParameter,
    InvalidState,
    NotSupported,
    NotFound,
    BufferTooSmall,
    HandshakeFailure,
    Aborted,
    AddressInUse,
    InvalidAddress,
    ConnectionTimeout,
    ConnectionIdle,
    InternalError,
    ConnectionRefused,
    ProtocolError,
    VerNegError,
    Unreachable,
    TlsError,
    UserCanceled,
    AlpnNegFailure,
    StreamLimitReached,
};

pub fn EventHandlerErrorToUint(err: EventHandlerError) c_uint {
    return switch (err) {
        EventHandlerError.OutOfMemory => 12,
        EventHandlerError.InvalidParameter => 22,
        EventHandlerError.InvalidState => 1,
        EventHandlerError.NotSupported => codeAndCodeForMacOS(95, 102),
        EventHandlerError.NotFound => 2,
        EventHandlerError.BufferTooSmall => codeAndCodeForMacOS(75, 84),
        EventHandlerError.HandshakeFailure => codeAndCodeForMacOS(103, 53),
        EventHandlerError.Aborted => codeAndCodeForMacOS(125, 89),
        EventHandlerError.AddressInUse => codeAndCodeForMacOS(98, 48),
        EventHandlerError.InvalidAddress => codeAndCodeForMacOS(97, 47),
        EventHandlerError.ConnectionTimeout => codeAndCodeForMacOS(110, 60),
        EventHandlerError.ConnectionIdle => codeAndCodeForMacOS(62, 101),
        EventHandlerError.InternalError => 5,
        EventHandlerError.ConnectionRefused => codeAndCodeForMacOS(111, 61),
        EventHandlerError.ProtocolError => codeAndCodeForMacOS(71, 100),
        EventHandlerError.VerNegError => codeAndCodeForMacOS(93, 43),
        EventHandlerError.Unreachable => codeAndCodeForMacOS(113, 65),
        EventHandlerError.TlsError => 126,
        EventHandlerError.UserCanceled => codeAndCodeForMacOS(130, 105),
        EventHandlerError.AlpnNegFailure => codeAndCodeForMacOS(92, 42),
        EventHandlerError.StreamLimitReached => 86,
    };
}

pub fn UintToEventHandlerError(err: c_uint) EventHandlerError {
    return switch (err) {
        12 => EventHandlerError.OutOfMemory,
        22 => EventHandlerError.InvalidParameter,
        1 => EventHandlerError.InvalidState,
        codeAndCodeForMacOS(95, 102) => EventHandlerError.NotSupported,
        2 => EventHandlerError.NotFound,
        codeAndCodeForMacOS(75, 84) => EventHandlerError.BufferTooSmall,
        codeAndCodeForMacOS(103, 53) => EventHandlerError.HandshakeFailure,
        codeAndCodeForMacOS(125, 89) => EventHandlerError.Aborted,
        codeAndCodeForMacOS(98, 48) => EventHandlerError.AddressInUse,
        codeAndCodeForMacOS(97, 47) => EventHandlerError.InvalidAddress,
        codeAndCodeForMacOS(110, 60) => EventHandlerError.ConnectionTimeout,
        codeAndCodeForMacOS(62, 101) => EventHandlerError.ConnectionIdle,
        5 => EventHandlerError.InternalError,
        codeAndCodeForMacOS(111, 61) => EventHandlerError.ConnectionRefused,
        codeAndCodeForMacOS(71, 100) => EventHandlerError.ProtocolError,
        codeAndCodeForMacOS(93, 43) => EventHandlerError.VerNegError,
        codeAndCodeForMacOS(113, 65) => EventHandlerError.Unreachable,
        126 => EventHandlerError.TlsError,
        codeAndCodeForMacOS(130, 105) => EventHandlerError.UserCanceled,
        codeAndCodeForMacOS(92, 42) => EventHandlerError.AlpnNegFailure,
        86 => EventHandlerError.StreamLimitReached,
        else => {
            @panic("Invalid error code");
        },
    };
}

fn tlsAlert(alert: c_uint) c_uint {
    return (0xff & alert) + TLS_ERROR_BASE;
} //       ((QUIC_STATUS)(0xff & Alert) + TLS_ERROR_BASE)

const CloseNotify = tlsAlert(0); // 0xBEBC300 - Close notify
const BadCertificate = tlsAlert(42); // 0xBEBC32A - Bad Certificate
const UnsupportedCertificate = tlsAlert(43); // 0xBEBC32B - Unsupported Certficiate
const RevokedCertificate = tlsAlert(44); // 0xBEBC32C - Revoked Certificate
const ExpiredCertificate = tlsAlert(45); // 0xBEBC32D - Expired Certificate
const UnknownCertificate = tlsAlert(46); // 0xBEBC32E - Unknown Certificate
const RequiredCertificate = tlsAlert(116); // 0xBEBC374 - Required Certificate

fn certError(v: c_uint) c_uint {
    return v + CERT_ERROR_BASE;
} // #define QUIC_STATUS_CERT_ERROR(Val)         ((QUIC_STATUS)Val + CERT_ERROR_BASE)

const Expired = certError(1); // 0xBEBC401
const UntrustedRoot = certError(2); // 0xBEBC402

// foo: c_uint,

pub inline fn isError(status: c_uint) bool {
    const s = @bitCast(c_int, status);
    if (s > 0) {
        return true;
    }
    return false;
}
