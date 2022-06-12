pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const int_least8_t = i8;
pub const int_least16_t = i16;
pub const int_least32_t = i32;
pub const int_least64_t = i64;
pub const uint_least8_t = u8;
pub const uint_least16_t = u16;
pub const uint_least32_t = u32;
pub const uint_least64_t = u64;
pub const int_fast8_t = i8;
pub const int_fast16_t = i16;
pub const int_fast32_t = i32;
pub const int_fast64_t = i64;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = u16;
pub const uint_fast32_t = u32;
pub const uint_fast64_t = u64;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_longlong;
pub const __uint64_t = c_ulonglong;
pub const __darwin_intptr_t = c_long;
pub const __darwin_natural_t = c_uint;
pub const __darwin_ct_rune_t = c_int;
pub const __mbstate_t = extern union {
    __mbstate8: [128]u8,
    _mbstateL: c_longlong,
};
pub const __darwin_mbstate_t = __mbstate_t;
pub const __darwin_ptrdiff_t = c_long;
pub const __darwin_size_t = c_ulong;
pub const __builtin_va_list = [*c]u8;
pub const __darwin_va_list = __builtin_va_list;
pub const __darwin_wchar_t = c_int;
pub const __darwin_rune_t = __darwin_wchar_t;
pub const __darwin_wint_t = c_int;
pub const __darwin_clock_t = c_ulong;
pub const __darwin_socklen_t = __uint32_t;
pub const __darwin_ssize_t = c_long;
pub const __darwin_time_t = c_long;
pub const __darwin_blkcnt_t = __int64_t;
pub const __darwin_blksize_t = __int32_t;
pub const __darwin_dev_t = __int32_t;
pub const __darwin_fsblkcnt_t = c_uint;
pub const __darwin_fsfilcnt_t = c_uint;
pub const __darwin_gid_t = __uint32_t;
pub const __darwin_id_t = __uint32_t;
pub const __darwin_ino64_t = __uint64_t;
pub const __darwin_ino_t = __darwin_ino64_t;
pub const __darwin_mach_port_name_t = __darwin_natural_t;
pub const __darwin_mach_port_t = __darwin_mach_port_name_t;
pub const __darwin_mode_t = __uint16_t;
pub const __darwin_off_t = __int64_t;
pub const __darwin_pid_t = __int32_t;
pub const __darwin_sigset_t = __uint32_t;
pub const __darwin_suseconds_t = __int32_t;
pub const __darwin_uid_t = __uint32_t;
pub const __darwin_useconds_t = __uint32_t;
pub const __darwin_uuid_t = [16]u8;
pub const __darwin_uuid_string_t = [37]u8;
pub const struct___darwin_pthread_handler_rec = extern struct {
    __routine: ?fn (?*anyopaque) callconv(.C) void,
    __arg: ?*anyopaque,
    __next: [*c]struct___darwin_pthread_handler_rec,
};
pub const struct__opaque_pthread_attr_t = extern struct {
    __sig: c_long,
    __opaque: [56]u8,
};
pub const struct__opaque_pthread_cond_t = extern struct {
    __sig: c_long,
    __opaque: [40]u8,
};
pub const struct__opaque_pthread_condattr_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_mutex_t = extern struct {
    __sig: c_long,
    __opaque: [56]u8,
};
pub const struct__opaque_pthread_mutexattr_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_once_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_rwlock_t = extern struct {
    __sig: c_long,
    __opaque: [192]u8,
};
pub const struct__opaque_pthread_rwlockattr_t = extern struct {
    __sig: c_long,
    __opaque: [16]u8,
};
pub const struct__opaque_pthread_t = extern struct {
    __sig: c_long,
    __cleanup_stack: [*c]struct___darwin_pthread_handler_rec,
    __opaque: [8176]u8,
};
pub const __darwin_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const __darwin_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const __darwin_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const __darwin_pthread_key_t = c_ulong;
pub const __darwin_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const __darwin_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const __darwin_pthread_once_t = struct__opaque_pthread_once_t;
pub const __darwin_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const __darwin_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const __darwin_pthread_t = [*c]struct__opaque_pthread_t;
pub const u_int8_t = u8;
pub const u_int16_t = c_ushort;
pub const u_int32_t = c_uint;
pub const u_int64_t = c_ulonglong;
pub const register_t = i64;
pub const user_addr_t = u_int64_t;
pub const user_size_t = u_int64_t;
pub const user_ssize_t = i64;
pub const user_long_t = i64;
pub const user_ulong_t = u_int64_t;
pub const user_time_t = i64;
pub const user_off_t = i64;
pub const syscall_arg_t = u_int64_t;
pub const intmax_t = c_long;
pub const uintmax_t = c_ulong;
pub const __darwin_nl_item = c_int;
pub const __darwin_wctrans_t = c_int;
pub const __darwin_wctype_t = __uint32_t;
pub extern fn memchr(__s: ?*const anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn memcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: c_ulong) c_int;
pub extern fn memcpy(__dst: ?*anyopaque, __src: ?*const anyopaque, __n: c_ulong) ?*anyopaque;
pub extern fn memmove(__dst: ?*anyopaque, __src: ?*const anyopaque, __len: c_ulong) ?*anyopaque;
pub extern fn memset(__b: ?*anyopaque, __c: c_int, __len: c_ulong) ?*anyopaque;
pub extern fn strcat(__s1: [*c]u8, __s2: [*c]const u8) [*c]u8;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strcoll(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strcpy(__dst: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn strcspn(__s: [*c]const u8, __charset: [*c]const u8) c_ulong;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn strlen(__s: [*c]const u8) c_ulong;
pub extern fn strncat(__s1: [*c]u8, __s2: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strncmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: c_ulong) c_int;
pub extern fn strncpy(__dst: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strpbrk(__s: [*c]const u8, __charset: [*c]const u8) [*c]u8;
pub extern fn strrchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strspn(__s: [*c]const u8, __charset: [*c]const u8) c_ulong;
pub extern fn strstr(__big: [*c]const u8, __little: [*c]const u8) [*c]u8;
pub extern fn strtok(__str: [*c]u8, __sep: [*c]const u8) [*c]u8;
pub extern fn strxfrm(__s1: [*c]u8, __s2: [*c]const u8, __n: c_ulong) c_ulong;
pub extern fn strtok_r(__str: [*c]u8, __sep: [*c]const u8, __lasts: [*c][*c]u8) [*c]u8;
pub extern fn strerror_r(__errnum: c_int, __strerrbuf: [*c]u8, __buflen: usize) c_int;
pub extern fn strdup(__s1: [*c]const u8) [*c]u8;
pub extern fn memccpy(__dst: ?*anyopaque, __src: ?*const anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn stpcpy(__dst: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn stpncpy(__dst: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strndup(__s1: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strnlen(__s1: [*c]const u8, __n: usize) usize;
pub extern fn strsignal(__sig: c_int) [*c]u8;
pub const rsize_t = __darwin_size_t;
pub const errno_t = c_int;
pub extern fn memset_s(__s: ?*anyopaque, __smax: rsize_t, __c: c_int, __n: rsize_t) errno_t;
pub extern fn memmem(__big: ?*const anyopaque, __big_len: usize, __little: ?*const anyopaque, __little_len: usize) ?*anyopaque;
pub extern fn memset_pattern4(__b: ?*anyopaque, __pattern4: ?*const anyopaque, __len: usize) void;
pub extern fn memset_pattern8(__b: ?*anyopaque, __pattern8: ?*const anyopaque, __len: usize) void;
pub extern fn memset_pattern16(__b: ?*anyopaque, __pattern16: ?*const anyopaque, __len: usize) void;
pub extern fn strcasestr(__big: [*c]const u8, __little: [*c]const u8) [*c]u8;
pub extern fn strnstr(__big: [*c]const u8, __little: [*c]const u8, __len: usize) [*c]u8;
pub extern fn strlcat(__dst: [*c]u8, __source: [*c]const u8, __size: c_ulong) c_ulong;
pub extern fn strlcpy(__dst: [*c]u8, __source: [*c]const u8, __size: c_ulong) c_ulong;
pub extern fn strmode(__mode: c_int, __bp: [*c]u8) void;
pub extern fn strsep(__stringp: [*c][*c]u8, __delim: [*c]const u8) [*c]u8;
pub extern fn swab(noalias ?*const anyopaque, noalias ?*anyopaque, isize) void;
pub extern fn timingsafe_bcmp(__b1: ?*const anyopaque, __b2: ?*const anyopaque, __len: usize) c_int;
pub extern fn strsignal_r(__sig: c_int, __strsignalbuf: [*c]u8, __buflen: usize) c_int;
pub extern fn bcmp(?*const anyopaque, ?*const anyopaque, c_ulong) c_int;
pub extern fn bcopy(?*const anyopaque, ?*anyopaque, usize) void;
pub extern fn bzero(?*anyopaque, c_ulong) void;
pub extern fn index([*c]const u8, c_int) [*c]u8;
pub extern fn rindex([*c]const u8, c_int) [*c]u8;
pub extern fn ffs(c_int) c_int;
pub extern fn strcasecmp([*c]const u8, [*c]const u8) c_int;
pub extern fn strncasecmp([*c]const u8, [*c]const u8, c_ulong) c_int;
pub extern fn ffsl(c_long) c_int;
pub extern fn ffsll(c_longlong) c_int;
pub extern fn fls(c_int) c_int;
pub extern fn flsl(c_long) c_int;
pub extern fn flsll(c_longlong) c_int;
pub const struct_pbtools_heap_t = extern struct {
    buf_p: [*c]u8,
    size: c_int,
    pos: c_int,
};
pub const struct_pbtools_encoder_t = extern struct {
    buf_p: [*c]u8,
    size: c_int,
    pos: c_int,
};
pub const struct_pbtools_decoder_t = extern struct {
    buf_p: [*c]const u8,
    size: c_int,
    pos: c_int,
    heap_p: [*c]struct_pbtools_heap_t,
};
pub const struct_pbtools_repeated_info_t = extern struct {
    decoder: struct_pbtools_decoder_t,
    length: c_int,
    tag: c_int,
    wire_type: c_int,
};
pub const struct_pbtools_bytes_t = extern struct {
    buf_p: [*c]u8,
    size: usize,
};
pub const struct_pbtools_message_base_t = extern struct {
    heap_p: [*c]struct_pbtools_heap_t,
};
pub const struct_pbtools_repeated_int32_t = extern struct {
    length: c_int,
    items_p: [*c]i32,
};
pub const struct_pbtools_repeated_int64_t = extern struct {
    length: c_int,
    items_p: [*c]i64,
};
pub const struct_pbtools_repeated_uint32_t = extern struct {
    length: c_int,
    items_p: [*c]u32,
};
pub const struct_pbtools_repeated_uint64_t = extern struct {
    length: c_int,
    items_p: [*c]u64,
};
pub const struct_pbtools_repeated_float_t = extern struct {
    length: c_int,
    items_p: [*c]f32,
};
pub const struct_pbtools_repeated_double_t = extern struct {
    length: c_int,
    items_p: [*c]f64,
};
pub const struct_pbtools_repeated_bool_t = extern struct {
    length: c_int,
    items_p: [*c]bool,
};
pub const struct_pbtools_repeated_string_t = extern struct {
    length: c_int,
    items_pp: [*c][*c]u8,
};
pub const struct_pbtools_repeated_bytes_t = extern struct {
    length: c_int,
    items_p: [*c]struct_pbtools_bytes_t,
};
pub const struct_pbtools_repeated_message_t = extern struct {
    length: c_int,
    items_p: ?*anyopaque,
};
pub const pbtools_message_init_t = ?fn (?*anyopaque, [*c]struct_pbtools_heap_t) callconv(.C) void;
pub const pbtools_message_encode_inner_t = ?fn ([*c]struct_pbtools_encoder_t, ?*anyopaque) callconv(.C) void;
pub const pbtools_message_decode_inner_t = ?fn ([*c]struct_pbtools_decoder_t, ?*anyopaque) callconv(.C) void;
pub extern fn pbtools_encoder_write_int32(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i32) void;
pub extern fn pbtools_encoder_write_int64(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i64) void;
pub extern fn pbtools_encoder_write_sint32(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i32) void;
pub extern fn pbtools_encoder_write_sint64(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i64) void;
pub extern fn pbtools_encoder_write_uint32(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: u32) void;
pub extern fn pbtools_encoder_write_uint64(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: u64) void;
pub extern fn pbtools_encoder_write_fixed32(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: u32) void;
pub extern fn pbtools_encoder_write_fixed64(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: u64) void;
pub extern fn pbtools_encoder_write_sfixed32(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i32) void;
pub extern fn pbtools_encoder_write_sfixed64(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i64) void;
pub extern fn pbtools_encoder_write_float(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: f32) void;
pub extern fn pbtools_encoder_write_double(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: f64) void;
pub extern fn pbtools_encoder_write_bool(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: bool) void;
pub extern fn pbtools_encoder_write_enum(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: c_int) void;
pub extern fn pbtools_encoder_write_string(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value_p: [*c]u8) void;
pub extern fn pbtools_encoder_write_bytes(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value_p: [*c]struct_pbtools_bytes_t) void;
pub extern fn pbtools_encoder_write_int32_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i32) void;
pub extern fn pbtools_encoder_write_int64_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i64) void;
pub extern fn pbtools_encoder_write_sint32_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i32) void;
pub extern fn pbtools_encoder_write_sint64_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i64) void;
pub extern fn pbtools_encoder_write_uint32_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: u32) void;
pub extern fn pbtools_encoder_write_uint64_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: u64) void;
pub extern fn pbtools_encoder_write_fixed32_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: u32) void;
pub extern fn pbtools_encoder_write_fixed64_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: u64) void;
pub extern fn pbtools_encoder_write_sfixed32_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i32) void;
pub extern fn pbtools_encoder_write_sfixed64_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: i64) void;
pub extern fn pbtools_encoder_write_float_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: f32) void;
pub extern fn pbtools_encoder_write_double_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: f64) void;
pub extern fn pbtools_encoder_write_bool_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: bool) void;
pub extern fn pbtools_encoder_write_enum_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value: c_int) void;
pub extern fn pbtools_encoder_write_string_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value_p: [*c]u8) void;
pub extern fn pbtools_encoder_write_bytes_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, value_p: [*c]struct_pbtools_bytes_t) void;
pub extern fn pbtools_encoder_write_repeated_int32(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_int32_t) void;
pub extern fn pbtools_encoder_write_repeated_int64(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_int64_t) void;
pub extern fn pbtools_encoder_write_repeated_sint32(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_int32_t) void;
pub extern fn pbtools_encoder_write_repeated_sint64(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_int64_t) void;
pub extern fn pbtools_encoder_write_repeated_uint32(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_uint32_t) void;
pub extern fn pbtools_encoder_write_repeated_uint64(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_uint64_t) void;
pub extern fn pbtools_encoder_write_repeated_fixed32(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_uint32_t) void;
pub extern fn pbtools_encoder_write_repeated_fixed64(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_uint64_t) void;
pub extern fn pbtools_encoder_write_repeated_sfixed32(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_int32_t) void;
pub extern fn pbtools_encoder_write_repeated_sfixed64(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_int64_t) void;
pub extern fn pbtools_encoder_write_repeated_float(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_float_t) void;
pub extern fn pbtools_encoder_write_repeated_double(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_double_t) void;
pub extern fn pbtools_encoder_write_repeated_bool(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_bool_t) void;
pub extern fn pbtools_encoder_write_repeated_string(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_string_t) void;
pub extern fn pbtools_encoder_write_repeated_bytes(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_bytes_t) void;
pub extern fn pbtools_decoder_available(self_p: [*c]struct_pbtools_decoder_t) bool;
pub extern fn pbtools_decoder_read_tag(self_p: [*c]struct_pbtools_decoder_t, wire_type_p: [*c]c_int) c_int;
pub extern fn pbtools_decoder_read_int32(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) i32;
pub extern fn pbtools_decoder_read_int64(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) i64;
pub extern fn pbtools_decoder_read_sint32(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) i32;
pub extern fn pbtools_decoder_read_sint64(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) i64;
pub extern fn pbtools_decoder_read_uint32(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) u32;
pub extern fn pbtools_decoder_read_uint64(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) u64;
pub extern fn pbtools_decoder_read_fixed32(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) u32;
pub extern fn pbtools_decoder_read_fixed64(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) u64;
pub extern fn pbtools_decoder_read_sfixed32(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) i32;
pub extern fn pbtools_decoder_read_sfixed64(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) i64;
pub extern fn pbtools_decoder_read_float(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) f32;
pub extern fn pbtools_decoder_read_double(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) f64;
pub extern fn pbtools_decoder_read_bool(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) bool;
pub extern fn pbtools_decoder_read_enum(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) c_int;
pub extern fn pbtools_decoder_read_string(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int, value_pp: [*c][*c]u8) void;
pub extern fn pbtools_decoder_read_bytes(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int, bytes_p: [*c]struct_pbtools_bytes_t) void;
pub extern fn pbtools_alloc_repeated_int32(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_int32_t) c_int;
pub extern fn pbtools_repeated_info_decode_int32(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_int32(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_int32_t) void;
pub extern fn pbtools_alloc_repeated_int64(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_int64_t) c_int;
pub extern fn pbtools_repeated_info_decode_int64(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_int64(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_int64_t) void;
pub extern fn pbtools_alloc_repeated_uint32(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_uint32_t) c_int;
pub extern fn pbtools_repeated_info_decode_uint32(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_uint32(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_uint32_t) void;
pub extern fn pbtools_alloc_repeated_uint64(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_uint64_t) c_int;
pub extern fn pbtools_repeated_info_decode_uint64(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_uint64(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_uint64_t) void;
pub extern fn pbtools_alloc_repeated_sint32(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_int32_t) c_int;
pub extern fn pbtools_repeated_info_decode_sint32(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_sint32(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_int32_t) void;
pub extern fn pbtools_alloc_repeated_sint64(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_int64_t) c_int;
pub extern fn pbtools_repeated_info_decode_sint64(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_sint64(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_int64_t) void;
pub extern fn pbtools_alloc_repeated_fixed32(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_uint32_t) c_int;
pub extern fn pbtools_repeated_info_decode_fixed32(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_fixed32(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_uint32_t) void;
pub extern fn pbtools_alloc_repeated_fixed64(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_uint64_t) c_int;
pub extern fn pbtools_repeated_info_decode_fixed64(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_fixed64(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_uint64_t) void;
pub extern fn pbtools_alloc_repeated_sfixed32(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_int32_t) c_int;
pub extern fn pbtools_repeated_info_decode_sfixed32(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_sfixed32(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_int32_t) void;
pub extern fn pbtools_alloc_repeated_sfixed64(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_int64_t) c_int;
pub extern fn pbtools_repeated_info_decode_sfixed64(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_sfixed64(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_int64_t) void;
pub extern fn pbtools_alloc_repeated_float(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_float_t) c_int;
pub extern fn pbtools_repeated_info_decode_float(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_float(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_float_t) void;
pub extern fn pbtools_alloc_repeated_double(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_double_t) c_int;
pub extern fn pbtools_repeated_info_decode_double(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_double(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_double_t) void;
pub extern fn pbtools_alloc_repeated_bool(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_bool_t) c_int;
pub extern fn pbtools_repeated_info_decode_bool(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_bool(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_bool_t) void;
pub extern fn pbtools_alloc_repeated_string(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_string_t) c_int;
pub extern fn pbtools_repeated_info_decode_string(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_string(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_string_t) void;
pub extern fn pbtools_alloc_repeated_bytes(self_p: [*c]struct_pbtools_message_base_t, length: c_int, repeated_p: [*c]struct_pbtools_repeated_bytes_t) c_int;
pub extern fn pbtools_repeated_info_decode_bytes(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_decoder_decode_repeated_bytes(self_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_bytes_t) void;
pub extern fn pbtools_decoder_skip_field(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_bytes_init(self_p: [*c]struct_pbtools_bytes_t) void;
pub extern fn pbtools_message_new(workspace_p: ?*anyopaque, size: usize, message_size: usize, message_init: pbtools_message_init_t) ?*anyopaque;
pub extern fn pbtools_message_encode(self_p: [*c]struct_pbtools_message_base_t, encoded_p: [*c]u8, size: usize, message_encode_inner: pbtools_message_encode_inner_t) c_int;
pub extern fn pbtools_message_decode(self_p: [*c]struct_pbtools_message_base_t, encoded_p: [*c]const u8, size: usize, message_decode_inner: pbtools_message_decode_inner_t) c_int;
pub extern fn pbtools_sub_message_alloc(message_pp: [*c][*c]struct_pbtools_message_base_t, heap_p: [*c]struct_pbtools_heap_t, sub_message_size: usize, message_init: pbtools_message_init_t) c_int;
pub extern fn pbtools_alloc_repeated(repeated_p: [*c]struct_pbtools_repeated_message_t, length: c_int, heap_p: [*c]struct_pbtools_heap_t, item_size: usize, message_init: pbtools_message_init_t) c_int;
pub extern fn pbtools_encode_repeated_inner(encoder_p: [*c]struct_pbtools_encoder_t, field_number: c_int, repeated_p: [*c]struct_pbtools_repeated_message_t, item_size: usize, message_encode_inner: pbtools_message_encode_inner_t) void;
pub extern fn pbtools_decode_repeated_inner(decoder_p: [*c]struct_pbtools_decoder_t, repeated_info_p: [*c]struct_pbtools_repeated_info_t, repeated_p: [*c]struct_pbtools_repeated_message_t, item_size: usize, message_init: pbtools_message_init_t, message_decode_inner: pbtools_message_decode_inner_t) void;
pub extern fn pbtools_encoder_sub_message_encode(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, message_p: [*c]struct_pbtools_message_base_t, encode_inner: pbtools_message_encode_inner_t) void;
pub extern fn pbtools_encoder_sub_message_encode_always(self_p: [*c]struct_pbtools_encoder_t, field_number: c_int, message_p: [*c]struct_pbtools_message_base_t, encode_inner: pbtools_message_encode_inner_t) void;
pub extern fn pbtools_decoder_sub_message_decode(self_p: [*c]struct_pbtools_decoder_t, wire_type: c_int, message_pp: [*c][*c]struct_pbtools_message_base_t, sub_message_size: usize, message_init: pbtools_message_init_t, decode_inner: pbtools_message_decode_inner_t) void;
pub extern fn pbtools_error_code_to_string(code: c_int) [*c]const u8;
pub extern fn pbtools_repeated_info_init(self_p: [*c]struct_pbtools_repeated_info_t, tag: c_int) void;
pub extern fn pbtools_repeated_info_decode(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_repeated_numeric_scalar_info_decode(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub extern fn pbtools_repeated_varint_info_decode(self_p: [*c]struct_pbtools_repeated_info_t, decoder_p: [*c]struct_pbtools_decoder_t, wire_type: c_int) void;
pub const address_book_person_phone_type_mobile_e: c_int = 0;
pub const address_book_person_phone_type_home_e: c_int = 1;
pub const address_book_person_phone_type_work_e: c_int = 2;
pub const enum_address_book_person_phone_type_e = c_uint;
pub const struct_address_book_person_phone_number_t = extern struct {
    base: struct_pbtools_message_base_t,
    number_p: [*c]u8,
    type: enum_address_book_person_phone_type_e,
};
pub const struct_address_book_person_phone_number_repeated_t = extern struct {
    length: c_int,
    items_p: [*c]struct_address_book_person_phone_number_t,
};
pub const struct_address_book_person_t = extern struct {
    base: struct_pbtools_message_base_t,
    name_p: [*c]u8,
    id: i32,
    email_p: [*c]u8,
    phones: struct_address_book_person_phone_number_repeated_t,
};
pub const struct_address_book_person_repeated_t = extern struct {
    length: c_int,
    items_p: [*c]struct_address_book_person_t,
};
pub const struct_address_book_address_book_t = extern struct {
    base: struct_pbtools_message_base_t,
    people: struct_address_book_person_repeated_t,
};
pub const struct_address_book_address_book_repeated_t = extern struct {
    length: c_int,
    items_p: [*c]struct_address_book_address_book_t,
};
pub export fn address_book_person_phones_alloc(arg_self_p: [*c]struct_address_book_person_t, arg_length: c_int) c_int {
    var self_p = arg_self_p;
    var length = arg_length;
    return pbtools_alloc_repeated(@ptrCast([*c]struct_pbtools_repeated_message_t, @alignCast(@import("std").meta.alignment(struct_pbtools_repeated_message_t), &self_p.*.phones)), length, self_p.*.base.heap_p, @sizeOf(struct_address_book_person_phone_number_t), @ptrCast(pbtools_message_init_t, @alignCast(@import("std").meta.alignment(fn (?*anyopaque, [*c]struct_pbtools_heap_t) callconv(.C) void), address_book_person_phone_number_init)));
}
pub export fn address_book_person_new(arg_workspace_p: ?*anyopaque, arg_size: usize) [*c]struct_address_book_person_t {
    var workspace_p = arg_workspace_p;
    var size = arg_size;
    return @ptrCast([*c]struct_address_book_person_t, @alignCast(@import("std").meta.alignment(struct_address_book_person_t), pbtools_message_new(workspace_p, size, @sizeOf(struct_address_book_person_t), @ptrCast(pbtools_message_init_t, @alignCast(@import("std").meta.alignment(fn (?*anyopaque, [*c]struct_pbtools_heap_t) callconv(.C) void), address_book_person_init)))));
}
pub export fn address_book_person_encode(arg_self_p: [*c]struct_address_book_person_t, arg_encoded_p: [*c]u8, arg_size: usize) c_int {
    var self_p = arg_self_p;
    var encoded_p = arg_encoded_p;
    var size = arg_size;
    return pbtools_message_encode(&self_p.*.base, encoded_p, size, @ptrCast(pbtools_message_encode_inner_t, @alignCast(@import("std").meta.alignment(fn ([*c]struct_pbtools_encoder_t, ?*anyopaque) callconv(.C) void), address_book_person_encode_inner)));
}
pub export fn address_book_person_decode(arg_self_p: [*c]struct_address_book_person_t, arg_encoded_p: [*c]const u8, arg_size: usize) c_int {
    var self_p = arg_self_p;
    var encoded_p = arg_encoded_p;
    var size = arg_size;
    return pbtools_message_decode(&self_p.*.base, encoded_p, size, @ptrCast(pbtools_message_decode_inner_t, @alignCast(@import("std").meta.alignment(fn ([*c]struct_pbtools_decoder_t, ?*anyopaque) callconv(.C) void), address_book_person_decode_inner)));
}
pub export fn address_book_address_book_people_alloc(arg_self_p: [*c]struct_address_book_address_book_t, arg_length: c_int) c_int {
    var self_p = arg_self_p;
    var length = arg_length;
    return pbtools_alloc_repeated(@ptrCast([*c]struct_pbtools_repeated_message_t, @alignCast(@import("std").meta.alignment(struct_pbtools_repeated_message_t), &self_p.*.people)), length, self_p.*.base.heap_p, @sizeOf(struct_address_book_person_t), @ptrCast(pbtools_message_init_t, @alignCast(@import("std").meta.alignment(fn (?*anyopaque, [*c]struct_pbtools_heap_t) callconv(.C) void), address_book_person_init)));
}
pub export fn address_book_address_book_new(arg_workspace_p: ?*anyopaque, arg_size: usize) [*c]struct_address_book_address_book_t {
    var workspace_p = arg_workspace_p;
    var size = arg_size;
    return @ptrCast([*c]struct_address_book_address_book_t, @alignCast(@import("std").meta.alignment(struct_address_book_address_book_t), pbtools_message_new(workspace_p, size, @sizeOf(struct_address_book_address_book_t), @ptrCast(pbtools_message_init_t, @alignCast(@import("std").meta.alignment(fn (?*anyopaque, [*c]struct_pbtools_heap_t) callconv(.C) void), address_book_address_book_init)))));
}
pub export fn address_book_address_book_encode(arg_self_p: [*c]struct_address_book_address_book_t, arg_encoded_p: [*c]u8, arg_size: usize) c_int {
    var self_p = arg_self_p;
    var encoded_p = arg_encoded_p;
    var size = arg_size;
    return pbtools_message_encode(&self_p.*.base, encoded_p, size, @ptrCast(pbtools_message_encode_inner_t, @alignCast(@import("std").meta.alignment(fn ([*c]struct_pbtools_encoder_t, ?*anyopaque) callconv(.C) void), address_book_address_book_encode_inner)));
}
pub export fn address_book_address_book_decode(arg_self_p: [*c]struct_address_book_address_book_t, arg_encoded_p: [*c]const u8, arg_size: usize) c_int {
    var self_p = arg_self_p;
    var encoded_p = arg_encoded_p;
    var size = arg_size;
    return pbtools_message_decode(&self_p.*.base, encoded_p, size, @ptrCast(pbtools_message_decode_inner_t, @alignCast(@import("std").meta.alignment(fn ([*c]struct_pbtools_decoder_t, ?*anyopaque) callconv(.C) void), address_book_address_book_decode_inner)));
}
pub export fn address_book_person_init(arg_self_p: [*c]struct_address_book_person_t, arg_heap_p: [*c]struct_pbtools_heap_t) void {
    var self_p = arg_self_p;
    var heap_p = arg_heap_p;
    self_p.*.base.heap_p = heap_p;
    // self_p.*.name_p = "";
    self_p.*.id = 0;
    // self_p.*.email_p = "";
    self_p.*.phones.length = 0;
}
pub export fn address_book_person_encode_inner(arg_encoder_p: [*c]struct_pbtools_encoder_t, arg_self_p: [*c]struct_address_book_person_t) void {
    var encoder_p = arg_encoder_p;
    var self_p = arg_self_p;
    address_book_person_phone_number_encode_repeated_inner(encoder_p, @as(c_int, 4), &self_p.*.phones);
    pbtools_encoder_write_string(encoder_p, @as(c_int, 3), self_p.*.email_p);
    pbtools_encoder_write_int32(encoder_p, @as(c_int, 2), self_p.*.id);
    pbtools_encoder_write_string(encoder_p, @as(c_int, 1), self_p.*.name_p);
}
pub export fn address_book_person_decode_inner(arg_decoder_p: [*c]struct_pbtools_decoder_t, arg_self_p: [*c]struct_address_book_person_t) void {
    var decoder_p = arg_decoder_p;
    var self_p = arg_self_p;
    var wire_type: c_int = undefined;
    var repeated_info_phones: struct_pbtools_repeated_info_t = undefined;
    pbtools_repeated_info_init(&repeated_info_phones, @as(c_int, 4));
    while (pbtools_decoder_available(decoder_p)) {
        while (true) {
            switch (pbtools_decoder_read_tag(decoder_p, &wire_type)) {
                @as(c_int, 1) => {
                    pbtools_decoder_read_string(decoder_p, wire_type, &self_p.*.name_p);
                    break;
                },
                @as(c_int, 2) => {
                    self_p.*.id = pbtools_decoder_read_int32(decoder_p, wire_type);
                    break;
                },
                @as(c_int, 3) => {
                    pbtools_decoder_read_string(decoder_p, wire_type, &self_p.*.email_p);
                    break;
                },
                @as(c_int, 4) => {
                    pbtools_repeated_info_decode(&repeated_info_phones, decoder_p, wire_type);
                    break;
                },
                else => {
                    pbtools_decoder_skip_field(decoder_p, wire_type);
                    break;
                },
            }
            break;
        }
    }
    address_book_person_phone_number_decode_repeated_inner(decoder_p, &repeated_info_phones, &self_p.*.phones);
}
pub export fn address_book_person_encode_repeated_inner(arg_encoder_p: [*c]struct_pbtools_encoder_t, arg_field_number: c_int, arg_repeated_p: [*c]struct_address_book_person_repeated_t) void {
    var encoder_p = arg_encoder_p;
    var field_number = arg_field_number;
    var repeated_p = arg_repeated_p;
    pbtools_encode_repeated_inner(encoder_p, field_number, @ptrCast([*c]struct_pbtools_repeated_message_t, @alignCast(@import("std").meta.alignment(struct_pbtools_repeated_message_t), repeated_p)), @sizeOf(struct_address_book_person_t), @ptrCast(pbtools_message_encode_inner_t, @alignCast(@import("std").meta.alignment(fn ([*c]struct_pbtools_encoder_t, ?*anyopaque) callconv(.C) void), address_book_person_encode_inner)));
}
pub export fn address_book_person_decode_repeated_inner(arg_decoder_p: [*c]struct_pbtools_decoder_t, arg_repeated_info_p: [*c]struct_pbtools_repeated_info_t, arg_repeated_p: [*c]struct_address_book_person_repeated_t) void {
    var decoder_p = arg_decoder_p;
    var repeated_info_p = arg_repeated_info_p;
    var repeated_p = arg_repeated_p;
    pbtools_decode_repeated_inner(decoder_p, repeated_info_p, @ptrCast([*c]struct_pbtools_repeated_message_t, @alignCast(@import("std").meta.alignment(struct_pbtools_repeated_message_t), repeated_p)), @sizeOf(struct_address_book_person_t), @ptrCast(pbtools_message_init_t, @alignCast(@import("std").meta.alignment(fn (?*anyopaque, [*c]struct_pbtools_heap_t) callconv(.C) void), address_book_person_init)), @ptrCast(pbtools_message_decode_inner_t, @alignCast(@import("std").meta.alignment(fn ([*c]struct_pbtools_decoder_t, ?*anyopaque) callconv(.C) void), address_book_person_decode_inner)));
}
pub export fn address_book_person_phone_number_init(arg_self_p: [*c]struct_address_book_person_phone_number_t, arg_heap_p: [*c]struct_pbtools_heap_t) void {
    var self_p = arg_self_p;
    var heap_p = arg_heap_p;
    self_p.*.base.heap_p = heap_p;
    // self_p.*.number_p = "";
    self_p.*.type = 0;
}
pub export fn address_book_person_phone_number_encode_inner(arg_encoder_p: [*c]struct_pbtools_encoder_t, arg_self_p: [*c]struct_address_book_person_phone_number_t) void {
    var encoder_p = arg_encoder_p;
    var self_p = arg_self_p;
    pbtools_encoder_write_enum(encoder_p, @as(c_int, 2), @bitCast(c_int, self_p.*.type));
    pbtools_encoder_write_string(encoder_p, @as(c_int, 1), self_p.*.number_p);
}
pub export fn address_book_person_phone_number_decode_inner(arg_decoder_p: [*c]struct_pbtools_decoder_t, arg_self_p: [*c]struct_address_book_person_phone_number_t) void {
    var decoder_p = arg_decoder_p;
    var self_p = arg_self_p;
    var wire_type: c_int = undefined;
    while (pbtools_decoder_available(decoder_p)) {
        while (true) {
            switch (pbtools_decoder_read_tag(decoder_p, &wire_type)) {
                @as(c_int, 1) => {
                    pbtools_decoder_read_string(decoder_p, wire_type, &self_p.*.number_p);
                    break;
                },
                @as(c_int, 2) => {
                    self_p.*.type = @bitCast(c_uint, pbtools_decoder_read_enum(decoder_p, wire_type));
                    break;
                },
                else => {
                    pbtools_decoder_skip_field(decoder_p, wire_type);
                    break;
                },
            }
            break;
        }
    }
}
pub export fn address_book_person_phone_number_encode_repeated_inner(arg_encoder_p: [*c]struct_pbtools_encoder_t, arg_field_number: c_int, arg_repeated_p: [*c]struct_address_book_person_phone_number_repeated_t) void {
    var encoder_p = arg_encoder_p;
    var field_number = arg_field_number;
    var repeated_p = arg_repeated_p;
    pbtools_encode_repeated_inner(encoder_p, field_number, @ptrCast([*c]struct_pbtools_repeated_message_t, @alignCast(@import("std").meta.alignment(struct_pbtools_repeated_message_t), repeated_p)), @sizeOf(struct_address_book_person_phone_number_t), @ptrCast(pbtools_message_encode_inner_t, @alignCast(@import("std").meta.alignment(fn ([*c]struct_pbtools_encoder_t, ?*anyopaque) callconv(.C) void), address_book_person_phone_number_encode_inner)));
}
pub export fn address_book_person_phone_number_decode_repeated_inner(arg_decoder_p: [*c]struct_pbtools_decoder_t, arg_repeated_info_p: [*c]struct_pbtools_repeated_info_t, arg_repeated_p: [*c]struct_address_book_person_phone_number_repeated_t) void {
    var decoder_p = arg_decoder_p;
    var repeated_info_p = arg_repeated_info_p;
    var repeated_p = arg_repeated_p;
    pbtools_decode_repeated_inner(decoder_p, repeated_info_p, @ptrCast([*c]struct_pbtools_repeated_message_t, @alignCast(@import("std").meta.alignment(struct_pbtools_repeated_message_t), repeated_p)), @sizeOf(struct_address_book_person_phone_number_t), @ptrCast(pbtools_message_init_t, @alignCast(@import("std").meta.alignment(fn (?*anyopaque, [*c]struct_pbtools_heap_t) callconv(.C) void), address_book_person_phone_number_init)), @ptrCast(pbtools_message_decode_inner_t, @alignCast(@import("std").meta.alignment(fn ([*c]struct_pbtools_decoder_t, ?*anyopaque) callconv(.C) void), address_book_person_phone_number_decode_inner)));
}
pub export fn address_book_address_book_init(arg_self_p: [*c]struct_address_book_address_book_t, arg_heap_p: [*c]struct_pbtools_heap_t) void {
    var self_p = arg_self_p;
    var heap_p = arg_heap_p;
    self_p.*.base.heap_p = heap_p;
    self_p.*.people.length = 0;
}
pub export fn address_book_address_book_encode_inner(arg_encoder_p: [*c]struct_pbtools_encoder_t, arg_self_p: [*c]struct_address_book_address_book_t) void {
    var encoder_p = arg_encoder_p;
    var self_p = arg_self_p;
    address_book_person_encode_repeated_inner(encoder_p, @as(c_int, 1), &self_p.*.people);
}
pub export fn address_book_address_book_decode_inner(arg_decoder_p: [*c]struct_pbtools_decoder_t, arg_self_p: [*c]struct_address_book_address_book_t) void {
    var decoder_p = arg_decoder_p;
    var self_p = arg_self_p;
    var wire_type: c_int = undefined;
    var repeated_info_people: struct_pbtools_repeated_info_t = undefined;
    pbtools_repeated_info_init(&repeated_info_people, @as(c_int, 1));
    while (pbtools_decoder_available(decoder_p)) {
        while (true) {
            switch (pbtools_decoder_read_tag(decoder_p, &wire_type)) {
                @as(c_int, 1) => {
                    pbtools_repeated_info_decode(&repeated_info_people, decoder_p, wire_type);
                    break;
                },
                else => {
                    pbtools_decoder_skip_field(decoder_p, wire_type);
                    break;
                },
            }
            break;
        }
    }
    address_book_person_decode_repeated_inner(decoder_p, &repeated_info_people, &self_p.*.people);
}
pub export fn address_book_address_book_encode_repeated_inner(arg_encoder_p: [*c]struct_pbtools_encoder_t, arg_field_number: c_int, arg_repeated_p: [*c]struct_address_book_address_book_repeated_t) void {
    var encoder_p = arg_encoder_p;
    var field_number = arg_field_number;
    var repeated_p = arg_repeated_p;
    pbtools_encode_repeated_inner(encoder_p, field_number, @ptrCast([*c]struct_pbtools_repeated_message_t, @alignCast(@import("std").meta.alignment(struct_pbtools_repeated_message_t), repeated_p)), @sizeOf(struct_address_book_address_book_t), @ptrCast(pbtools_message_encode_inner_t, @alignCast(@import("std").meta.alignment(fn ([*c]struct_pbtools_encoder_t, ?*anyopaque) callconv(.C) void), address_book_address_book_encode_inner)));
}
pub export fn address_book_address_book_decode_repeated_inner(arg_decoder_p: [*c]struct_pbtools_decoder_t, arg_repeated_info_p: [*c]struct_pbtools_repeated_info_t, arg_repeated_p: [*c]struct_address_book_address_book_repeated_t) void {
    var decoder_p = arg_decoder_p;
    var repeated_info_p = arg_repeated_info_p;
    var repeated_p = arg_repeated_p;
    pbtools_decode_repeated_inner(decoder_p, repeated_info_p, @ptrCast([*c]struct_pbtools_repeated_message_t, @alignCast(@import("std").meta.alignment(struct_pbtools_repeated_message_t), repeated_p)), @sizeOf(struct_address_book_address_book_t), @ptrCast(pbtools_message_init_t, @alignCast(@import("std").meta.alignment(fn (?*anyopaque, [*c]struct_pbtools_heap_t) callconv(.C) void), address_book_address_book_init)), @ptrCast(pbtools_message_decode_inner_t, @alignCast(@import("std").meta.alignment(fn ([*c]struct_pbtools_decoder_t, ?*anyopaque) callconv(.C) void), address_book_address_book_decode_inner)));
}
pub const __block = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // (no file):27:9
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):69:9
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):75:9
pub const __FLT16_DENORM_MIN__ = @compileError("unable to translate C expr: unexpected token .IntegerLiteral"); // (no file):106:9
pub const __FLT16_EPSILON__ = @compileError("unable to translate C expr: unexpected token .IntegerLiteral"); // (no file):110:9
pub const __FLT16_MAX__ = @compileError("unable to translate C expr: unexpected token .IntegerLiteral"); // (no file):116:9
pub const __FLT16_MIN__ = @compileError("unable to translate C expr: unexpected token .IntegerLiteral"); // (no file):119:9
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`"); // (no file):179:9
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // (no file):201:9
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`"); // (no file):209:9
pub const __USER_LABEL_PREFIX__ = @compileError("unable to translate macro: undefined identifier `_`"); // (no file):292:9
pub const __nonnull = @compileError("unable to translate macro: undefined identifier `_Nonnull`"); // (no file):322:9
pub const __null_unspecified = @compileError("unable to translate macro: undefined identifier `_Null_unspecified`"); // (no file):323:9
pub const __nullable = @compileError("unable to translate macro: undefined identifier `_Nullable`"); // (no file):324:9
pub const __weak = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // (no file):382:9
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token .HashHash"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:113:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token .Hash"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:114:9
pub const __const = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:116:9
pub const __volatile = @compileError("unable to translate C expr: unexpected token .Keyword_volatile"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:118:9
pub const __dead2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:162:9
pub const __pure2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:163:9
pub const __stateful_pure = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:164:9
pub const __unused = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:169:9
pub const __used = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:174:9
pub const __cold = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:180:9
pub const __exported = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:190:9
pub const __exported_push = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:191:9
pub const __exported_pop = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:192:9
pub const __deprecated = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:204:9
pub const __deprecated_msg = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:208:10
pub const __kpi_deprecated = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:219:9
pub const __unavailable = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:225:9
pub const __restrict = @compileError("unable to translate C expr: unexpected token .Keyword_restrict"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:247:9
pub const __disable_tail_calls = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:280:9
pub const __not_tail_called = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:292:9
pub const __result_use_check = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:303:9
pub const __swift_unavailable = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:313:9
pub const __header_inline = @compileError("unable to translate C expr: unexpected token .Keyword_inline"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:347:10
pub const __header_always_inline = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:360:10
pub const __unreachable_ok_push = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:373:10
pub const __unreachable_ok_pop = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:376:10
pub const __printflike = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:397:9
pub const __printf0like = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:399:9
pub const __scanflike = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:401:9
pub const __IDSTRING = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:404:9
pub const __COPYRIGHT = @compileError("unable to translate macro: undefined identifier `copyright`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:407:9
pub const __RCSID = @compileError("unable to translate macro: undefined identifier `rcsid`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:411:9
pub const __SCCSID = @compileError("unable to translate macro: undefined identifier `sccsid`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:415:9
pub const __PROJECT_VERSION = @compileError("unable to translate macro: undefined identifier `project_version`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:419:9
pub const __FBSDID = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:424:9
pub const __DECONST = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:428:9
pub const __DEVOLATILE = @compileError("unable to translate C expr: unexpected token .Keyword_volatile"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:432:9
pub const __DEQUALIFY = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:436:9
pub const __alloc_size = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:454:9
pub const __DARWIN_ALIAS = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:639:9
pub const __DARWIN_ALIAS_C = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:640:9
pub const __DARWIN_ALIAS_I = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:641:9
pub const __DARWIN_NOCANCEL = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:642:9
pub const __DARWIN_INODE64 = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:643:9
pub const __DARWIN_1050 = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:645:9
pub const __DARWIN_1050ALIAS = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:646:9
pub const __DARWIN_1050ALIAS_C = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:647:9
pub const __DARWIN_1050ALIAS_I = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:648:9
pub const __DARWIN_1050INODE64 = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:649:9
pub const __DARWIN_EXTSN = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:651:9
pub const __DARWIN_EXTSN_C = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:652:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:35:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:41:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:47:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:53:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:59:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:65:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:71:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:77:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:83:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:89:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:95:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:101:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:107:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:113:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:119:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:125:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:131:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:137:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:143:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:149:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_4 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:155:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:161:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:167:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:173:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:179:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:185:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:191:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:197:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:203:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:209:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:215:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:221:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:227:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_4 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:233:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:239:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:245:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:251:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:257:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_4 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:263:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:269:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:275:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:281:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:287:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_4 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:293:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_5 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:299:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_6 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:305:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_7 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:311:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:317:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:323:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:329:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:335:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_5 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:341:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/_symbol_aliasing.h:347:9
pub const __DARWIN_ALIAS_STARTING = @compileError("unable to translate macro: undefined identifier `__DARWIN_ALIAS_STARTING_MAC_`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:662:9
pub const __POSIX_C_DEPRECATED = @compileError("unable to translate macro: undefined identifier `___POSIX_C_DEPRECATED_STARTING_`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:725:9
pub const __XNU_PRIVATE_EXTERN = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:825:9
pub const __compiler_barrier = @compileError("unable to translate macro: undefined identifier `__asm__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:842:9
pub const __enum_open = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:845:9
pub const __enum_closed = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:846:9
pub const __enum_options = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:853:9
pub const __enum_decl = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:866:9
pub const __enum_closed_decl = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:868:9
pub const __options_decl = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:870:9
pub const __options_closed_decl = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/sys/cdefs.h:872:9
pub const __offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/sys/_types.h:83:9
pub const __strfmonlike = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/_types.h:31:9
pub const __strftimelike = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/_types.h:33:9
pub const __AVAILABILITY_INTERNAL_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:109:9
pub const __AVAILABILITY_INTERNAL_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:112:17
pub const __AVAILABILITY_INTERNAL_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:121:9
pub const __AVAILABILITY_INTERNAL_WEAK_IMPORT = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:122:9
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2922:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2923:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2924:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2926:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2930:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2932:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2937:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2941:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2942:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2944:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2948:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2950:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2954:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2956:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2961:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2965:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2966:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2968:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2972:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2974:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2978:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2980:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2985:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2990:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2994:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:2996:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3000:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3002:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3006:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3008:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3012:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3014:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3018:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3020:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3024:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3026:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3030:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3032:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3036:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3038:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3042:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3043:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3044:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3045:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3046:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3047:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3049:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3053:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3055:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3060:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3064:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3065:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3067:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3071:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3073:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3077:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3079:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3084:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3088:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3089:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3091:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3095:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3097:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3101:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3103:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3108:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3112:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3113:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3115:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3119:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3121:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3125:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3127:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3131:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3133:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3137:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3139:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3143:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3145:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3149:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3151:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3155:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3157:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3162:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3163:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3164:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3165:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3166:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3168:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3172:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3174:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3179:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3183:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3184:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3186:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3190:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3192:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3196:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3198:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3203:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3207:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3208:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3210:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3214:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3216:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3220:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3222:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3227:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3231:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3232:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3234:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3238:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3240:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3244:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3246:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3250:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3252:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3256:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3258:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3262:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3264:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3268:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3270:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3274:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3275:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3276:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3277:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3278:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3279:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3281:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3285:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3287:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3292:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3296:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3297:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3299:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3303:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3305:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3309:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3311:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3316:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3320:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3321:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3323:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3327:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3329:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3333:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3335:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3340:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3344:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3345:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3347:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3351:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3353:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3357:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3359:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3363:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3365:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3369:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3371:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3375:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3377:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3381:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3382:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3383:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEPRECATED__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3384:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3385:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3386:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3387:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3389:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3393:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3395:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3400:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3404:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3405:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3407:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3411:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3413:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3417:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3419:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3424:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3428:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3429:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3431:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3435:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3437:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3441:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3443:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3448:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3452:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3454:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3458:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3460:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3464:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3466:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3470:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3472:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3476:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3478:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3482:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3483:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3484:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3485:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3486:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3487:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3489:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3493:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3495:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3500:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3504:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3505:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3507:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3511:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3513:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3517:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3519:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3524:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3528:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3529:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3531:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3535:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3537:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3541:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3543:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3548:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3552:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3553:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3555:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3559:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3561:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3565:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3567:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3571:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3573:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3577:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3578:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3579:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3580:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3581:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3582:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3584:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3588:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3590:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3595:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3599:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3600:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3602:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3606:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3608:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3612:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3614:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3619:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3623:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3624:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3626:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3630:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3632:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3636:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3638:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3643:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_13_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3647:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3648:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3650:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3654:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3656:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3660:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3662:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3666:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3667:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3668:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3669:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3670:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3671:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3673:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3677:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3679:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3684:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3688:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3689:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3691:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3695:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3697:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3701:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3703:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3708:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3712:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3713:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3715:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3719:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3721:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3725:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3727:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3732:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3736:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3737:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3739:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3743:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3745:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3749:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3750:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3751:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3752:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3753:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3754:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3756:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3760:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3762:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3767:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3771:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3772:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3774:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3778:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3780:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3784:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3786:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3791:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3795:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3796:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3798:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3802:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3804:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3808:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3810:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3815:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3819:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3820:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3821:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3823:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3827:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3828:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3829:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3830:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3832:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3836:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3837:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3838:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3840:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3844:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3846:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3851:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3855:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3856:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3858:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3862:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3864:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3868:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3870:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3875:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3879:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3880:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3882:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3886:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3888:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3892:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3894:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3899:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3903:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3905:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3909:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3911:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3915:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3917:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3921:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3923:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3927:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3929:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3933:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3935:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3939:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3941:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3945:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3947:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3951:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3953:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3958:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3962:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3963:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3964:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3965:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3966:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3967:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3969:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3973:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3975:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3979:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3980:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3982:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3986:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3988:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3992:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3994:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:3999:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4003:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4004:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4006:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4010:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4012:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4016:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4018:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4023:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4027:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4028:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4029:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4030:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4032:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4036:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4037:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4039:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4043:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4045:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4049:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4051:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4056:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4060:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4061:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4063:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4067:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4069:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4073:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4075:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4080:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4084:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4085:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4086:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4087:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4088:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4090:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4094:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4096:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4101:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4105:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4106:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4108:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4112:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4114:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4118:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4120:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4125:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4129:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4130:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4132:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4136:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4138:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4142:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4144:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4149:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4153:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4155:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4159:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4160:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4162:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4163:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4164:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4166:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4170:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4172:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4176:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4178:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4182:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4183:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4185:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4189:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4191:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4195:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4197:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4202:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4206:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4207:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4208:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4209:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4211:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4215:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4217:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4221:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4222:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4224:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4228:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4230:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4234:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4236:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4241:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4245:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4246:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4247:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4248:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4250:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4254:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4255:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4257:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4261:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4263:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4267:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4269:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4274:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4278:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4279:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4280:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4281:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4282:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4284:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4288:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4290:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4294:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4296:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4301:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4305:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4306:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4308:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4312:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4314:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4318:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4320:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4325:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4329:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4330:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4331:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4332:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4333:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4335:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4339:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4341:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4345:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4347:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4351:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4352:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4353:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4354:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4356:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4360:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4362:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4366:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4367:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4368:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4369:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4371:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4375:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4376:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4377:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4378:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4380:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4384:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4386:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4390:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4392:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4397:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4401:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4403:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4407:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4408:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4409:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4410:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4411:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4412:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4413:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14_DEP__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4414:21
pub const __AVAILABILITY_INTERNAL__MAC_10_15 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4415:21
pub const __AVAILABILITY_INTERNAL__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4417:21
pub const __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4418:21
pub const __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4419:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4421:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4422:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4423:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4424:21
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4427:22
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4428:22
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4429:22
pub const __API_AVAILABLE_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4445:13
pub const __API_AVAILABLE_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4446:13
pub const __API_AVAILABLE_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4447:13
pub const __API_AVAILABLE_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4448:13
pub const __API_AVAILABLE_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4449:13
pub const __API_AVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4451:13
pub const __API_AVAILABLE_PLATFORM_uikitformac = @compileError("unable to translate macro: undefined identifier `uikitformac`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4454:14
pub const __API_AVAILABLE_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4456:13
pub const __API_A = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4460:17
pub const __API_AVAILABLE2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4469:13
pub const __API_AVAILABLE3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4470:13
pub const __API_AVAILABLE4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4471:13
pub const __API_AVAILABLE5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4472:13
pub const __API_AVAILABLE6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4473:13
pub const __API_AVAILABLE7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4474:13
pub const __API_AVAILABLE_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4475:13
pub const __API_APPLY_TO = @compileError("unable to translate macro: undefined identifier `any`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4477:13
pub const __API_RANGE_STRINGIFY2 = @compileError("unable to translate C expr: unexpected token .Hash"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4479:13
pub const __API_A_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4481:13
pub const __API_AVAILABLE_BEGIN2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4484:13
pub const __API_AVAILABLE_BEGIN3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4485:13
pub const __API_AVAILABLE_BEGIN4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4486:13
pub const __API_AVAILABLE_BEGIN5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4487:13
pub const __API_AVAILABLE_BEGIN6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4488:13
pub const __API_AVAILABLE_BEGIN7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4489:13
pub const __API_AVAILABLE_BEGIN_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4490:13
pub const __API_DEPRECATED_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4493:13
pub const __API_DEPRECATED_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4494:13
pub const __API_DEPRECATED_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4495:13
pub const __API_DEPRECATED_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4496:13
pub const __API_DEPRECATED_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4497:13
pub const __API_DEPRECATED_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4499:13
pub const __API_DEPRECATED_PLATFORM_uikitformac = @compileError("unable to translate macro: undefined identifier `uikitformac`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4502:14
pub const __API_DEPRECATED_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4504:13
pub const __API_D = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4508:17
pub const __API_DEPRECATED_MSG3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4517:13
pub const __API_DEPRECATED_MSG4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4518:13
pub const __API_DEPRECATED_MSG5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4519:13
pub const __API_DEPRECATED_MSG6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4520:13
pub const __API_DEPRECATED_MSG7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4521:13
pub const __API_DEPRECATED_MSG8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4522:13
pub const __API_DEPRECATED_MSG_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4523:13
pub const __API_D_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4525:13
pub const __API_DEPRECATED_BEGIN_MSG3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4528:13
pub const __API_DEPRECATED_BEGIN_MSG4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4529:13
pub const __API_DEPRECATED_BEGIN_MSG5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4530:13
pub const __API_DEPRECATED_BEGIN_MSG6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4531:13
pub const __API_DEPRECATED_BEGIN_MSG7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4532:13
pub const __API_DEPRECATED_BEGIN_MSG8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4533:13
pub const __API_DEPRECATED_BEGIN_MSG_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4534:13
pub const __API_R = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4537:17
pub const __API_DEPRECATED_REP3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4543:13
pub const __API_DEPRECATED_REP4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4544:13
pub const __API_DEPRECATED_REP5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4545:13
pub const __API_DEPRECATED_REP6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4546:13
pub const __API_DEPRECATED_REP7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4547:13
pub const __API_DEPRECATED_REP8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4548:13
pub const __API_DEPRECATED_REP_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4549:13
pub const __API_R_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4552:17
pub const __API_DEPRECATED_BEGIN_REP3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4558:13
pub const __API_DEPRECATED_BEGIN_REP4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4559:13
pub const __API_DEPRECATED_BEGIN_REP5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4560:13
pub const __API_DEPRECATED_BEGIN_REP6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4561:13
pub const __API_DEPRECATED_BEGIN_REP7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4562:13
pub const __API_DEPRECATED_BEGIN_REP8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4563:13
pub const __API_DEPRECATED_BEGIN_REP_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4564:13
pub const __API_UNAVAILABLE_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4574:13
pub const __API_UNAVAILABLE_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4575:13
pub const __API_UNAVAILABLE_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4576:13
pub const __API_UNAVAILABLE_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4577:13
pub const __API_UNAVAILABLE_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4578:13
pub const __API_UNAVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4580:13
pub const __API_UNAVAILABLE_PLATFORM_uikitformac = @compileError("unable to translate macro: undefined identifier `uikitformac`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4583:14
pub const __API_UNAVAILABLE_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4585:13
pub const __API_U = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4589:17
pub const __API_UNAVAILABLE2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4598:13
pub const __API_UNAVAILABLE3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4599:13
pub const __API_UNAVAILABLE4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4600:13
pub const __API_UNAVAILABLE5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4601:13
pub const __API_UNAVAILABLE6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4602:13
pub const __API_UNAVAILABLE7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4603:13
pub const __API_UNAVAILABLE_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4604:13
pub const __API_U_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4606:13
pub const __API_UNAVAILABLE_BEGIN2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4609:13
pub const __API_UNAVAILABLE_BEGIN3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4610:13
pub const __API_UNAVAILABLE_BEGIN4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4611:13
pub const __API_UNAVAILABLE_BEGIN5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4612:13
pub const __API_UNAVAILABLE_BEGIN6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4613:13
pub const __API_UNAVAILABLE_BEGIN7 = @compileError("unable to translate macro: undefined identifier `g`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4614:13
pub const __API_UNAVAILABLE_BEGIN_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4615:13
pub const __swift_compiler_version_at_least = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4664:13
pub const __SPI_AVAILABLE = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos.12-any/AvailabilityInternal.h:4672:11
pub const __OSX_AVAILABLE_STARTING = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:172:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:173:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:175:17
pub const __OS_AVAILABILITY = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:198:13
pub const __OS_AVAILABILITY_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:199:13
pub const __OSX_EXTENSION_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx_app_extension`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:216:13
pub const __IOS_EXTENSION_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `ios_app_extension`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:217:13
pub const __OS_EXTENSION_UNAVAILABLE = @compileError("unable to translate C expr: unexpected token .Identifier"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:227:9
pub const __OSX_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:234:13
pub const __OSX_AVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:235:13
pub const __OSX_DEPRECATED = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:236:13
pub const __IOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:256:13
pub const __IOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:257:13
pub const __IOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:258:13
pub const __IOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:259:13
pub const __TVOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:283:13
pub const __TVOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:284:13
pub const __TVOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:285:13
pub const __TVOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:286:13
pub const __WATCHOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:310:13
pub const __WATCHOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:311:13
pub const __WATCHOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:312:13
pub const __WATCHOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:313:13
pub const __SWIFT_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `swift`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:337:13
pub const __SWIFT_UNAVAILABLE_MSG = @compileError("unable to translate macro: undefined identifier `swift`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:338:13
pub const __API_AVAILABLE = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:381:13
pub const __API_AVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:383:13
pub const __API_AVAILABLE_END = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:384:13
pub const __API_DEPRECATED = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:402:13
pub const __API_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:403:13
pub const __API_DEPRECATED_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:405:13
pub const __API_DEPRECATED_END = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:406:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:408:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_END = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:409:13
pub const __API_UNAVAILABLE = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:419:13
pub const __API_UNAVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:421:13
pub const __API_UNAVAILABLE_END = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:422:13
pub const __SPI_DEPRECATED = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:475:11
pub const __SPI_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')'"); // /nix/store/nwk1jvq0nmnfcslrwsrmahcbpvrpflzl-zig/lib/libc/include/any-macos-any/Availability.h:479:11
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 13);
pub const __clang_minor__ = @as(c_int, 0);
pub const __clang_patchlevel__ = @as(c_int, 1);
pub const __clang_version__ = "13.0.1 (git@github.com:ziglang/zig-bootstrap.git 81f0e6c5b902ead84753490db4f0007d08df964a)";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 13.0.1 (git@github.com:ziglang/zig-bootstrap.git 81f0e6c5b902ead84753490db4f0007d08df964a)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 1);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __BLOCKS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __OPTIMIZE__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_TYPE__ = c_int;
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_TYPE__ = c_int;
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = 4.9406564584124654e-324;
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = 2.2204460492503131e-16;
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = 1.7976931348623157e+308;
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = 2.2250738585072014e-308;
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 4.9406564584124654e-324);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 15);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 2.2204460492503131e-16);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 53);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __LDBL_MAX_EXP__ = @as(c_int, 1024);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.7976931348623157e+308);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __LDBL_MIN__ = @as(c_longdouble, 2.2250738585072014e-308);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 8);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_FMTd__ = "lld";
pub const __INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "llo";
pub const __UINT_LEAST64_FMTu__ = "llu";
pub const __UINT_LEAST64_FMTx__ = "llx";
pub const __UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __AARCH64EL__ = @as(c_int, 1);
pub const __aarch64__ = @as(c_int, 1);
pub const __AARCH64_CMODEL_SMALL__ = @as(c_int, 1);
pub const __ARM_ACLE = @as(c_int, 200);
pub const __ARM_ARCH = @as(c_int, 8);
pub const __ARM_ARCH_PROFILE = 'A';
pub const __ARM_64BIT_STATE = @as(c_int, 1);
pub const __ARM_PCS_AAPCS64 = @as(c_int, 1);
pub const __ARM_ARCH_ISA_A64 = @as(c_int, 1);
pub const __ARM_FEATURE_CLZ = @as(c_int, 1);
pub const __ARM_FEATURE_FMA = @as(c_int, 1);
pub const __ARM_FEATURE_LDREX = @as(c_int, 0xF);
pub const __ARM_FEATURE_IDIV = @as(c_int, 1);
pub const __ARM_FEATURE_DIV = @as(c_int, 1);
pub const __ARM_FEATURE_NUMERIC_MAXMIN = @as(c_int, 1);
pub const __ARM_FEATURE_DIRECTED_ROUNDING = @as(c_int, 1);
pub const __ARM_ALIGN_MAX_STACK_PWR = @as(c_int, 4);
pub const __ARM_FP = @as(c_int, 0xE);
pub const __ARM_FP16_FORMAT_IEEE = @as(c_int, 1);
pub const __ARM_FP16_ARGS = @as(c_int, 1);
pub const __ARM_SIZEOF_WCHAR_T = @as(c_int, 4);
pub const __ARM_SIZEOF_MINIMAL_ENUM = @as(c_int, 4);
pub const __ARM_NEON = @as(c_int, 1);
pub const __ARM_NEON_FP = @as(c_int, 0xE);
pub const __ARM_FEATURE_CRC32 = @as(c_int, 1);
pub const __ARM_FEATURE_CRYPTO = @as(c_int, 1);
pub const __ARM_FEATURE_AES = @as(c_int, 1);
pub const __ARM_FEATURE_SHA2 = @as(c_int, 1);
pub const __ARM_FEATURE_SHA3 = @as(c_int, 1);
pub const __ARM_FEATURE_SHA512 = @as(c_int, 1);
pub const __ARM_FEATURE_UNALIGNED = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_VECTOR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_SCALAR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_FEATURE_DOTPROD = @as(c_int, 1);
pub const __ARM_FEATURE_ATOMICS = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_FML = @as(c_int, 1);
pub const __ARM_FEATURE_COMPLEX = @as(c_int, 1);
pub const __ARM_FEATURE_JCVT = @as(c_int, 1);
pub const __ARM_FEATURE_QRDMX = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __AARCH64_SIMD__ = @as(c_int, 1);
pub const __ARM64_ARCH_8__ = @as(c_int, 1);
pub const __ARM_NEON__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __arm64 = @as(c_int, 1);
pub const __arm64__ = @as(c_int, 1);
pub const __APPLE_CC__ = @as(c_int, 6000);
pub const __APPLE__ = @as(c_int, 1);
pub const __STDC_NO_THREADS__ = @as(c_int, 1);
pub const __strong = "";
pub const __unsafe_unretained = "";
pub const __DYNAMIC__ = @as(c_int, 1);
pub const __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120301, .decimal);
pub const __MACH__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const _DEBUG = @as(c_int, 1);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const __CLANG_LIMITS_H = "";
pub const _GCC_LIMITS_H_ = "";
pub const _LIMITS_H_ = "";
pub const _CDEFS_H_ = "";
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub inline fn __P(protos: anytype) @TypeOf(protos) {
    return protos;
}
pub const __signed = c_int;
pub inline fn __deprecated_enum_msg(_msg: anytype) @TypeOf(__deprecated_msg(_msg)) {
    return __deprecated_msg(_msg);
}
pub const __kpi_unavailable = "";
pub const __kpi_deprecated_arm64_macos_unavailable = "";
pub const __dead = "";
pub const __pure = "";
pub const __abortlike = __dead2 ++ __cold ++ __not_tail_called;
pub const __DARWIN_ONLY_64_BIT_INO_T = @as(c_int, 1);
pub const __DARWIN_ONLY_UNIX_CONFORMANCE = @as(c_int, 1);
pub const __DARWIN_ONLY_VERS_1050 = @as(c_int, 1);
pub const __DARWIN_UNIX03 = @as(c_int, 1);
pub const __DARWIN_64_BIT_INO_T = @as(c_int, 1);
pub const __DARWIN_VERS_1050 = @as(c_int, 1);
pub const __DARWIN_NON_CANCELABLE = @as(c_int, 0);
pub const __DARWIN_SUF_UNIX03 = "";
pub const __DARWIN_SUF_64_BIT_INO_T = "";
pub const __DARWIN_SUF_1050 = "";
pub const __DARWIN_SUF_NON_CANCELABLE = "";
pub const __DARWIN_SUF_EXTSN = "$DARWIN_EXTSN";
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_0(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_3(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_5(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_6(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_7(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_8(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_9(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_3(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_3(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_5(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_6(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_16(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_0(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_3(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_0(x: anytype) @TypeOf(x) {
    return x;
}
pub const ___POSIX_C_DEPRECATED_STARTING_198808L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199009L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199209L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199309L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199506L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_200112L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_200809L = "";
pub const __DARWIN_C_ANSI = @as(c_long, 0o10000);
pub const __DARWIN_C_FULL = @as(c_long, 900000);
pub const __DARWIN_C_LEVEL = __DARWIN_C_FULL;
pub const __STDC_WANT_LIB_EXT1__ = @as(c_int, 1);
pub const __DARWIN_NO_LONG_LONG = @as(c_int, 0);
pub const _DARWIN_FEATURE_64_BIT_INODE = @as(c_int, 1);
pub const _DARWIN_FEATURE_ONLY_64_BIT_INODE = @as(c_int, 1);
pub const _DARWIN_FEATURE_ONLY_VERS_1050 = @as(c_int, 1);
pub const _DARWIN_FEATURE_ONLY_UNIX_CONFORMANCE = @as(c_int, 1);
pub const _DARWIN_FEATURE_UNIX_CONFORMANCE = @as(c_int, 3);
pub inline fn __CAST_AWAY_QUALIFIER(variable: anytype, qualifier: anytype, @"type": anytype) @TypeOf(@"type"(c_long)(variable)) {
    _ = qualifier;
    return @"type"(c_long)(variable);
}
pub const __kernel_ptr_semantics = "";
pub const __kernel_data_semantics = "";
pub const __kernel_dual_semantics = "";
pub const _BSD_MACHINE_LIMITS_H_ = "";
pub const _ARM_LIMITS_H_ = "";
pub const _ARM__LIMITS_H_ = "";
pub const __DARWIN_CLK_TCK = @as(c_int, 100);
pub const CHAR_BIT = @as(c_int, 8);
pub const MB_LEN_MAX = @as(c_int, 6);
pub const CLK_TCK = __DARWIN_CLK_TCK;
pub const SCHAR_MAX = @as(c_int, 127);
pub const SCHAR_MIN = -@as(c_int, 128);
pub const UCHAR_MAX = @as(c_int, 255);
pub const CHAR_MAX = @as(c_int, 127);
pub const CHAR_MIN = -@as(c_int, 128);
pub const USHRT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const SHRT_MAX = @as(c_int, 32767);
pub const SHRT_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const UINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hexadecimal);
pub const INT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const ULONG_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 0xffffffffffffffff, .hexadecimal);
pub const LONG_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 0x7fffffffffffffff, .hexadecimal);
pub const LONG_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 0x7fffffffffffffff, .hexadecimal) - @as(c_int, 1);
pub const ULLONG_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const LLONG_MAX = @as(c_longlong, 0x7fffffffffffffff);
pub const LLONG_MIN = -@as(c_longlong, 0x7fffffffffffffff) - @as(c_int, 1);
pub const LONG_BIT = @as(c_int, 64);
pub const SSIZE_MAX = LONG_MAX;
pub const WORD_BIT = @as(c_int, 32);
pub const SIZE_T_MAX = ULONG_MAX;
pub const UQUAD_MAX = ULLONG_MAX;
pub const QUAD_MAX = LLONG_MAX;
pub const QUAD_MIN = LLONG_MIN;
pub const _SYS_SYSLIMITS_H_ = "";
pub const ARG_MAX = @as(c_int, 1024) * @as(c_int, 1024);
pub const CHILD_MAX = @as(c_int, 266);
pub const GID_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 2147483647, .decimal);
pub const LINK_MAX = @as(c_int, 32767);
pub const MAX_CANON = @as(c_int, 1024);
pub const MAX_INPUT = @as(c_int, 1024);
pub const NAME_MAX = @as(c_int, 255);
pub const NGROUPS_MAX = @as(c_int, 16);
pub const UID_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 2147483647, .decimal);
pub const OPEN_MAX = @as(c_int, 10240);
pub const PATH_MAX = @as(c_int, 1024);
pub const PIPE_BUF = @as(c_int, 512);
pub const BC_BASE_MAX = @as(c_int, 99);
pub const BC_DIM_MAX = @as(c_int, 2048);
pub const BC_SCALE_MAX = @as(c_int, 99);
pub const BC_STRING_MAX = @as(c_int, 1000);
pub const CHARCLASS_NAME_MAX = @as(c_int, 14);
pub const COLL_WEIGHTS_MAX = @as(c_int, 2);
pub const EQUIV_CLASS_MAX = @as(c_int, 2);
pub const EXPR_NEST_MAX = @as(c_int, 32);
pub const LINE_MAX = @as(c_int, 2048);
pub const RE_DUP_MAX = @as(c_int, 255);
pub const NZERO = @as(c_int, 20);
pub const _POSIX_ARG_MAX = @as(c_int, 4096);
pub const _POSIX_CHILD_MAX = @as(c_int, 25);
pub const _POSIX_LINK_MAX = @as(c_int, 8);
pub const _POSIX_MAX_CANON = @as(c_int, 255);
pub const _POSIX_MAX_INPUT = @as(c_int, 255);
pub const _POSIX_NAME_MAX = @as(c_int, 14);
pub const _POSIX_NGROUPS_MAX = @as(c_int, 8);
pub const _POSIX_OPEN_MAX = @as(c_int, 20);
pub const _POSIX_PATH_MAX = @as(c_int, 256);
pub const _POSIX_PIPE_BUF = @as(c_int, 512);
pub const _POSIX_SSIZE_MAX = @as(c_int, 32767);
pub const _POSIX_STREAM_MAX = @as(c_int, 8);
pub const _POSIX_TZNAME_MAX = @as(c_int, 6);
pub const _POSIX2_BC_BASE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_DIM_MAX = @as(c_int, 2048);
pub const _POSIX2_BC_SCALE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_STRING_MAX = @as(c_int, 1000);
pub const _POSIX2_EQUIV_CLASS_MAX = @as(c_int, 2);
pub const _POSIX2_EXPR_NEST_MAX = @as(c_int, 32);
pub const _POSIX2_LINE_MAX = @as(c_int, 2048);
pub const _POSIX2_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX_AIO_LISTIO_MAX = @as(c_int, 2);
pub const _POSIX_AIO_MAX = @as(c_int, 1);
pub const _POSIX_DELAYTIMER_MAX = @as(c_int, 32);
pub const _POSIX_MQ_OPEN_MAX = @as(c_int, 8);
pub const _POSIX_MQ_PRIO_MAX = @as(c_int, 32);
pub const _POSIX_RTSIG_MAX = @as(c_int, 8);
pub const _POSIX_SEM_NSEMS_MAX = @as(c_int, 256);
pub const _POSIX_SEM_VALUE_MAX = @as(c_int, 32767);
pub const _POSIX_SIGQUEUE_MAX = @as(c_int, 32);
pub const _POSIX_TIMER_MAX = @as(c_int, 32);
pub const _POSIX_CLOCKRES_MIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 20000000, .decimal);
pub const _POSIX_THREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 4);
pub const _POSIX_THREAD_KEYS_MAX = @as(c_int, 128);
pub const _POSIX_THREAD_THREADS_MAX = @as(c_int, 64);
pub const PTHREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 4);
pub const PTHREAD_KEYS_MAX = @as(c_int, 512);
pub const PTHREAD_STACK_MIN = @as(c_int, 16384);
pub const _POSIX_HOST_NAME_MAX = @as(c_int, 255);
pub const _POSIX_LOGIN_NAME_MAX = @as(c_int, 9);
pub const _POSIX_SS_REPL_MAX = @as(c_int, 4);
pub const _POSIX_SYMLINK_MAX = @as(c_int, 255);
pub const _POSIX_SYMLOOP_MAX = @as(c_int, 8);
pub const _POSIX_TRACE_EVENT_NAME_MAX = @as(c_int, 30);
pub const _POSIX_TRACE_NAME_MAX = @as(c_int, 8);
pub const _POSIX_TRACE_SYS_MAX = @as(c_int, 8);
pub const _POSIX_TRACE_USER_EVENT_MAX = @as(c_int, 32);
pub const _POSIX_TTY_NAME_MAX = @as(c_int, 9);
pub const _POSIX2_CHARCLASS_NAME_MAX = @as(c_int, 14);
pub const _POSIX2_COLL_WEIGHTS_MAX = @as(c_int, 2);
pub const _POSIX_RE_DUP_MAX = _POSIX2_RE_DUP_MAX;
pub const OFF_MIN = LLONG_MIN;
pub const OFF_MAX = LLONG_MAX;
pub const PASS_MAX = @as(c_int, 128);
pub const NL_ARGMAX = @as(c_int, 9);
pub const NL_LANGMAX = @as(c_int, 14);
pub const NL_MSGMAX = @as(c_int, 32767);
pub const NL_NMAX = @as(c_int, 1);
pub const NL_SETMAX = @as(c_int, 255);
pub const NL_TEXTMAX = @as(c_int, 2048);
pub const _XOPEN_IOV_MAX = @as(c_int, 16);
pub const IOV_MAX = @as(c_int, 1024);
pub const _XOPEN_NAME_MAX = @as(c_int, 255);
pub const _XOPEN_PATH_MAX = @as(c_int, 1024);
pub const LONG_LONG_MAX = __LONG_LONG_MAX__;
pub const LONG_LONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const ULONG_LONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const ADDRESS_BOOK_H = "";
pub const PBTOOLS_H = "";
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H_ = "";
pub const __WORDSIZE = @as(c_int, 64);
pub const _INT8_T = "";
pub const _INT16_T = "";
pub const _INT32_T = "";
pub const _INT64_T = "";
pub const _UINT8_T = "";
pub const _UINT16_T = "";
pub const _UINT32_T = "";
pub const _UINT64_T = "";
pub const _SYS__TYPES_H_ = "";
pub const _BSD_MACHINE__TYPES_H_ = "";
pub const _BSD_ARM__TYPES_H_ = "";
pub const __DARWIN_NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const _SYS__PTHREAD_TYPES_H_ = "";
pub const __PTHREAD_SIZE__ = @as(c_int, 8176);
pub const __PTHREAD_ATTR_SIZE__ = @as(c_int, 56);
pub const __PTHREAD_MUTEXATTR_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_MUTEX_SIZE__ = @as(c_int, 56);
pub const __PTHREAD_CONDATTR_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_COND_SIZE__ = @as(c_int, 40);
pub const __PTHREAD_ONCE_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_RWLOCK_SIZE__ = @as(c_int, 192);
pub const __PTHREAD_RWLOCKATTR_SIZE__ = @as(c_int, 16);
pub const _INTPTR_T = "";
pub const _BSD_MACHINE_TYPES_H_ = "";
pub const _ARM_MACHTYPES_H_ = "";
pub const _MACHTYPES_H_ = "";
pub const _U_INT8_T = "";
pub const _U_INT16_T = "";
pub const _U_INT32_T = "";
pub const _U_INT64_T = "";
pub const _UINTPTR_T = "";
pub const USER_ADDR_NULL = @import("std").zig.c_translation.cast(user_addr_t, @as(c_int, 0));
pub inline fn CAST_USER_ADDR_T(a_ptr: anytype) user_addr_t {
    return @import("std").zig.c_translation.cast(user_addr_t, @import("std").zig.c_translation.cast(usize, a_ptr));
}
pub const _INTMAX_T = "";
pub const _UINTMAX_T = "";
pub inline fn INT8_C(v: anytype) @TypeOf(v) {
    return v;
}
pub inline fn INT16_C(v: anytype) @TypeOf(v) {
    return v;
}
pub inline fn INT32_C(v: anytype) @TypeOf(v) {
    return v;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
pub inline fn UINT8_C(v: anytype) @TypeOf(v) {
    return v;
}
pub inline fn UINT16_C(v: anytype) @TypeOf(v) {
    return v;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = @as(c_longlong, 9223372036854775807);
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const INT32_MIN = -INT32_MAX - @as(c_int, 1);
pub const INT64_MIN = -INT64_MAX - @as(c_int, 1);
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = @as(c_ulonglong, 18446744073709551615);
pub const INT_LEAST8_MIN = INT8_MIN;
pub const INT_LEAST16_MIN = INT16_MIN;
pub const INT_LEAST32_MIN = INT32_MIN;
pub const INT_LEAST64_MIN = INT64_MIN;
pub const INT_LEAST8_MAX = INT8_MAX;
pub const INT_LEAST16_MAX = INT16_MAX;
pub const INT_LEAST32_MAX = INT32_MAX;
pub const INT_LEAST64_MAX = INT64_MAX;
pub const UINT_LEAST8_MAX = UINT8_MAX;
pub const UINT_LEAST16_MAX = UINT16_MAX;
pub const UINT_LEAST32_MAX = UINT32_MAX;
pub const UINT_LEAST64_MAX = UINT64_MAX;
pub const INT_FAST8_MIN = INT8_MIN;
pub const INT_FAST16_MIN = INT16_MIN;
pub const INT_FAST32_MIN = INT32_MIN;
pub const INT_FAST64_MIN = INT64_MIN;
pub const INT_FAST8_MAX = INT8_MAX;
pub const INT_FAST16_MAX = INT16_MAX;
pub const INT_FAST32_MAX = INT32_MAX;
pub const INT_FAST64_MAX = INT64_MAX;
pub const UINT_FAST8_MAX = UINT8_MAX;
pub const UINT_FAST16_MAX = UINT16_MAX;
pub const UINT_FAST32_MAX = UINT32_MAX;
pub const UINT_FAST64_MAX = UINT64_MAX;
pub const INTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INTPTR_MIN = -INTPTR_MAX - @as(c_int, 1);
pub const UINTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MAX = INTMAX_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = UINTMAX_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTMAX_MIN = -INTMAX_MAX - @as(c_int, 1);
pub const PTRDIFF_MIN = INTMAX_MIN;
pub const PTRDIFF_MAX = INTMAX_MAX;
pub const SIZE_MAX = UINTPTR_MAX;
pub const RSIZE_MAX = SIZE_MAX >> @as(c_int, 1);
pub const WCHAR_MAX = __WCHAR_MAX__;
pub const WCHAR_MIN = -WCHAR_MAX - @as(c_int, 1);
pub const WINT_MIN = INT32_MIN;
pub const WINT_MAX = INT32_MAX;
pub const SIG_ATOMIC_MIN = INT32_MIN;
pub const SIG_ATOMIC_MAX = INT32_MAX;
pub const __STDBOOL_H = "";
pub const @"bool" = bool;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const _STRING_H_ = "";
pub const __TYPES_H_ = "";
pub const __DARWIN_WCHAR_MAX = __WCHAR_MAX__;
pub const __DARWIN_WCHAR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hexadecimal) - @as(c_int, 1);
pub const __DARWIN_WEOF = @import("std").zig.c_translation.cast(__darwin_wint_t, -@as(c_int, 1));
pub const _FORTIFY_SOURCE = @as(c_int, 2);
pub const __AVAILABILITY__ = "";
pub const __API_TO_BE_DEPRECATED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __AVAILABILITY_VERSIONS__ = "";
pub const __MAC_10_0 = @as(c_int, 1000);
pub const __MAC_10_1 = @as(c_int, 1010);
pub const __MAC_10_2 = @as(c_int, 1020);
pub const __MAC_10_3 = @as(c_int, 1030);
pub const __MAC_10_4 = @as(c_int, 1040);
pub const __MAC_10_5 = @as(c_int, 1050);
pub const __MAC_10_6 = @as(c_int, 1060);
pub const __MAC_10_7 = @as(c_int, 1070);
pub const __MAC_10_8 = @as(c_int, 1080);
pub const __MAC_10_9 = @as(c_int, 1090);
pub const __MAC_10_10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101000, .decimal);
pub const __MAC_10_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101002, .decimal);
pub const __MAC_10_10_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101003, .decimal);
pub const __MAC_10_11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101100, .decimal);
pub const __MAC_10_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101102, .decimal);
pub const __MAC_10_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101103, .decimal);
pub const __MAC_10_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101104, .decimal);
pub const __MAC_10_12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101200, .decimal);
pub const __MAC_10_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101201, .decimal);
pub const __MAC_10_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101202, .decimal);
pub const __MAC_10_12_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101204, .decimal);
pub const __MAC_10_13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101300, .decimal);
pub const __MAC_10_13_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101301, .decimal);
pub const __MAC_10_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101302, .decimal);
pub const __MAC_10_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101304, .decimal);
pub const __MAC_10_14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101400, .decimal);
pub const __MAC_10_14_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101401, .decimal);
pub const __MAC_10_14_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101404, .decimal);
pub const __MAC_10_14_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101406, .decimal);
pub const __MAC_10_15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101500, .decimal);
pub const __MAC_10_15_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101501, .decimal);
pub const __MAC_10_15_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101504, .decimal);
pub const __MAC_10_16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101600, .decimal);
pub const __MAC_11_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110000, .decimal);
pub const __MAC_11_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110100, .decimal);
pub const __MAC_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110300, .decimal);
pub const __MAC_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110400, .decimal);
pub const __MAC_11_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110500, .decimal);
pub const __MAC_12_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120000, .decimal);
pub const __IPHONE_2_0 = @as(c_int, 20000);
pub const __IPHONE_2_1 = @as(c_int, 20100);
pub const __IPHONE_2_2 = @as(c_int, 20200);
pub const __IPHONE_3_0 = @as(c_int, 30000);
pub const __IPHONE_3_1 = @as(c_int, 30100);
pub const __IPHONE_3_2 = @as(c_int, 30200);
pub const __IPHONE_4_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40000, .decimal);
pub const __IPHONE_4_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40100, .decimal);
pub const __IPHONE_4_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40200, .decimal);
pub const __IPHONE_4_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40300, .decimal);
pub const __IPHONE_5_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50000, .decimal);
pub const __IPHONE_5_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50100, .decimal);
pub const __IPHONE_6_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60000, .decimal);
pub const __IPHONE_6_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60100, .decimal);
pub const __IPHONE_7_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70000, .decimal);
pub const __IPHONE_7_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70100, .decimal);
pub const __IPHONE_8_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80000, .decimal);
pub const __IPHONE_8_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80100, .decimal);
pub const __IPHONE_8_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80200, .decimal);
pub const __IPHONE_8_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80300, .decimal);
pub const __IPHONE_8_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80400, .decimal);
pub const __IPHONE_9_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90000, .decimal);
pub const __IPHONE_9_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90100, .decimal);
pub const __IPHONE_9_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90200, .decimal);
pub const __IPHONE_9_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90300, .decimal);
pub const __IPHONE_10_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __IPHONE_10_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100100, .decimal);
pub const __IPHONE_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100200, .decimal);
pub const __IPHONE_10_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100300, .decimal);
pub const __IPHONE_11_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110000, .decimal);
pub const __IPHONE_11_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110100, .decimal);
pub const __IPHONE_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110200, .decimal);
pub const __IPHONE_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110300, .decimal);
pub const __IPHONE_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110400, .decimal);
pub const __IPHONE_12_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120000, .decimal);
pub const __IPHONE_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120100, .decimal);
pub const __IPHONE_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120200, .decimal);
pub const __IPHONE_12_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120300, .decimal);
pub const __IPHONE_12_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120400, .decimal);
pub const __IPHONE_13_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130000, .decimal);
pub const __IPHONE_13_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130100, .decimal);
pub const __IPHONE_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130200, .decimal);
pub const __IPHONE_13_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130300, .decimal);
pub const __IPHONE_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130400, .decimal);
pub const __IPHONE_13_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130500, .decimal);
pub const __IPHONE_13_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130600, .decimal);
pub const __IPHONE_13_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130700, .decimal);
pub const __IPHONE_14_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140000, .decimal);
pub const __IPHONE_14_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140100, .decimal);
pub const __IPHONE_14_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140200, .decimal);
pub const __IPHONE_14_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140300, .decimal);
pub const __IPHONE_14_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140500, .decimal);
pub const __IPHONE_14_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140600, .decimal);
pub const __IPHONE_14_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140700, .decimal);
pub const __IPHONE_14_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140800, .decimal);
pub const __IPHONE_15_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150000, .decimal);
pub const __TVOS_9_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90000, .decimal);
pub const __TVOS_9_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90100, .decimal);
pub const __TVOS_9_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90200, .decimal);
pub const __TVOS_10_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __TVOS_10_0_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100001, .decimal);
pub const __TVOS_10_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100100, .decimal);
pub const __TVOS_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100200, .decimal);
pub const __TVOS_11_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110000, .decimal);
pub const __TVOS_11_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110100, .decimal);
pub const __TVOS_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110200, .decimal);
pub const __TVOS_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110300, .decimal);
pub const __TVOS_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110400, .decimal);
pub const __TVOS_12_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120000, .decimal);
pub const __TVOS_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120100, .decimal);
pub const __TVOS_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120200, .decimal);
pub const __TVOS_12_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120300, .decimal);
pub const __TVOS_12_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120400, .decimal);
pub const __TVOS_13_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130000, .decimal);
pub const __TVOS_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130200, .decimal);
pub const __TVOS_13_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130300, .decimal);
pub const __TVOS_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130400, .decimal);
pub const __TVOS_14_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140000, .decimal);
pub const __TVOS_14_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140100, .decimal);
pub const __TVOS_14_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140200, .decimal);
pub const __TVOS_14_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140300, .decimal);
pub const __TVOS_14_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140500, .decimal);
pub const __TVOS_14_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140600, .decimal);
pub const __TVOS_14_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140700, .decimal);
pub const __TVOS_15_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150000, .decimal);
pub const __WATCHOS_1_0 = @as(c_int, 10000);
pub const __WATCHOS_2_0 = @as(c_int, 20000);
pub const __WATCHOS_2_1 = @as(c_int, 20100);
pub const __WATCHOS_2_2 = @as(c_int, 20200);
pub const __WATCHOS_3_0 = @as(c_int, 30000);
pub const __WATCHOS_3_1 = @as(c_int, 30100);
pub const __WATCHOS_3_1_1 = @as(c_int, 30101);
pub const __WATCHOS_3_2 = @as(c_int, 30200);
pub const __WATCHOS_4_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40000, .decimal);
pub const __WATCHOS_4_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40100, .decimal);
pub const __WATCHOS_4_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40200, .decimal);
pub const __WATCHOS_4_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40300, .decimal);
pub const __WATCHOS_5_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50000, .decimal);
pub const __WATCHOS_5_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50100, .decimal);
pub const __WATCHOS_5_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50200, .decimal);
pub const __WATCHOS_5_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50300, .decimal);
pub const __WATCHOS_6_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60000, .decimal);
pub const __WATCHOS_6_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60100, .decimal);
pub const __WATCHOS_6_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60200, .decimal);
pub const __WATCHOS_7_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70000, .decimal);
pub const __WATCHOS_7_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70100, .decimal);
pub const __WATCHOS_7_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70200, .decimal);
pub const __WATCHOS_7_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70300, .decimal);
pub const __WATCHOS_7_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70400, .decimal);
pub const __WATCHOS_7_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70500, .decimal);
pub const __WATCHOS_7_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70600, .decimal);
pub const __WATCHOS_8_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80000, .decimal);
pub const MAC_OS_X_VERSION_10_0 = @as(c_int, 1000);
pub const MAC_OS_X_VERSION_10_1 = @as(c_int, 1010);
pub const MAC_OS_X_VERSION_10_2 = @as(c_int, 1020);
pub const MAC_OS_X_VERSION_10_3 = @as(c_int, 1030);
pub const MAC_OS_X_VERSION_10_4 = @as(c_int, 1040);
pub const MAC_OS_X_VERSION_10_5 = @as(c_int, 1050);
pub const MAC_OS_X_VERSION_10_6 = @as(c_int, 1060);
pub const MAC_OS_X_VERSION_10_7 = @as(c_int, 1070);
pub const MAC_OS_X_VERSION_10_8 = @as(c_int, 1080);
pub const MAC_OS_X_VERSION_10_9 = @as(c_int, 1090);
pub const MAC_OS_X_VERSION_10_10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101000, .decimal);
pub const MAC_OS_X_VERSION_10_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101002, .decimal);
pub const MAC_OS_X_VERSION_10_10_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101003, .decimal);
pub const MAC_OS_X_VERSION_10_11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101100, .decimal);
pub const MAC_OS_X_VERSION_10_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101102, .decimal);
pub const MAC_OS_X_VERSION_10_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101103, .decimal);
pub const MAC_OS_X_VERSION_10_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101104, .decimal);
pub const MAC_OS_X_VERSION_10_12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101200, .decimal);
pub const MAC_OS_X_VERSION_10_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101201, .decimal);
pub const MAC_OS_X_VERSION_10_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101202, .decimal);
pub const MAC_OS_X_VERSION_10_12_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101204, .decimal);
pub const MAC_OS_X_VERSION_10_13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101300, .decimal);
pub const MAC_OS_X_VERSION_10_13_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101301, .decimal);
pub const MAC_OS_X_VERSION_10_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101302, .decimal);
pub const MAC_OS_X_VERSION_10_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101304, .decimal);
pub const MAC_OS_X_VERSION_10_14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101400, .decimal);
pub const MAC_OS_X_VERSION_10_14_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101401, .decimal);
pub const MAC_OS_X_VERSION_10_14_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101404, .decimal);
pub const MAC_OS_X_VERSION_10_14_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101406, .decimal);
pub const MAC_OS_X_VERSION_10_15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101500, .decimal);
pub const MAC_OS_X_VERSION_10_15_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101501, .decimal);
pub const MAC_OS_X_VERSION_10_16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101600, .decimal);
pub const MAC_OS_VERSION_11_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110000, .decimal);
pub const MAC_OS_VERSION_12_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120000, .decimal);
pub const __DRIVERKIT_19_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 190000, .decimal);
pub const __DRIVERKIT_20_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 200000, .decimal);
pub const __DRIVERKIT_21_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210000, .decimal);
pub const __AVAILABILITY_INTERNAL__ = "";
pub const __MAC_OS_X_VERSION_MIN_REQUIRED = __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__;
pub const __MAC_OS_X_VERSION_MAX_ALLOWED = __MAC_12_0;
pub const __AVAILABILITY_INTERNAL_REGULAR = "";
pub const __ENABLE_LEGACY_MAC_AVAILABILITY = @as(c_int, 1);
pub inline fn __API_AVAILABLE1(x: anytype) @TypeOf(__API_A(x)) {
    return __API_A(x);
}
pub inline fn __API_RANGE_STRINGIFY(x: anytype) @TypeOf(__API_RANGE_STRINGIFY2(x)) {
    return __API_RANGE_STRINGIFY2(x);
}
pub inline fn __API_AVAILABLE_BEGIN1(a: anytype) @TypeOf(__API_A_BEGIN(a)) {
    return __API_A_BEGIN(a);
}
pub inline fn __API_DEPRECATED_MSG2(msg: anytype, x: anytype) @TypeOf(__API_D(msg, x)) {
    return __API_D(msg, x);
}
pub inline fn __API_DEPRECATED_BEGIN_MSG2(msg: anytype, a: anytype) @TypeOf(__API_D_BEGIN(msg, a)) {
    return __API_D_BEGIN(msg, a);
}
pub inline fn __API_DEPRECATED_REP2(rep: anytype, x: anytype) @TypeOf(__API_R(rep, x)) {
    return __API_R(rep, x);
}
pub inline fn __API_DEPRECATED_BEGIN_REP2(rep: anytype, a: anytype) @TypeOf(__API_R_BEGIN(rep, a)) {
    return __API_R_BEGIN(rep, a);
}
pub inline fn __API_UNAVAILABLE1(x: anytype) @TypeOf(__API_U(x)) {
    return __API_U(x);
}
pub inline fn __API_UNAVAILABLE_BEGIN1(a: anytype) @TypeOf(__API_U_BEGIN(a)) {
    return __API_U_BEGIN(a);
}
pub const _SIZE_T = "";
pub const NULL = __DARWIN_NULL;
pub const _RSIZE_T = "";
pub const _ERRNO_T = "";
pub const _SSIZE_T = "";
pub const _STRINGS_H_ = "";
pub const _SECURE__STRINGS_H_ = "";
pub const _SECURE__COMMON_H_ = "";
pub const _USE_FORTIFY_LEVEL = @as(c_int, 2);
pub inline fn __darwin_obsz0(object: anytype) @TypeOf(__builtin_object_size(object, @as(c_int, 0))) {
    return __builtin_object_size(object, @as(c_int, 0));
}
pub inline fn __darwin_obsz(object: anytype) @TypeOf(__builtin_object_size(object, if (_USE_FORTIFY_LEVEL > @as(c_int, 1)) @as(c_int, 1) else @as(c_int, 0))) {
    return __builtin_object_size(object, if (_USE_FORTIFY_LEVEL > @as(c_int, 1)) @as(c_int, 1) else @as(c_int, 0));
}
pub const _SECURE__STRING_H_ = "";
pub const __HAS_FIXED_CHK_PROTOTYPES = @as(c_int, 1);
pub const PBTOOLS_VERSION = "0.44.0";
pub const PBTOOLS_CONFIG_FLOAT = @as(c_int, 1);
pub const PBTOOLS_CONFIG_64BIT = @as(c_int, 1);
pub const PBTOOLS_BAD_WIRE_TYPE = @as(c_int, 1);
pub const PBTOOLS_OUT_OF_DATA = @as(c_int, 2);
pub const PBTOOLS_OUT_OF_MEMORY = @as(c_int, 3);
pub const PBTOOLS_ENCODE_BUFFER_FULL = @as(c_int, 4);
pub const PBTOOLS_BAD_FIELD_NUMBER = @as(c_int, 5);
pub const PBTOOLS_VARINT_OVERFLOW = @as(c_int, 6);
pub const PBTOOLS_SEEK_OVERFLOW = @as(c_int, 7);
pub const PBTOOLS_LENGTH_DELIMITED_OVERFLOW = @as(c_int, 8);
pub const PBTOOLS_WIRE_TYPE_VARINT = @as(c_int, 0);
pub const PBTOOLS_WIRE_TYPE_64_BIT = @as(c_int, 1);
pub const PBTOOLS_WIRE_TYPE_LENGTH_DELIMITED = @as(c_int, 2);
pub const PBTOOLS_WIRE_TYPE_32_BIT = @as(c_int, 5);
pub const __darwin_pthread_handler_rec = struct___darwin_pthread_handler_rec;
pub const _opaque_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const _opaque_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const _opaque_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const _opaque_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const _opaque_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const _opaque_pthread_once_t = struct__opaque_pthread_once_t;
pub const _opaque_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const _opaque_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const _opaque_pthread_t = struct__opaque_pthread_t;
pub const pbtools_heap_t = struct_pbtools_heap_t;
pub const pbtools_encoder_t = struct_pbtools_encoder_t;
pub const pbtools_decoder_t = struct_pbtools_decoder_t;
pub const pbtools_repeated_info_t = struct_pbtools_repeated_info_t;
pub const pbtools_bytes_t = struct_pbtools_bytes_t;
pub const pbtools_message_base_t = struct_pbtools_message_base_t;
pub const pbtools_repeated_int32_t = struct_pbtools_repeated_int32_t;
pub const pbtools_repeated_int64_t = struct_pbtools_repeated_int64_t;
pub const pbtools_repeated_uint32_t = struct_pbtools_repeated_uint32_t;
pub const pbtools_repeated_uint64_t = struct_pbtools_repeated_uint64_t;
pub const pbtools_repeated_float_t = struct_pbtools_repeated_float_t;
pub const pbtools_repeated_double_t = struct_pbtools_repeated_double_t;
pub const pbtools_repeated_bool_t = struct_pbtools_repeated_bool_t;
pub const pbtools_repeated_string_t = struct_pbtools_repeated_string_t;
pub const pbtools_repeated_bytes_t = struct_pbtools_repeated_bytes_t;
pub const pbtools_repeated_message_t = struct_pbtools_repeated_message_t;
pub const address_book_person_phone_type_e = enum_address_book_person_phone_type_e;
pub const address_book_person_phone_number_t = struct_address_book_person_phone_number_t;
pub const address_book_person_phone_number_repeated_t = struct_address_book_person_phone_number_repeated_t;
pub const address_book_person_t = struct_address_book_person_t;
pub const address_book_person_repeated_t = struct_address_book_person_repeated_t;
pub const address_book_address_book_t = struct_address_book_address_book_t;
pub const address_book_address_book_repeated_t = struct_address_book_address_book_repeated_t;
