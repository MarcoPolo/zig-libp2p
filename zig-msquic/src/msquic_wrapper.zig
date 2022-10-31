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
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
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
    __routine: ?*const fn (?*anyopaque) callconv(.C) void,
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
pub const __darwin_nl_item = c_int;
pub const __darwin_wctrans_t = c_int;
pub const __darwin_wctype_t = __uint32_t;
pub const P_ALL: c_int = 0;
pub const P_PID: c_int = 1;
pub const P_PGID: c_int = 2;
pub const idtype_t = c_uint;
pub const pid_t = __darwin_pid_t;
pub const id_t = __darwin_id_t;
pub const sig_atomic_t = c_int;
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
pub const struct___darwin_arm_exception_state = extern struct {
    __exception: __uint32_t,
    __fsr: __uint32_t,
    __far: __uint32_t,
};
pub const struct___darwin_arm_exception_state64 = extern struct {
    __far: __uint64_t,
    __esr: __uint32_t,
    __exception: __uint32_t,
};
pub const struct___darwin_arm_thread_state = extern struct {
    __r: [13]__uint32_t,
    __sp: __uint32_t,
    __lr: __uint32_t,
    __pc: __uint32_t,
    __cpsr: __uint32_t,
};
pub const struct___darwin_arm_thread_state64 = extern struct {
    __x: [29]__uint64_t,
    __fp: __uint64_t,
    __lr: __uint64_t,
    __sp: __uint64_t,
    __pc: __uint64_t,
    __cpsr: __uint32_t,
    __pad: __uint32_t,
};
pub const struct___darwin_arm_vfp_state = extern struct {
    __r: [64]__uint32_t,
    __fpscr: __uint32_t,
};
pub const __uint128_t = u128;
pub const struct___darwin_arm_neon_state64 = extern struct {
    __v: [32]__uint128_t,
    __fpsr: __uint32_t,
    __fpcr: __uint32_t,
};
pub const struct___darwin_arm_neon_state = extern struct {
    __v: [16]__uint128_t,
    __fpsr: __uint32_t,
    __fpcr: __uint32_t,
};
pub const struct___darwin_arm_amx_state_v1 = extern struct {
    __x: [8][64]__uint8_t,
    __y: [8][64]__uint8_t,
    __z: [64][64]__uint8_t,
    __amx_state_t_el1: __uint64_t,
};
pub const struct___arm_pagein_state = extern struct {
    __pagein_error: c_int,
};
pub const struct___arm_legacy_debug_state = extern struct {
    __bvr: [16]__uint32_t,
    __bcr: [16]__uint32_t,
    __wvr: [16]__uint32_t,
    __wcr: [16]__uint32_t,
};
pub const struct___darwin_arm_debug_state32 = extern struct {
    __bvr: [16]__uint32_t,
    __bcr: [16]__uint32_t,
    __wvr: [16]__uint32_t,
    __wcr: [16]__uint32_t,
    __mdscr_el1: __uint64_t,
};
pub const struct___darwin_arm_debug_state64 = extern struct {
    __bvr: [16]__uint64_t,
    __bcr: [16]__uint64_t,
    __wvr: [16]__uint64_t,
    __wcr: [16]__uint64_t,
    __mdscr_el1: __uint64_t,
};
pub const struct___darwin_arm_cpmu_state64 = extern struct {
    __ctrs: [16]__uint64_t,
};
pub const struct___darwin_mcontext32 = extern struct {
    __es: struct___darwin_arm_exception_state,
    __ss: struct___darwin_arm_thread_state,
    __fs: struct___darwin_arm_vfp_state,
};
pub const struct___darwin_mcontext64 = extern struct {
    __es: struct___darwin_arm_exception_state64,
    __ss: struct___darwin_arm_thread_state64,
    __ns: struct___darwin_arm_neon_state64,
};
pub const mcontext_t = [*c]struct___darwin_mcontext64;
pub const pthread_attr_t = __darwin_pthread_attr_t;
pub const struct___darwin_sigaltstack = extern struct {
    ss_sp: ?*anyopaque,
    ss_size: __darwin_size_t,
    ss_flags: c_int,
};
pub const stack_t = struct___darwin_sigaltstack;
pub const struct___darwin_ucontext = extern struct {
    uc_onstack: c_int,
    uc_sigmask: __darwin_sigset_t,
    uc_stack: struct___darwin_sigaltstack,
    uc_link: [*c]struct___darwin_ucontext,
    uc_mcsize: __darwin_size_t,
    uc_mcontext: [*c]struct___darwin_mcontext64,
};
pub const ucontext_t = struct___darwin_ucontext;
pub const sigset_t = __darwin_sigset_t;
pub const uid_t = __darwin_uid_t;
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const struct_sigevent = extern struct {
    sigev_notify: c_int,
    sigev_signo: c_int,
    sigev_value: union_sigval,
    sigev_notify_function: ?*const fn (union_sigval) callconv(.C) void,
    sigev_notify_attributes: [*c]pthread_attr_t,
};
pub const struct___siginfo = extern struct {
    si_signo: c_int,
    si_errno: c_int,
    si_code: c_int,
    si_pid: pid_t,
    si_uid: uid_t,
    si_status: c_int,
    si_addr: ?*anyopaque,
    si_value: union_sigval,
    si_band: c_long,
    __pad: [7]c_ulong,
};
pub const siginfo_t = struct___siginfo;
pub const union___sigaction_u = extern union {
    __sa_handler: ?*const fn (c_int) callconv(.C) void,
    __sa_sigaction: ?*const fn (c_int, [*c]struct___siginfo, ?*anyopaque) callconv(.C) void,
};
pub const struct___sigaction = extern struct {
    __sigaction_u: union___sigaction_u,
    sa_tramp: ?*const fn (?*anyopaque, c_int, c_int, [*c]siginfo_t, ?*anyopaque) callconv(.C) void,
    sa_mask: sigset_t,
    sa_flags: c_int,
};
pub const struct_sigaction = extern struct {
    __sigaction_u: union___sigaction_u,
    sa_mask: sigset_t,
    sa_flags: c_int,
};
pub const sig_t = ?*const fn (c_int) callconv(.C) void;
pub const struct_sigvec = extern struct {
    sv_handler: ?*const fn (c_int) callconv(.C) void,
    sv_mask: c_int,
    sv_flags: c_int,
};
pub const struct_sigstack = extern struct {
    ss_sp: [*c]u8,
    ss_onstack: c_int,
};
pub extern fn signal(c_int, ?*const fn (c_int) callconv(.C) void) ?*const fn (c_int) callconv(.C) void;
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
pub const intmax_t = c_long;
pub const uintmax_t = c_ulong;
pub const struct_timeval = extern struct {
    tv_sec: __darwin_time_t,
    tv_usec: __darwin_suseconds_t,
};
pub const rlim_t = __uint64_t;
pub const struct_rusage = extern struct {
    ru_utime: struct_timeval,
    ru_stime: struct_timeval,
    ru_maxrss: c_long,
    ru_ixrss: c_long,
    ru_idrss: c_long,
    ru_isrss: c_long,
    ru_minflt: c_long,
    ru_majflt: c_long,
    ru_nswap: c_long,
    ru_inblock: c_long,
    ru_oublock: c_long,
    ru_msgsnd: c_long,
    ru_msgrcv: c_long,
    ru_nsignals: c_long,
    ru_nvcsw: c_long,
    ru_nivcsw: c_long,
};
pub const rusage_info_t = ?*anyopaque;
pub const struct_rusage_info_v0 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
};
pub const struct_rusage_info_v1 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
};
pub const struct_rusage_info_v2 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
    ri_diskio_bytesread: u64,
    ri_diskio_byteswritten: u64,
};
pub const struct_rusage_info_v3 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
    ri_diskio_bytesread: u64,
    ri_diskio_byteswritten: u64,
    ri_cpu_time_qos_default: u64,
    ri_cpu_time_qos_maintenance: u64,
    ri_cpu_time_qos_background: u64,
    ri_cpu_time_qos_utility: u64,
    ri_cpu_time_qos_legacy: u64,
    ri_cpu_time_qos_user_initiated: u64,
    ri_cpu_time_qos_user_interactive: u64,
    ri_billed_system_time: u64,
    ri_serviced_system_time: u64,
};
pub const struct_rusage_info_v4 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
    ri_diskio_bytesread: u64,
    ri_diskio_byteswritten: u64,
    ri_cpu_time_qos_default: u64,
    ri_cpu_time_qos_maintenance: u64,
    ri_cpu_time_qos_background: u64,
    ri_cpu_time_qos_utility: u64,
    ri_cpu_time_qos_legacy: u64,
    ri_cpu_time_qos_user_initiated: u64,
    ri_cpu_time_qos_user_interactive: u64,
    ri_billed_system_time: u64,
    ri_serviced_system_time: u64,
    ri_logical_writes: u64,
    ri_lifetime_max_phys_footprint: u64,
    ri_instructions: u64,
    ri_cycles: u64,
    ri_billed_energy: u64,
    ri_serviced_energy: u64,
    ri_interval_max_phys_footprint: u64,
    ri_runnable_time: u64,
};
pub const struct_rusage_info_v5 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
    ri_diskio_bytesread: u64,
    ri_diskio_byteswritten: u64,
    ri_cpu_time_qos_default: u64,
    ri_cpu_time_qos_maintenance: u64,
    ri_cpu_time_qos_background: u64,
    ri_cpu_time_qos_utility: u64,
    ri_cpu_time_qos_legacy: u64,
    ri_cpu_time_qos_user_initiated: u64,
    ri_cpu_time_qos_user_interactive: u64,
    ri_billed_system_time: u64,
    ri_serviced_system_time: u64,
    ri_logical_writes: u64,
    ri_lifetime_max_phys_footprint: u64,
    ri_instructions: u64,
    ri_cycles: u64,
    ri_billed_energy: u64,
    ri_serviced_energy: u64,
    ri_interval_max_phys_footprint: u64,
    ri_runnable_time: u64,
    ri_flags: u64,
};
pub const rusage_info_current = struct_rusage_info_v5;
pub const struct_rlimit = extern struct {
    rlim_cur: rlim_t,
    rlim_max: rlim_t,
};
pub const struct_proc_rlimit_control_wakeupmon = extern struct {
    wm_flags: u32,
    wm_rate: i32,
};
pub extern fn getpriority(c_int, id_t) c_int;
pub extern fn getiopolicy_np(c_int, c_int) c_int;
pub extern fn getrlimit(c_int, [*c]struct_rlimit) c_int;
pub extern fn getrusage(c_int, [*c]struct_rusage) c_int;
pub extern fn setpriority(c_int, id_t, c_int) c_int;
pub extern fn setiopolicy_np(c_int, c_int, c_int) c_int;
pub extern fn setrlimit(c_int, [*c]const struct_rlimit) c_int;
pub fn _OSSwapInt16(arg__data: u16) callconv(.C) u16 {
    var _data = arg__data;
    return @bitCast(u16, @truncate(c_short, (@bitCast(c_int, @as(c_uint, _data)) << @intCast(@import("std").math.Log2Int(c_int), 8)) | (@bitCast(c_int, @as(c_uint, _data)) >> @intCast(@import("std").math.Log2Int(c_int), 8))));
}
pub fn _OSSwapInt32(arg__data: u32) callconv(.C) u32 {
    var _data = arg__data;
    _data = __builtin_bswap32(_data);
    return _data;
}
pub fn _OSSwapInt64(arg__data: u64) callconv(.C) u64 {
    var _data = arg__data;
    return __builtin_bswap64(_data);
}
pub const struct__OSUnalignedU16 = extern struct {
    __val: u16 align(1),
};
pub const struct__OSUnalignedU32 = extern struct {
    __val: u32 align(1),
};
pub const struct__OSUnalignedU64 = extern struct {
    __val: u64 align(1),
};
pub fn OSReadSwapInt16(arg__base: ?*const volatile anyopaque, arg__offset: usize) callconv(.C) u16 {
    var _base = arg__base;
    var _offset = arg__offset;
    return _OSSwapInt16(@intToPtr([*c]struct__OSUnalignedU16, @intCast(usize, @ptrToInt(_base)) +% _offset).*.__val);
}
pub fn OSReadSwapInt32(arg__base: ?*const volatile anyopaque, arg__offset: usize) callconv(.C) u32 {
    var _base = arg__base;
    var _offset = arg__offset;
    return _OSSwapInt32(@intToPtr([*c]struct__OSUnalignedU32, @intCast(usize, @ptrToInt(_base)) +% _offset).*.__val);
}
pub fn OSReadSwapInt64(arg__base: ?*const volatile anyopaque, arg__offset: usize) callconv(.C) u64 {
    var _base = arg__base;
    var _offset = arg__offset;
    return _OSSwapInt64(@intToPtr([*c]struct__OSUnalignedU64, @intCast(usize, @ptrToInt(_base)) +% _offset).*.__val);
}
pub fn OSWriteSwapInt16(arg__base: ?*volatile anyopaque, arg__offset: usize, arg__data: u16) callconv(.C) void {
    var _base = arg__base;
    var _offset = arg__offset;
    var _data = arg__data;
    @intToPtr([*c]struct__OSUnalignedU16, @intCast(usize, @ptrToInt(_base)) +% _offset).*.__val = _OSSwapInt16(_data);
}
pub fn OSWriteSwapInt32(arg__base: ?*volatile anyopaque, arg__offset: usize, arg__data: u32) callconv(.C) void {
    var _base = arg__base;
    var _offset = arg__offset;
    var _data = arg__data;
    @intToPtr([*c]struct__OSUnalignedU32, @intCast(usize, @ptrToInt(_base)) +% _offset).*.__val = _OSSwapInt32(_data);
}
pub fn OSWriteSwapInt64(arg__base: ?*volatile anyopaque, arg__offset: usize, arg__data: u64) callconv(.C) void {
    var _base = arg__base;
    var _offset = arg__offset;
    var _data = arg__data;
    @intToPtr([*c]struct__OSUnalignedU64, @intCast(usize, @ptrToInt(_base)) +% _offset).*.__val = _OSSwapInt64(_data);
} // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/wait.h:201:19: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_1 = opaque {}; // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/wait.h:220:19: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_2 = opaque {};
pub const union_wait = extern union {
    w_status: c_int,
    w_T: struct_unnamed_1,
    w_S: struct_unnamed_2,
};
pub extern fn wait([*c]c_int) pid_t;
pub extern fn waitpid(pid_t, [*c]c_int, c_int) pid_t;
pub extern fn waitid(idtype_t, id_t, [*c]siginfo_t, c_int) c_int;
pub extern fn wait3([*c]c_int, c_int, [*c]struct_rusage) pid_t;
pub extern fn wait4(pid_t, [*c]c_int, c_int, [*c]struct_rusage) pid_t;
pub extern fn alloca(c_ulong) ?*anyopaque;
pub const ct_rune_t = __darwin_ct_rune_t;
pub const rune_t = __darwin_rune_t;
pub const wchar_t = __darwin_wchar_t;
pub const div_t = extern struct {
    quot: c_int,
    rem: c_int,
};
pub const ldiv_t = extern struct {
    quot: c_long,
    rem: c_long,
};
pub const lldiv_t = extern struct {
    quot: c_longlong,
    rem: c_longlong,
};
pub extern var __mb_cur_max: c_int;
pub extern fn malloc(__size: c_ulong) ?*anyopaque;
pub extern fn calloc(__count: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn free(?*anyopaque) void;
pub extern fn realloc(__ptr: ?*anyopaque, __size: c_ulong) ?*anyopaque;
pub extern fn valloc(usize) ?*anyopaque;
pub extern fn aligned_alloc(__alignment: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn posix_memalign(__memptr: [*c]?*anyopaque, __alignment: usize, __size: usize) c_int;
pub extern fn abort() noreturn;
pub extern fn abs(c_int) c_int;
pub extern fn atexit(?*const fn () callconv(.C) void) c_int;
pub extern fn atof([*c]const u8) f64;
pub extern fn atoi([*c]const u8) c_int;
pub extern fn atol([*c]const u8) c_long;
pub extern fn atoll([*c]const u8) c_longlong;
pub extern fn bsearch(__key: ?*const anyopaque, __base: ?*const anyopaque, __nel: usize, __width: usize, __compar: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.C) c_int) ?*anyopaque;
pub extern fn div(c_int, c_int) div_t;
pub extern fn exit(c_int) noreturn;
pub extern fn getenv([*c]const u8) [*c]u8;
pub extern fn labs(c_long) c_long;
pub extern fn ldiv(c_long, c_long) ldiv_t;
pub extern fn llabs(c_longlong) c_longlong;
pub extern fn lldiv(c_longlong, c_longlong) lldiv_t;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbstowcs(noalias [*c]wchar_t, noalias [*c]const u8, usize) usize;
pub extern fn mbtowc(noalias [*c]wchar_t, noalias [*c]const u8, usize) c_int;
pub extern fn qsort(__base: ?*anyopaque, __nel: usize, __width: usize, __compar: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.C) c_int) void;
pub extern fn rand() c_int;
pub extern fn srand(c_uint) void;
pub extern fn strtod([*c]const u8, [*c][*c]u8) f64;
pub extern fn strtof([*c]const u8, [*c][*c]u8) f32;
pub extern fn strtol(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtold([*c]const u8, [*c][*c]u8) c_longdouble;
pub extern fn strtoll(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoul(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoull(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn system([*c]const u8) c_int;
pub extern fn wcstombs(noalias [*c]u8, noalias [*c]const wchar_t, usize) usize;
pub extern fn wctomb([*c]u8, wchar_t) c_int;
pub extern fn _Exit(c_int) noreturn;
pub extern fn a64l([*c]const u8) c_long;
pub extern fn drand48() f64;
pub extern fn ecvt(f64, c_int, noalias [*c]c_int, noalias [*c]c_int) [*c]u8;
pub extern fn erand48([*c]c_ushort) f64;
pub extern fn fcvt(f64, c_int, noalias [*c]c_int, noalias [*c]c_int) [*c]u8;
pub extern fn gcvt(f64, c_int, [*c]u8) [*c]u8;
pub extern fn getsubopt([*c][*c]u8, [*c]const [*c]u8, [*c][*c]u8) c_int;
pub extern fn grantpt(c_int) c_int;
pub extern fn initstate(c_uint, [*c]u8, usize) [*c]u8;
pub extern fn jrand48([*c]c_ushort) c_long;
pub extern fn l64a(c_long) [*c]u8;
pub extern fn lcong48([*c]c_ushort) void;
pub extern fn lrand48() c_long;
pub extern fn mktemp([*c]u8) [*c]u8;
pub extern fn mkstemp([*c]u8) c_int;
pub extern fn mrand48() c_long;
pub extern fn nrand48([*c]c_ushort) c_long;
pub extern fn posix_openpt(c_int) c_int;
pub extern fn ptsname(c_int) [*c]u8;
pub extern fn ptsname_r(fildes: c_int, buffer: [*c]u8, buflen: usize) c_int;
pub extern fn putenv([*c]u8) c_int;
pub extern fn random() c_long;
pub extern fn rand_r([*c]c_uint) c_int;
pub extern fn realpath(noalias [*c]const u8, noalias [*c]u8) [*c]u8;
pub extern fn seed48([*c]c_ushort) [*c]c_ushort;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __overwrite: c_int) c_int;
pub extern fn setkey([*c]const u8) void;
pub extern fn setstate([*c]const u8) [*c]u8;
pub extern fn srand48(c_long) void;
pub extern fn srandom(c_uint) void;
pub extern fn unlockpt(c_int) c_int;
pub extern fn unsetenv([*c]const u8) c_int;
pub const dev_t = __darwin_dev_t;
pub const mode_t = __darwin_mode_t;
pub extern fn arc4random() u32;
pub extern fn arc4random_addrandom([*c]u8, c_int) void;
pub extern fn arc4random_buf(__buf: ?*anyopaque, __nbytes: usize) void;
pub extern fn arc4random_stir() void;
pub extern fn arc4random_uniform(__upper_bound: u32) u32; // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:275:6: warning: unsupported type: 'BlockPointer'
pub const atexit_b = @compileError("unable to resolve prototype of function"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:275:6
// /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:276:7: warning: unsupported type: 'BlockPointer'
pub const bsearch_b = @compileError("unable to resolve prototype of function"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:276:7
pub extern fn cgetcap([*c]u8, [*c]const u8, c_int) [*c]u8;
pub extern fn cgetclose() c_int;
pub extern fn cgetent([*c][*c]u8, [*c][*c]u8, [*c]const u8) c_int;
pub extern fn cgetfirst([*c][*c]u8, [*c][*c]u8) c_int;
pub extern fn cgetmatch([*c]const u8, [*c]const u8) c_int;
pub extern fn cgetnext([*c][*c]u8, [*c][*c]u8) c_int;
pub extern fn cgetnum([*c]u8, [*c]const u8, [*c]c_long) c_int;
pub extern fn cgetset([*c]const u8) c_int;
pub extern fn cgetstr([*c]u8, [*c]const u8, [*c][*c]u8) c_int;
pub extern fn cgetustr([*c]u8, [*c]const u8, [*c][*c]u8) c_int;
pub extern fn daemon(c_int, c_int) c_int;
pub extern fn devname(dev_t, mode_t) [*c]u8;
pub extern fn devname_r(dev_t, mode_t, buf: [*c]u8, len: c_int) [*c]u8;
pub extern fn getbsize([*c]c_int, [*c]c_long) [*c]u8;
pub extern fn getloadavg([*c]f64, c_int) c_int;
pub extern fn getprogname() [*c]const u8;
pub extern fn setprogname([*c]const u8) void;
pub extern fn heapsort(__base: ?*anyopaque, __nel: usize, __width: usize, __compar: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.C) c_int) c_int; // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:312:6: warning: unsupported type: 'BlockPointer'
pub const heapsort_b = @compileError("unable to resolve prototype of function"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:312:6
pub extern fn mergesort(__base: ?*anyopaque, __nel: usize, __width: usize, __compar: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.C) c_int) c_int; // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:319:6: warning: unsupported type: 'BlockPointer'
pub const mergesort_b = @compileError("unable to resolve prototype of function"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:319:6
pub extern fn psort(__base: ?*anyopaque, __nel: usize, __width: usize, __compar: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.C) c_int) void; // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:327:7: warning: unsupported type: 'BlockPointer'
pub const psort_b = @compileError("unable to resolve prototype of function"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:327:7
pub extern fn psort_r(__base: ?*anyopaque, __nel: usize, __width: usize, ?*anyopaque, __compar: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.C) c_int) void; // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:335:7: warning: unsupported type: 'BlockPointer'
pub const qsort_b = @compileError("unable to resolve prototype of function"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:335:7
pub extern fn qsort_r(__base: ?*anyopaque, __nel: usize, __width: usize, ?*anyopaque, __compar: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.C) c_int) void;
pub extern fn radixsort(__base: [*c][*c]const u8, __nel: c_int, __table: [*c]const u8, __endbyte: c_uint) c_int;
pub extern fn rpmatch([*c]const u8) c_int;
pub extern fn sradixsort(__base: [*c][*c]const u8, __nel: c_int, __table: [*c]const u8, __endbyte: c_uint) c_int;
pub extern fn sranddev() void;
pub extern fn srandomdev() void;
pub extern fn reallocf(__ptr: ?*anyopaque, __size: usize) ?*anyopaque;
pub extern fn strtonum(__numstr: [*c]const u8, __minval: c_longlong, __maxval: c_longlong, __errstrp: [*c][*c]const u8) c_longlong;
pub extern fn strtoq(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtouq(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern var suboptarg: [*c]u8;
pub const va_list = __darwin_va_list;
pub extern fn renameat(c_int, [*c]const u8, c_int, [*c]const u8) c_int;
pub extern fn renamex_np([*c]const u8, [*c]const u8, c_uint) c_int;
pub extern fn renameatx_np(c_int, [*c]const u8, c_int, [*c]const u8, c_uint) c_int;
pub const fpos_t = __darwin_off_t;
pub const struct___sbuf = extern struct {
    _base: [*c]u8,
    _size: c_int,
};
pub const struct___sFILEX = opaque {};
pub const struct___sFILE = extern struct {
    _p: [*c]u8,
    _r: c_int,
    _w: c_int,
    _flags: c_short,
    _file: c_short,
    _bf: struct___sbuf,
    _lbfsize: c_int,
    _cookie: ?*anyopaque,
    _close: ?*const fn (?*anyopaque) callconv(.C) c_int,
    _read: ?*const fn (?*anyopaque, [*c]u8, c_int) callconv(.C) c_int,
    _seek: ?*const fn (?*anyopaque, fpos_t, c_int) callconv(.C) fpos_t,
    _write: ?*const fn (?*anyopaque, [*c]const u8, c_int) callconv(.C) c_int,
    _ub: struct___sbuf,
    _extra: ?*struct___sFILEX,
    _ur: c_int,
    _ubuf: [3]u8,
    _nbuf: [1]u8,
    _lb: struct___sbuf,
    _blksize: c_int,
    _offset: fpos_t,
};
pub const FILE = struct___sFILE;
pub extern var __stdinp: [*c]FILE;
pub extern var __stdoutp: [*c]FILE;
pub extern var __stderrp: [*c]FILE;
pub extern fn clearerr([*c]FILE) void;
pub extern fn fclose([*c]FILE) c_int;
pub extern fn feof([*c]FILE) c_int;
pub extern fn ferror([*c]FILE) c_int;
pub extern fn fflush([*c]FILE) c_int;
pub extern fn fgetc([*c]FILE) c_int;
pub extern fn fgetpos(noalias [*c]FILE, [*c]fpos_t) c_int;
pub extern fn fgets(noalias [*c]u8, c_int, [*c]FILE) [*c]u8;
pub extern fn fopen(__filename: [*c]const u8, __mode: [*c]const u8) [*c]FILE;
pub extern fn fprintf([*c]FILE, [*c]const u8, ...) c_int;
pub extern fn fputc(c_int, [*c]FILE) c_int;
pub extern fn fputs(noalias [*c]const u8, noalias [*c]FILE) c_int;
pub extern fn fread(__ptr: ?*anyopaque, __size: c_ulong, __nitems: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn freopen(noalias [*c]const u8, noalias [*c]const u8, noalias [*c]FILE) [*c]FILE;
pub extern fn fscanf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn fseek([*c]FILE, c_long, c_int) c_int;
pub extern fn fsetpos([*c]FILE, [*c]const fpos_t) c_int;
pub extern fn ftell([*c]FILE) c_long;
pub extern fn fwrite(__ptr: ?*const anyopaque, __size: c_ulong, __nitems: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn getc([*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn gets([*c]u8) [*c]u8;
pub extern fn perror([*c]const u8) void;
pub extern fn printf([*c]const u8, ...) c_int;
pub extern fn putc(c_int, [*c]FILE) c_int;
pub extern fn putchar(c_int) c_int;
pub extern fn puts([*c]const u8) c_int;
pub extern fn remove([*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn rewind([*c]FILE) void;
pub extern fn scanf(noalias [*c]const u8, ...) c_int;
pub extern fn setbuf(noalias [*c]FILE, noalias [*c]u8) void;
pub extern fn setvbuf(noalias [*c]FILE, noalias [*c]u8, c_int, usize) c_int;
pub extern fn sprintf([*c]u8, [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias [*c]const u8, noalias [*c]const u8, ...) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn ungetc(c_int, [*c]FILE) c_int;
pub extern fn vfprintf([*c]FILE, [*c]const u8, __builtin_va_list) c_int;
pub extern fn vprintf([*c]const u8, __builtin_va_list) c_int;
pub extern fn vsprintf([*c]u8, [*c]const u8, __builtin_va_list) c_int;
pub extern fn ctermid([*c]u8) [*c]u8;
pub extern fn fdopen(c_int, [*c]const u8) [*c]FILE;
pub extern fn fileno([*c]FILE) c_int;
pub extern fn pclose([*c]FILE) c_int;
pub extern fn popen([*c]const u8, [*c]const u8) [*c]FILE;
pub extern fn __srget([*c]FILE) c_int;
pub extern fn __svfscanf([*c]FILE, [*c]const u8, va_list) c_int;
pub extern fn __swbuf(c_int, [*c]FILE) c_int;
pub inline fn __sputc(arg__c: c_int, arg__p: [*c]FILE) c_int {
    var _c = arg__c;
    var _p = arg__p;
    if (((blk: {
        const ref = &_p.*._w;
        ref.* -= 1;
        break :blk ref.*;
    }) >= @as(c_int, 0)) or ((_p.*._w >= _p.*._lbfsize) and (@bitCast(c_int, @as(c_uint, @bitCast(u8, @truncate(i8, _c)))) != @as(c_int, '\n')))) return @bitCast(c_int, @as(c_uint, blk: {
        const tmp = @bitCast(u8, @truncate(i8, _c));
        (blk_1: {
            const ref = &_p.*._p;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        }).* = tmp;
        break :blk tmp;
    })) else return __swbuf(_c, _p);
    return 0;
}
pub extern fn flockfile([*c]FILE) void;
pub extern fn ftrylockfile([*c]FILE) c_int;
pub extern fn funlockfile([*c]FILE) void;
pub extern fn getc_unlocked([*c]FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn putc_unlocked(c_int, [*c]FILE) c_int;
pub extern fn putchar_unlocked(c_int) c_int;
pub extern fn getw([*c]FILE) c_int;
pub extern fn putw(c_int, [*c]FILE) c_int;
pub extern fn tempnam(__dir: [*c]const u8, __prefix: [*c]const u8) [*c]u8;
pub const off_t = __darwin_off_t;
pub extern fn fseeko(__stream: [*c]FILE, __offset: off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: [*c]FILE) off_t;
pub extern fn snprintf(__str: [*c]u8, __size: c_ulong, __format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, __builtin_va_list) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __builtin_va_list) c_int;
pub extern fn vsnprintf(__str: [*c]u8, __size: c_ulong, __format: [*c]const u8, __builtin_va_list) c_int;
pub extern fn vsscanf(noalias __str: [*c]const u8, noalias __format: [*c]const u8, __builtin_va_list) c_int;
pub extern fn dprintf(c_int, noalias [*c]const u8, ...) c_int;
pub extern fn vdprintf(c_int, noalias [*c]const u8, va_list) c_int;
pub extern fn getdelim(noalias __linep: [*c][*c]u8, noalias __linecapp: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) isize;
pub extern fn getline(noalias __linep: [*c][*c]u8, noalias __linecapp: [*c]usize, noalias __stream: [*c]FILE) isize;
pub extern fn fmemopen(noalias __buf: ?*anyopaque, __size: usize, noalias __mode: [*c]const u8) [*c]FILE;
pub extern fn open_memstream(__bufp: [*c][*c]u8, __sizep: [*c]usize) [*c]FILE;
pub extern const sys_nerr: c_int;
pub extern const sys_errlist: [*c]const [*c]const u8;
pub extern fn asprintf(noalias [*c][*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn ctermid_r([*c]u8) [*c]u8;
pub extern fn fgetln([*c]FILE, [*c]usize) [*c]u8;
pub extern fn fmtcheck([*c]const u8, [*c]const u8) [*c]const u8;
pub extern fn fpurge([*c]FILE) c_int;
pub extern fn setbuffer([*c]FILE, [*c]u8, c_int) void;
pub extern fn setlinebuf([*c]FILE) c_int;
pub extern fn vasprintf(noalias [*c][*c]u8, noalias [*c]const u8, va_list) c_int;
pub extern fn zopen([*c]const u8, [*c]const u8, c_int) [*c]FILE;
pub extern fn funopen(?*const anyopaque, ?*const fn (?*anyopaque, [*c]u8, c_int) callconv(.C) c_int, ?*const fn (?*anyopaque, [*c]const u8, c_int) callconv(.C) c_int, ?*const fn (?*anyopaque, fpos_t, c_int) callconv(.C) fpos_t, ?*const fn (?*anyopaque) callconv(.C) c_int) [*c]FILE;
pub extern fn __sprintf_chk(noalias [*c]u8, c_int, usize, noalias [*c]const u8, ...) c_int;
pub extern fn __snprintf_chk(noalias [*c]u8, usize, c_int, usize, noalias [*c]const u8, ...) c_int;
pub extern fn __vsprintf_chk(noalias [*c]u8, c_int, usize, noalias [*c]const u8, va_list) c_int;
pub extern fn __vsnprintf_chk(noalias [*c]u8, usize, c_int, usize, noalias [*c]const u8, va_list) c_int;
pub const u_char = u8;
pub const u_short = c_ushort;
pub const u_int = c_uint;
pub const u_long = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_quad_t = u_int64_t;
pub const quad_t = i64;
pub const qaddr_t = [*c]quad_t;
pub const caddr_t = [*c]u8;
pub const daddr_t = i32;
pub const fixpt_t = u_int32_t;
pub const blkcnt_t = __darwin_blkcnt_t;
pub const blksize_t = __darwin_blksize_t;
pub const gid_t = __darwin_gid_t;
pub const in_addr_t = __uint32_t;
pub const in_port_t = __uint16_t;
pub const ino_t = __darwin_ino_t;
pub const ino64_t = __darwin_ino64_t;
pub const key_t = __int32_t;
pub const nlink_t = __uint16_t;
pub const segsz_t = i32;
pub const swblk_t = i32;
pub const clock_t = __darwin_clock_t;
pub const time_t = __darwin_time_t;
pub const useconds_t = __darwin_useconds_t;
pub const suseconds_t = __darwin_suseconds_t;
pub const rsize_t = __darwin_size_t;
pub const errno_t = c_int;
pub const struct_fd_set = extern struct {
    fds_bits: [32]__int32_t,
};
pub const fd_set = struct_fd_set;
pub extern fn __darwin_check_fd_set_overflow(c_int, ?*const anyopaque, c_int) c_int;
pub inline fn __darwin_check_fd_set(arg__a: c_int, arg__b: ?*const anyopaque) c_int {
    var _a = arg__a;
    var _b = arg__b;
    if (@intCast(usize, @ptrToInt(&__darwin_check_fd_set_overflow)) != @bitCast(usize, @as(c_long, @as(c_int, 0)))) {
        return __darwin_check_fd_set_overflow(_a, _b, @as(c_int, 0));
    } else {
        return 1;
    }
    return 0;
}
pub inline fn __darwin_fd_isset(arg__fd: c_int, arg__p: [*c]const struct_fd_set) c_int {
    var _fd = arg__fd;
    var _p = arg__p;
    if (__darwin_check_fd_set(_fd, @ptrCast(?*const anyopaque, _p)) != 0) {
        return _p.*.fds_bits[@bitCast(c_ulong, @as(c_long, _fd)) / (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))] & @bitCast(__int32_t, @truncate(c_uint, @bitCast(c_ulong, @as(c_long, @as(c_int, 1))) << @intCast(@import("std").math.Log2Int(c_ulong), @bitCast(c_ulong, @as(c_long, _fd)) % (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))));
    }
    return 0;
}
pub inline fn __darwin_fd_set(arg__fd: c_int, _p: [*c]struct_fd_set) void {
    var _fd = arg__fd;
    if (__darwin_check_fd_set(_fd, @ptrCast(?*const anyopaque, _p)) != 0) {
        _ = blk: {
            const ref = &_p.*.fds_bits[@bitCast(c_ulong, @as(c_long, _fd)) / (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))];
            ref.* |= @bitCast(__int32_t, @truncate(c_uint, @bitCast(c_ulong, @as(c_long, @as(c_int, 1))) << @intCast(@import("std").math.Log2Int(c_ulong), @bitCast(c_ulong, @as(c_long, _fd)) % (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))));
            break :blk ref.*;
        };
    }
}
pub inline fn __darwin_fd_clr(arg__fd: c_int, _p: [*c]struct_fd_set) void {
    var _fd = arg__fd;
    if (__darwin_check_fd_set(_fd, @ptrCast(?*const anyopaque, _p)) != 0) {
        _ = blk: {
            const ref = &_p.*.fds_bits[@bitCast(c_ulong, @as(c_long, _fd)) / (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))];
            ref.* &= ~@bitCast(__int32_t, @truncate(c_uint, @bitCast(c_ulong, @as(c_long, @as(c_int, 1))) << @intCast(@import("std").math.Log2Int(c_ulong), @bitCast(c_ulong, @as(c_long, _fd)) % (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))));
            break :blk ref.*;
        };
    }
}
pub const fd_mask = __int32_t;
pub const pthread_cond_t = __darwin_pthread_cond_t;
pub const pthread_condattr_t = __darwin_pthread_condattr_t;
pub const pthread_mutex_t = __darwin_pthread_mutex_t;
pub const pthread_mutexattr_t = __darwin_pthread_mutexattr_t;
pub const pthread_once_t = __darwin_pthread_once_t;
pub const pthread_rwlock_t = __darwin_pthread_rwlock_t;
pub const pthread_rwlockattr_t = __darwin_pthread_rwlockattr_t;
pub const pthread_t = __darwin_pthread_t;
pub const pthread_key_t = __darwin_pthread_key_t;
pub const fsblkcnt_t = __darwin_fsblkcnt_t;
pub const fsfilcnt_t = __darwin_fsfilcnt_t;
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
pub extern fn __assert_rtn([*c]const u8, [*c]const u8, c_int, [*c]const u8) noreturn;
pub extern fn imaxabs(j: intmax_t) intmax_t;
pub const imaxdiv_t = extern struct {
    quot: intmax_t,
    rem: intmax_t,
};
pub extern fn imaxdiv(__numer: intmax_t, __denom: intmax_t) imaxdiv_t;
pub extern fn strtoimax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) intmax_t;
pub extern fn strtoumax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) uintmax_t;
pub extern fn wcstoimax(noalias __nptr: [*c]const wchar_t, noalias __endptr: [*c][*c]wchar_t, __base: c_int) intmax_t;
pub extern fn wcstoumax(noalias __nptr: [*c]const wchar_t, noalias __endptr: [*c][*c]wchar_t, __base: c_int) uintmax_t;
pub const ptrdiff_t = __darwin_ptrdiff_t;
pub const wint_t = __darwin_wint_t;
pub const max_align_t = c_longdouble;
pub const socklen_t = __darwin_socklen_t;
pub const sa_family_t = __uint8_t;
pub const struct_iovec = extern struct {
    iov_base: ?*anyopaque,
    iov_len: usize,
};
pub const sae_associd_t = __uint32_t;
pub const sae_connid_t = __uint32_t;
pub const struct_sockaddr = extern struct {
    sa_len: __uint8_t,
    sa_family: sa_family_t,
    sa_data: [14]u8,
};
pub const struct_sa_endpoints = extern struct {
    sae_srcif: c_uint,
    sae_srcaddr: [*c]const struct_sockaddr,
    sae_srcaddrlen: socklen_t,
    sae_dstaddr: [*c]const struct_sockaddr,
    sae_dstaddrlen: socklen_t,
};
pub const sa_endpoints_t = struct_sa_endpoints;
pub const struct_linger = extern struct {
    l_onoff: c_int,
    l_linger: c_int,
};
pub const struct_so_np_extensions = extern struct {
    npx_flags: u_int32_t,
    npx_mask: u_int32_t,
};
pub const struct_sockproto = extern struct {
    sp_family: __uint16_t,
    sp_protocol: __uint16_t,
};
pub const struct_sockaddr_storage = extern struct {
    ss_len: __uint8_t,
    ss_family: sa_family_t,
    __ss_pad1: [6]u8,
    __ss_align: __int64_t,
    __ss_pad2: [112]u8,
};
pub const struct_msghdr = extern struct {
    msg_name: ?*anyopaque,
    msg_namelen: socklen_t,
    msg_iov: [*c]struct_iovec,
    msg_iovlen: c_int,
    msg_control: ?*anyopaque,
    msg_controllen: socklen_t,
    msg_flags: c_int,
};
pub const struct_cmsghdr = extern struct {
    cmsg_len: socklen_t,
    cmsg_level: c_int,
    cmsg_type: c_int,
};
pub const struct_sf_hdtr = extern struct {
    headers: [*c]struct_iovec,
    hdr_cnt: c_int,
    trailers: [*c]struct_iovec,
    trl_cnt: c_int,
};
pub extern fn accept(c_int, noalias [*c]struct_sockaddr, noalias [*c]socklen_t) c_int;
pub extern fn bind(c_int, [*c]const struct_sockaddr, socklen_t) c_int;
pub extern fn connect(c_int, [*c]const struct_sockaddr, socklen_t) c_int;
pub extern fn getpeername(c_int, noalias [*c]struct_sockaddr, noalias [*c]socklen_t) c_int;
pub extern fn getsockname(c_int, noalias [*c]struct_sockaddr, noalias [*c]socklen_t) c_int;
pub extern fn getsockopt(c_int, c_int, c_int, noalias ?*anyopaque, noalias [*c]socklen_t) c_int;
pub extern fn listen(c_int, c_int) c_int;
pub extern fn recv(c_int, ?*anyopaque, usize, c_int) isize;
pub extern fn recvfrom(c_int, ?*anyopaque, usize, c_int, noalias [*c]struct_sockaddr, noalias [*c]socklen_t) isize;
pub extern fn recvmsg(c_int, [*c]struct_msghdr, c_int) isize;
pub extern fn send(c_int, ?*const anyopaque, usize, c_int) isize;
pub extern fn sendmsg(c_int, [*c]const struct_msghdr, c_int) isize;
pub extern fn sendto(c_int, ?*const anyopaque, usize, c_int, [*c]const struct_sockaddr, socklen_t) isize;
pub extern fn setsockopt(c_int, c_int, c_int, ?*const anyopaque, socklen_t) c_int;
pub extern fn shutdown(c_int, c_int) c_int;
pub extern fn sockatmark(c_int) c_int;
pub extern fn socket(c_int, c_int, c_int) c_int;
pub extern fn socketpair(c_int, c_int, c_int, [*c]c_int) c_int;
pub extern fn sendfile(c_int, c_int, off_t, [*c]off_t, [*c]struct_sf_hdtr, c_int) c_int;
pub extern fn pfctlinput(c_int, [*c]struct_sockaddr) void;
pub extern fn connectx(c_int, [*c]const sa_endpoints_t, sae_associd_t, c_uint, [*c]const struct_iovec, c_uint, [*c]usize, [*c]sae_connid_t) c_int;
pub extern fn disconnectx(c_int, sae_associd_t, sae_connid_t) c_int;
pub const struct_in_addr = extern struct {
    s_addr: in_addr_t,
};
pub const struct_sockaddr_in = extern struct {
    sin_len: __uint8_t,
    sin_family: sa_family_t,
    sin_port: in_port_t,
    sin_addr: struct_in_addr,
    sin_zero: [8]u8,
};
pub const struct_ip_opts = extern struct {
    ip_dst: struct_in_addr,
    ip_opts: [40]u8,
};
pub const struct_ip_mreq = extern struct {
    imr_multiaddr: struct_in_addr,
    imr_interface: struct_in_addr,
};
pub const struct_ip_mreqn = extern struct {
    imr_multiaddr: struct_in_addr,
    imr_address: struct_in_addr,
    imr_ifindex: c_int,
};
pub const struct_ip_mreq_source = extern struct {
    imr_multiaddr: struct_in_addr,
    imr_sourceaddr: struct_in_addr,
    imr_interface: struct_in_addr,
};
pub const struct_group_req = extern struct {
    gr_interface: u32,
    gr_group: struct_sockaddr_storage,
};
pub const struct_group_source_req = extern struct {
    gsr_interface: u32,
    gsr_group: struct_sockaddr_storage,
    gsr_source: struct_sockaddr_storage,
};
pub const struct___msfilterreq = extern struct {
    msfr_ifindex: u32,
    msfr_fmode: u32,
    msfr_nsrcs: u32,
    __msfr_align: u32,
    msfr_group: struct_sockaddr_storage,
    msfr_srcs: [*c]struct_sockaddr_storage,
};
pub extern fn setipv4sourcefilter(c_int, struct_in_addr, struct_in_addr, u32, u32, [*c]struct_in_addr) c_int;
pub extern fn getipv4sourcefilter(c_int, struct_in_addr, struct_in_addr, [*c]u32, [*c]u32, [*c]struct_in_addr) c_int;
pub extern fn setsourcefilter(c_int, u32, [*c]struct_sockaddr, socklen_t, u32, u32, [*c]struct_sockaddr_storage) c_int;
pub extern fn getsourcefilter(c_int, u32, [*c]struct_sockaddr, socklen_t, [*c]u32, [*c]u32, [*c]struct_sockaddr_storage) c_int;
pub const struct_in_pktinfo = extern struct {
    ipi_ifindex: c_uint,
    ipi_spec_dst: struct_in_addr,
    ipi_addr: struct_in_addr,
};
const union_unnamed_3 = extern union {
    __u6_addr8: [16]__uint8_t,
    __u6_addr16: [8]__uint16_t,
    __u6_addr32: [4]__uint32_t,
};
pub const struct_in6_addr = extern struct {
    __u6_addr: union_unnamed_3,
};
pub const in6_addr_t = struct_in6_addr;
pub const struct_sockaddr_in6 = extern struct {
    sin6_len: __uint8_t,
    sin6_family: sa_family_t,
    sin6_port: in_port_t,
    sin6_flowinfo: __uint32_t,
    sin6_addr: struct_in6_addr,
    sin6_scope_id: __uint32_t,
};
pub extern const in6addr_any: struct_in6_addr;
pub extern const in6addr_loopback: struct_in6_addr;
pub extern const in6addr_nodelocal_allnodes: struct_in6_addr;
pub extern const in6addr_linklocal_allnodes: struct_in6_addr;
pub extern const in6addr_linklocal_allrouters: struct_in6_addr;
pub extern const in6addr_linklocal_allv2routers: struct_in6_addr;
pub const struct_ipv6_mreq = extern struct {
    ipv6mr_multiaddr: struct_in6_addr,
    ipv6mr_interface: c_uint,
};
pub const struct_in6_pktinfo = extern struct {
    ipi6_addr: struct_in6_addr,
    ipi6_ifindex: c_uint,
};
pub const struct_ip6_mtuinfo = extern struct {
    ip6m_addr: struct_sockaddr_in6,
    ip6m_mtu: u32,
};
pub extern fn inet6_option_space(c_int) c_int;
pub extern fn inet6_option_init(?*anyopaque, [*c][*c]struct_cmsghdr, c_int) c_int;
pub extern fn inet6_option_append([*c]struct_cmsghdr, [*c]const __uint8_t, c_int, c_int) c_int;
pub extern fn inet6_option_alloc([*c]struct_cmsghdr, c_int, c_int, c_int) [*c]__uint8_t;
pub extern fn inet6_option_next([*c]const struct_cmsghdr, [*c][*c]__uint8_t) c_int;
pub extern fn inet6_option_find([*c]const struct_cmsghdr, [*c][*c]__uint8_t, c_int) c_int;
pub extern fn inet6_rthdr_space(c_int, c_int) usize;
pub extern fn inet6_rthdr_init(?*anyopaque, c_int) [*c]struct_cmsghdr;
pub extern fn inet6_rthdr_add([*c]struct_cmsghdr, [*c]const struct_in6_addr, c_uint) c_int;
pub extern fn inet6_rthdr_lasthop([*c]struct_cmsghdr, c_uint) c_int;
pub extern fn inet6_rthdr_segments([*c]const struct_cmsghdr) c_int;
pub extern fn inet6_rthdr_getaddr([*c]struct_cmsghdr, c_int) [*c]struct_in6_addr;
pub extern fn inet6_rthdr_getflags([*c]const struct_cmsghdr, c_int) c_int;
pub extern fn inet6_opt_init(?*anyopaque, socklen_t) c_int;
pub extern fn inet6_opt_append(?*anyopaque, socklen_t, c_int, __uint8_t, socklen_t, __uint8_t, [*c]?*anyopaque) c_int;
pub extern fn inet6_opt_finish(?*anyopaque, socklen_t, c_int) c_int;
pub extern fn inet6_opt_set_val(?*anyopaque, c_int, ?*anyopaque, socklen_t) c_int;
pub extern fn inet6_opt_next(?*anyopaque, socklen_t, c_int, [*c]__uint8_t, [*c]socklen_t, [*c]?*anyopaque) c_int;
pub extern fn inet6_opt_find(?*anyopaque, socklen_t, c_int, __uint8_t, [*c]socklen_t, [*c]?*anyopaque) c_int;
pub extern fn inet6_opt_get_val(?*anyopaque, c_int, ?*anyopaque, socklen_t) c_int;
pub extern fn inet6_rth_space(c_int, c_int) socklen_t;
pub extern fn inet6_rth_init(?*anyopaque, socklen_t, c_int, c_int) ?*anyopaque;
pub extern fn inet6_rth_add(?*anyopaque, [*c]const struct_in6_addr) c_int;
pub extern fn inet6_rth_reverse(?*const anyopaque, ?*anyopaque) c_int;
pub extern fn inet6_rth_segments(?*const anyopaque) c_int;
pub extern fn inet6_rth_getaddr(?*const anyopaque, c_int) [*c]struct_in6_addr;
pub extern fn bindresvport(c_int, [*c]struct_sockaddr_in) c_int;
pub extern fn bindresvport_sa(c_int, [*c]struct_sockaddr) c_int;
pub extern var h_errno: c_int;
pub const struct_hostent = extern struct {
    h_name: [*c]u8,
    h_aliases: [*c][*c]u8,
    h_addrtype: c_int,
    h_length: c_int,
    h_addr_list: [*c][*c]u8,
};
pub const struct_netent = extern struct {
    n_name: [*c]u8,
    n_aliases: [*c][*c]u8,
    n_addrtype: c_int,
    n_net: u32,
};
pub const struct_servent = extern struct {
    s_name: [*c]u8,
    s_aliases: [*c][*c]u8,
    s_port: c_int,
    s_proto: [*c]u8,
};
pub const struct_protoent = extern struct {
    p_name: [*c]u8,
    p_aliases: [*c][*c]u8,
    p_proto: c_int,
};
pub const struct_addrinfo = extern struct {
    ai_flags: c_int,
    ai_family: c_int,
    ai_socktype: c_int,
    ai_protocol: c_int,
    ai_addrlen: socklen_t,
    ai_canonname: [*c]u8,
    ai_addr: [*c]struct_sockaddr,
    ai_next: [*c]struct_addrinfo,
};
pub const struct_rpcent = extern struct {
    r_name: [*c]u8,
    r_aliases: [*c][*c]u8,
    r_number: c_int,
};
pub extern fn endhostent() void;
pub extern fn endnetent() void;
pub extern fn endprotoent() void;
pub extern fn endservent() void;
pub extern fn freeaddrinfo([*c]struct_addrinfo) void;
pub extern fn gai_strerror(c_int) [*c]const u8;
pub extern fn getaddrinfo(noalias [*c]const u8, noalias [*c]const u8, noalias [*c]const struct_addrinfo, noalias [*c][*c]struct_addrinfo) c_int;
pub extern fn gethostbyaddr(?*const anyopaque, socklen_t, c_int) [*c]struct_hostent;
pub extern fn gethostbyname([*c]const u8) [*c]struct_hostent;
pub extern fn gethostent() [*c]struct_hostent;
pub extern fn getnameinfo(noalias [*c]const struct_sockaddr, socklen_t, noalias [*c]u8, socklen_t, noalias [*c]u8, socklen_t, c_int) c_int;
pub extern fn getnetbyaddr(u32, c_int) [*c]struct_netent;
pub extern fn getnetbyname([*c]const u8) [*c]struct_netent;
pub extern fn getnetent() [*c]struct_netent;
pub extern fn getprotobyname([*c]const u8) [*c]struct_protoent;
pub extern fn getprotobynumber(c_int) [*c]struct_protoent;
pub extern fn getprotoent() [*c]struct_protoent;
pub extern fn getservbyname([*c]const u8, [*c]const u8) [*c]struct_servent;
pub extern fn getservbyport(c_int, [*c]const u8) [*c]struct_servent;
pub extern fn getservent() [*c]struct_servent;
pub extern fn sethostent(c_int) void;
pub extern fn setnetent(c_int) void;
pub extern fn setprotoent(c_int) void;
pub extern fn setservent(c_int) void;
pub extern fn freehostent([*c]struct_hostent) void;
pub extern fn gethostbyname2([*c]const u8, c_int) [*c]struct_hostent;
pub extern fn getipnodebyaddr(?*const anyopaque, usize, c_int, [*c]c_int) [*c]struct_hostent;
pub extern fn getipnodebyname([*c]const u8, c_int, c_int, [*c]c_int) [*c]struct_hostent;
pub extern fn getrpcbyname(name: [*c]const u8) [*c]struct_rpcent;
pub extern fn getrpcbynumber(number: c_int) [*c]struct_rpcent;
pub extern fn getrpcent() [*c]struct_rpcent;
pub extern fn setrpcent(stayopen: c_int) void;
pub extern fn endrpcent() void;
pub extern fn herror([*c]const u8) void;
pub extern fn hstrerror(c_int) [*c]const u8;
pub extern fn innetgr([*c]const u8, [*c]const u8, [*c]const u8, [*c]const u8) c_int;
pub extern fn getnetgrent([*c][*c]u8, [*c][*c]u8, [*c][*c]u8) c_int;
pub extern fn endnetgrent() void;
pub extern fn setnetgrent([*c]const u8) void;
pub const n_short = __uint16_t;
pub const n_long = __uint32_t;
pub const n_time = __uint32_t; // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet/ip.h:86:10: warning: struct demoted to opaque type - has bitfield
pub const struct_ip = opaque {}; // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet/ip.h:193:10: warning: struct demoted to opaque type - has bitfield
pub const struct_ip_timestamp = opaque {};
pub const struct_accessx_descriptor = extern struct {
    ad_name_offset: c_uint,
    ad_flags: c_int,
    ad_pad: [2]c_int,
};
pub extern fn getattrlistbulk(c_int, ?*anyopaque, ?*anyopaque, usize, u64) c_int;
pub extern fn getattrlistat(c_int, [*c]const u8, ?*anyopaque, ?*anyopaque, usize, c_ulong) c_int;
pub extern fn setattrlistat(c_int, [*c]const u8, ?*anyopaque, ?*anyopaque, usize, u32) c_int;
pub extern fn faccessat(c_int, [*c]const u8, c_int, c_int) c_int;
pub extern fn fchownat(c_int, [*c]const u8, uid_t, gid_t, c_int) c_int;
pub extern fn linkat(c_int, [*c]const u8, c_int, [*c]const u8, c_int) c_int;
pub extern fn readlinkat(c_int, [*c]const u8, [*c]u8, usize) isize;
pub extern fn symlinkat([*c]const u8, c_int, [*c]const u8) c_int;
pub extern fn unlinkat(c_int, [*c]const u8, c_int) c_int;
pub extern fn _exit(c_int) noreturn;
pub extern fn access([*c]const u8, c_int) c_int;
pub extern fn alarm(c_uint) c_uint;
pub extern fn chdir([*c]const u8) c_int;
pub extern fn chown([*c]const u8, uid_t, gid_t) c_int;
pub extern fn close(c_int) c_int;
pub extern fn dup(c_int) c_int;
pub extern fn dup2(c_int, c_int) c_int;
pub extern fn execl(__path: [*c]const u8, __arg0: [*c]const u8, ...) c_int;
pub extern fn execle(__path: [*c]const u8, __arg0: [*c]const u8, ...) c_int;
pub extern fn execlp(__file: [*c]const u8, __arg0: [*c]const u8, ...) c_int;
pub extern fn execv(__path: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn execve(__file: [*c]const u8, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn execvp(__file: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn fork() pid_t;
pub extern fn fpathconf(c_int, c_int) c_long;
pub extern fn getcwd([*c]u8, usize) [*c]u8;
pub extern fn getegid() gid_t;
pub extern fn geteuid() uid_t;
pub extern fn getgid() gid_t;
pub extern fn getgroups(c_int, [*c]gid_t) c_int;
pub extern fn getlogin() [*c]u8;
pub extern fn getpgrp() pid_t;
pub extern fn getpid() pid_t;
pub extern fn getppid() pid_t;
pub extern fn getuid() uid_t;
pub extern fn isatty(c_int) c_int;
pub extern fn link([*c]const u8, [*c]const u8) c_int;
pub extern fn lseek(c_int, off_t, c_int) off_t;
pub extern fn pathconf([*c]const u8, c_int) c_long;
pub extern fn pause() c_int;
pub extern fn pipe([*c]c_int) c_int;
pub extern fn read(c_int, ?*anyopaque, usize) isize;
pub extern fn rmdir([*c]const u8) c_int;
pub extern fn setgid(gid_t) c_int;
pub extern fn setpgid(pid_t, pid_t) c_int;
pub extern fn setsid() pid_t;
pub extern fn setuid(uid_t) c_int;
pub extern fn sleep(c_uint) c_uint;
pub extern fn sysconf(c_int) c_long;
pub extern fn tcgetpgrp(c_int) pid_t;
pub extern fn tcsetpgrp(c_int, pid_t) c_int;
pub extern fn ttyname(c_int) [*c]u8;
pub extern fn ttyname_r(c_int, [*c]u8, usize) c_int;
pub extern fn unlink([*c]const u8) c_int;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __nbyte: usize) isize;
pub extern fn confstr(c_int, [*c]u8, usize) usize;
pub extern fn getopt(c_int, [*c]const [*c]u8, [*c]const u8) c_int;
pub extern var optarg: [*c]u8;
pub extern var optind: c_int;
pub extern var opterr: c_int;
pub extern var optopt: c_int;
pub extern fn brk(?*const anyopaque) ?*anyopaque;
pub extern fn chroot([*c]const u8) c_int;
pub extern fn crypt([*c]const u8, [*c]const u8) [*c]u8;
pub extern fn encrypt([*c]u8, c_int) void;
pub extern fn fchdir(c_int) c_int;
pub extern fn gethostid() c_long;
pub extern fn getpgid(pid_t) pid_t;
pub extern fn getsid(pid_t) pid_t;
pub extern fn getdtablesize() c_int;
pub extern fn getpagesize() c_int;
pub extern fn getpass([*c]const u8) [*c]u8;
pub extern fn getwd([*c]u8) [*c]u8;
pub extern fn lchown([*c]const u8, uid_t, gid_t) c_int;
pub extern fn lockf(c_int, c_int, off_t) c_int;
pub extern fn nice(c_int) c_int;
pub extern fn pread(__fd: c_int, __buf: ?*anyopaque, __nbyte: usize, __offset: off_t) isize;
pub extern fn pwrite(__fd: c_int, __buf: ?*const anyopaque, __nbyte: usize, __offset: off_t) isize;
pub extern fn sbrk(c_int) ?*anyopaque;
pub extern fn setpgrp() pid_t;
pub extern fn setregid(gid_t, gid_t) c_int;
pub extern fn setreuid(uid_t, uid_t) c_int;
pub extern fn sync() void;
pub extern fn truncate([*c]const u8, off_t) c_int;
pub extern fn ualarm(useconds_t, useconds_t) useconds_t;
pub extern fn usleep(useconds_t) c_int;
pub extern fn vfork() c_int;
pub extern fn fsync(c_int) c_int;
pub extern fn ftruncate(c_int, off_t) c_int;
pub extern fn getlogin_r([*c]u8, usize) c_int;
pub extern fn fchown(c_int, uid_t, gid_t) c_int;
pub extern fn gethostname([*c]u8, usize) c_int;
pub extern fn readlink(noalias [*c]const u8, noalias [*c]u8, usize) isize;
pub extern fn setegid(gid_t) c_int;
pub extern fn seteuid(uid_t) c_int;
pub extern fn symlink([*c]const u8, [*c]const u8) c_int;
pub const struct_timespec = extern struct {
    tv_sec: __darwin_time_t,
    tv_nsec: c_long,
};
pub extern fn pselect(c_int, noalias [*c]fd_set, noalias [*c]fd_set, noalias [*c]fd_set, noalias [*c]const struct_timespec, noalias [*c]const sigset_t) c_int;
pub extern fn select(c_int, noalias [*c]fd_set, noalias [*c]fd_set, noalias [*c]fd_set, noalias [*c]struct_timeval) c_int;
pub const uuid_t = __darwin_uuid_t;
pub extern fn accessx_np([*c]const struct_accessx_descriptor, usize, [*c]c_int, uid_t) c_int;
pub extern fn acct([*c]const u8) c_int;
pub extern fn add_profil([*c]u8, usize, c_ulong, c_uint) c_int;
pub extern fn endusershell() void;
pub extern fn execvP(__file: [*c]const u8, __searchpath: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn fflagstostr(c_ulong) [*c]u8;
pub extern fn getdomainname([*c]u8, c_int) c_int;
pub extern fn getgrouplist([*c]const u8, c_int, [*c]c_int, [*c]c_int) c_int;
pub extern fn gethostuuid([*c]u8, [*c]const struct_timespec) c_int;
pub extern fn getmode(?*const anyopaque, mode_t) mode_t;
pub extern fn getpeereid(c_int, [*c]uid_t, [*c]gid_t) c_int;
pub extern fn getsgroups_np([*c]c_int, [*c]u8) c_int;
pub extern fn getusershell() [*c]u8;
pub extern fn getwgroups_np([*c]c_int, [*c]u8) c_int;
pub extern fn initgroups([*c]const u8, c_int) c_int;
pub extern fn issetugid() c_int;
pub extern fn mkdtemp([*c]u8) [*c]u8;
pub extern fn mknod([*c]const u8, mode_t, dev_t) c_int;
pub extern fn mkpath_np(path: [*c]const u8, omode: mode_t) c_int;
pub extern fn mkpathat_np(dfd: c_int, path: [*c]const u8, omode: mode_t) c_int;
pub extern fn mkstemps([*c]u8, c_int) c_int;
pub extern fn mkostemp(path: [*c]u8, oflags: c_int) c_int;
pub extern fn mkostemps(path: [*c]u8, slen: c_int, oflags: c_int) c_int;
pub extern fn mkstemp_dprotected_np(path: [*c]u8, dpclass: c_int, dpflags: c_int) c_int;
pub extern fn mkdtempat_np(dfd: c_int, path: [*c]u8) [*c]u8;
pub extern fn mkstempsat_np(dfd: c_int, path: [*c]u8, slen: c_int) c_int;
pub extern fn mkostempsat_np(dfd: c_int, path: [*c]u8, slen: c_int, oflags: c_int) c_int;
pub extern fn nfssvc(c_int, ?*anyopaque) c_int;
pub extern fn profil([*c]u8, usize, c_ulong, c_uint) c_int;
pub extern fn pthread_setugid_np(uid_t, gid_t) c_int;
pub extern fn pthread_getugid_np([*c]uid_t, [*c]gid_t) c_int;
pub extern fn reboot(c_int) c_int;
pub extern fn revoke([*c]const u8) c_int;
pub extern fn rcmd([*c][*c]u8, c_int, [*c]const u8, [*c]const u8, [*c]const u8, [*c]c_int) c_int;
pub extern fn rcmd_af([*c][*c]u8, c_int, [*c]const u8, [*c]const u8, [*c]const u8, [*c]c_int, c_int) c_int;
pub extern fn rresvport([*c]c_int) c_int;
pub extern fn rresvport_af([*c]c_int, c_int) c_int;
pub extern fn iruserok(c_ulong, c_int, [*c]const u8, [*c]const u8) c_int;
pub extern fn iruserok_sa(?*const anyopaque, c_int, c_int, [*c]const u8, [*c]const u8) c_int;
pub extern fn ruserok([*c]const u8, c_int, [*c]const u8, [*c]const u8) c_int;
pub extern fn setdomainname([*c]const u8, c_int) c_int;
pub extern fn setgroups(c_int, [*c]const gid_t) c_int;
pub extern fn sethostid(c_long) void;
pub extern fn sethostname([*c]const u8, c_int) c_int;
pub extern fn setlogin([*c]const u8) c_int;
pub extern fn setmode([*c]const u8) ?*anyopaque;
pub extern fn setrgid(gid_t) c_int;
pub extern fn setruid(uid_t) c_int;
pub extern fn setsgroups_np(c_int, [*c]const u8) c_int;
pub extern fn setusershell() void;
pub extern fn setwgroups_np(c_int, [*c]const u8) c_int;
pub extern fn strtofflags([*c][*c]u8, [*c]c_ulong, [*c]c_ulong) c_int;
pub extern fn swapon([*c]const u8) c_int;
pub extern fn ttyslot() c_int;
pub extern fn undelete([*c]const u8) c_int;
pub extern fn unwhiteout([*c]const u8) c_int;
pub extern fn syscall(c_int, ...) c_int;
pub extern fn fgetattrlist(c_int, ?*anyopaque, ?*anyopaque, usize, c_uint) c_int;
pub extern fn fsetattrlist(c_int, ?*anyopaque, ?*anyopaque, usize, c_uint) c_int;
pub extern fn getattrlist([*c]const u8, ?*anyopaque, ?*anyopaque, usize, c_uint) c_int;
pub extern fn setattrlist([*c]const u8, ?*anyopaque, ?*anyopaque, usize, c_uint) c_int;
pub extern fn exchangedata([*c]const u8, [*c]const u8, c_uint) c_int;
pub extern fn getdirentriesattr(c_int, ?*anyopaque, ?*anyopaque, usize, [*c]c_uint, [*c]c_uint, [*c]c_uint, c_uint) c_int;
pub const struct_fssearchblock = opaque {};
pub const struct_searchstate = opaque {};
pub extern fn searchfs([*c]const u8, ?*struct_fssearchblock, [*c]c_ulong, c_uint, c_uint, ?*struct_searchstate) c_int;
pub extern fn fsctl([*c]const u8, c_ulong, ?*anyopaque, c_uint) c_int;
pub extern fn ffsctl(c_int, c_ulong, ?*anyopaque, c_uint) c_int;
pub extern fn fsync_volume_np(c_int, c_int) c_int;
pub extern fn sync_volume_np([*c]const u8, c_int) c_int;
pub extern var optreset: c_int;
pub extern fn inet_addr([*c]const u8) in_addr_t;
pub extern fn inet_ntoa(struct_in_addr) [*c]u8;
pub extern fn inet_ntop(c_int, ?*const anyopaque, [*c]u8, socklen_t) [*c]const u8;
pub extern fn inet_pton(c_int, [*c]const u8, ?*anyopaque) c_int;
pub extern fn ascii2addr(c_int, [*c]const u8, ?*anyopaque) c_int;
pub extern fn addr2ascii(c_int, ?*const anyopaque, c_int, [*c]u8) [*c]u8;
pub extern fn inet_aton([*c]const u8, [*c]struct_in_addr) c_int;
pub extern fn inet_lnaof(struct_in_addr) in_addr_t;
pub extern fn inet_makeaddr(in_addr_t, in_addr_t) struct_in_addr;
pub extern fn inet_netof(struct_in_addr) in_addr_t;
pub extern fn inet_network([*c]const u8) in_addr_t;
pub extern fn inet_net_ntop(c_int, ?*const anyopaque, c_int, [*c]u8, __darwin_size_t) [*c]u8;
pub extern fn inet_net_pton(c_int, [*c]const u8, ?*anyopaque, __darwin_size_t) c_int;
pub extern fn inet_neta(in_addr_t, [*c]u8, __darwin_size_t) [*c]u8;
pub extern fn inet_nsap_addr([*c]const u8, [*c]u8, c_int) c_uint;
pub extern fn inet_nsap_ntoa(c_int, [*c]const u8, [*c]u8) [*c]u8;
pub extern fn __error() [*c]c_int;
pub const BOOLEAN = u8;
pub const IN_ADDR = struct_in_addr;
pub const IN6_ADDR = struct_in6_addr;
pub const ADDRINFO = struct_addrinfo;
pub const QUIC_ADDRESS_FAMILY = sa_family_t;
pub const union_QUIC_ADDR = extern union {
    Ip: struct_sockaddr,
    Ipv4: struct_sockaddr_in,
    Ipv6: struct_sockaddr_in6,
};
pub const QUIC_ADDR = union_QUIC_ADDR;
pub fn QuicAddrFamilyIsValid(arg_Family: QUIC_ADDRESS_FAMILY) callconv(.C) BOOLEAN {
    var Family = arg_Family;
    return @bitCast(BOOLEAN, @truncate(i8, @boolToInt(((@bitCast(c_int, @as(c_uint, Family)) == @as(c_int, 0)) or (@bitCast(c_int, @as(c_uint, Family)) == @as(c_int, 2))) or (@bitCast(c_int, @as(c_uint, Family)) == @as(c_int, 30)))));
}
pub fn QuicAddrIsValid(Addr: [*c]const QUIC_ADDR) callconv(.C) BOOLEAN {
    return QuicAddrFamilyIsValid(Addr.*.Ip.sa_family);
}
pub fn QuicAddrCompareIp(Addr1: [*c]const QUIC_ADDR, Addr2: [*c]const QUIC_ADDR) callconv(.C) BOOLEAN {
    if (@as(c_int, 2) == @bitCast(c_int, @as(c_uint, Addr1.*.Ip.sa_family))) {
        return @bitCast(BOOLEAN, @truncate(i8, @boolToInt(memcmp(@ptrCast(?*const anyopaque, &Addr1.*.Ipv4.sin_addr), @ptrCast(?*const anyopaque, &Addr2.*.Ipv4.sin_addr), @sizeOf(IN_ADDR)) == @as(c_int, 0))));
    } else {
        return @bitCast(BOOLEAN, @truncate(i8, @boolToInt(memcmp(@ptrCast(?*const anyopaque, &Addr1.*.Ipv6.sin6_addr), @ptrCast(?*const anyopaque, &Addr2.*.Ipv6.sin6_addr), @sizeOf(IN6_ADDR)) == @as(c_int, 0))));
    }
    return 0;
}
pub fn QuicAddrCompare(Addr1: [*c]const QUIC_ADDR, Addr2: [*c]const QUIC_ADDR) callconv(.C) BOOLEAN {
    if ((@bitCast(c_int, @as(c_uint, Addr1.*.Ip.sa_family)) != @bitCast(c_int, @as(c_uint, Addr2.*.Ip.sa_family))) or (@bitCast(c_int, @as(c_uint, Addr1.*.Ipv4.sin_port)) != @bitCast(c_int, @as(c_uint, Addr2.*.Ipv4.sin_port)))) {
        return 0;
    }
    if (@as(c_int, 2) == @bitCast(c_int, @as(c_uint, Addr1.*.Ip.sa_family))) {
        return @bitCast(BOOLEAN, @truncate(i8, @boolToInt(memcmp(@ptrCast(?*const anyopaque, &Addr1.*.Ipv4.sin_addr), @ptrCast(?*const anyopaque, &Addr2.*.Ipv4.sin_addr), @sizeOf(IN_ADDR)) == @as(c_int, 0))));
    } else {
        return @bitCast(BOOLEAN, @truncate(i8, @boolToInt(memcmp(@ptrCast(?*const anyopaque, &Addr1.*.Ipv6.sin6_addr), @ptrCast(?*const anyopaque, &Addr2.*.Ipv6.sin6_addr), @sizeOf(IN6_ADDR)) == @as(c_int, 0))));
    }
    return 0;
}
pub fn QuicAddrGetFamily(Addr: [*c]const QUIC_ADDR) callconv(.C) QUIC_ADDRESS_FAMILY {
    return Addr.*.Ip.sa_family;
}
pub fn QuicAddrSetFamily(arg_Addr: [*c]QUIC_ADDR, arg_Family: QUIC_ADDRESS_FAMILY) callconv(.C) void {
    var Addr = arg_Addr;
    var Family = arg_Family;
    Addr.*.Ip.sa_family = Family;
}
pub fn QuicAddrGetPort(Addr: [*c]const QUIC_ADDR) callconv(.C) u16 {
    if (@as(c_int, 2) == @bitCast(c_int, @as(c_uint, Addr.*.Ip.sa_family))) {
        return @bitCast(__uint16_t, @truncate(c_short, if (__builtin_constant_p(Addr.*.Ipv4.sin_port) != 0) @bitCast(c_int, @as(c_uint, @bitCast(__uint16_t, @truncate(c_ushort, ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, Addr.*.Ipv4.sin_port))) & @as(c_uint, 65280)) >> @intCast(@import("std").math.Log2Int(c_uint), 8)) | ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, Addr.*.Ipv4.sin_port))) & @as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 8)))))) else @bitCast(c_int, @as(c_uint, _OSSwapInt16(Addr.*.Ipv4.sin_port)))));
    } else {
        return @bitCast(__uint16_t, @truncate(c_short, if (__builtin_constant_p(Addr.*.Ipv6.sin6_port) != 0) @bitCast(c_int, @as(c_uint, @bitCast(__uint16_t, @truncate(c_ushort, ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, Addr.*.Ipv6.sin6_port))) & @as(c_uint, 65280)) >> @intCast(@import("std").math.Log2Int(c_uint), 8)) | ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, Addr.*.Ipv6.sin6_port))) & @as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 8)))))) else @bitCast(c_int, @as(c_uint, _OSSwapInt16(Addr.*.Ipv6.sin6_port)))));
    }
    return 0;
}
pub fn QuicAddrSetPort(arg_Addr: [*c]QUIC_ADDR, arg_Port: u16) callconv(.C) void {
    var Addr = arg_Addr;
    var Port = arg_Port;
    if (@as(c_int, 2) == @bitCast(c_int, @as(c_uint, Addr.*.Ip.sa_family))) {
        Addr.*.Ipv4.sin_port = @bitCast(__uint16_t, @truncate(c_short, if (__builtin_constant_p(Port) != 0) @bitCast(c_int, @as(c_uint, @bitCast(__uint16_t, @truncate(c_ushort, ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, Port))) & @as(c_uint, 65280)) >> @intCast(@import("std").math.Log2Int(c_uint), 8)) | ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, Port))) & @as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 8)))))) else @bitCast(c_int, @as(c_uint, _OSSwapInt16(Port)))));
    } else {
        Addr.*.Ipv6.sin6_port = @bitCast(__uint16_t, @truncate(c_short, if (__builtin_constant_p(Port) != 0) @bitCast(c_int, @as(c_uint, @bitCast(__uint16_t, @truncate(c_ushort, ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, Port))) & @as(c_uint, 65280)) >> @intCast(@import("std").math.Log2Int(c_uint), 8)) | ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, Port))) & @as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 8)))))) else @bitCast(c_int, @as(c_uint, _OSSwapInt16(Port)))));
    }
}
pub fn QuicAddrIncrement(arg_Addr: [*c]QUIC_ADDR) callconv(.C) void {
    var Addr = arg_Addr;
    if (@bitCast(c_int, @as(c_uint, Addr.*.Ip.sa_family)) == @as(c_int, 2)) {
        @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment([*c]u8), &Addr.*.Ipv4.sin_addr))[@intCast(c_uint, @as(c_int, 3))] +%= 1;
    } else {
        @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment([*c]u8), &Addr.*.Ipv6.sin6_addr))[@intCast(c_uint, @as(c_int, 15))] +%= 1;
    }
}
pub fn QuicAddrSetToLoopback(arg_Addr: [*c]QUIC_ADDR) callconv(.C) void {
    var Addr = arg_Addr;
    if (@bitCast(c_int, @as(c_uint, Addr.*.Ip.sa_family)) == @as(c_int, 2)) {
        Addr.*.Ipv4.sin_addr.s_addr = if (__builtin_constant_p(@bitCast(u_int32_t, @as(c_int, 2130706433))) != 0) @bitCast(__uint32_t, ((((@bitCast(__uint32_t, @bitCast(u_int32_t, @as(c_int, 2130706433))) & @as(c_uint, 4278190080)) >> @intCast(@import("std").math.Log2Int(c_uint), 24)) | ((@bitCast(__uint32_t, @bitCast(u_int32_t, @as(c_int, 2130706433))) & @as(c_uint, 16711680)) >> @intCast(@import("std").math.Log2Int(c_uint), 8))) | ((@bitCast(__uint32_t, @bitCast(u_int32_t, @as(c_int, 2130706433))) & @as(c_uint, 65280)) << @intCast(@import("std").math.Log2Int(c_uint), 8))) | ((@bitCast(__uint32_t, @bitCast(u_int32_t, @as(c_int, 2130706433))) & @as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 24))) else _OSSwapInt32(@bitCast(u_int32_t, @as(c_int, 2130706433)));
    } else {
        Addr.*.Ipv6.sin6_addr = in6addr_loopback;
    }
}
pub fn QuicAddrHash(arg_Addr: [*c]const QUIC_ADDR) callconv(.C) u32 {
    var Addr = arg_Addr;
    var Hash: u32 = 5387;
    if (@bitCast(c_int, @as(c_uint, Addr.*.Ip.sa_family)) == @as(c_int, 2)) {
        Hash = ((Hash << @intCast(u5, 5)) -% Hash) +% @bitCast(c_uint, @bitCast(c_int, @as(c_uint, Addr.*.Ipv4.sin_port)) & @as(c_int, 255));
        Hash = ((Hash << @intCast(u5, 5)) -% Hash) +% @bitCast(c_uint, @bitCast(c_int, @as(c_uint, Addr.*.Ipv4.sin_port)) >> @intCast(@import("std").math.Log2Int(c_int), 8));
        {
            var i: u8 = 0;
            while (@bitCast(c_ulong, @as(c_ulong, i)) < @sizeOf(struct_in_addr)) : (i +%= 1) {
                Hash = ((Hash << @intCast(u5, 5)) -% Hash) +% @bitCast(c_uint, @as(c_uint, @intToPtr([*c]u8, @ptrToInt(&Addr.*.Ipv4.sin_addr))[i]));
            }
        }
    } else {
        Hash = ((Hash << @intCast(u5, 5)) -% Hash) +% @bitCast(c_uint, @bitCast(c_int, @as(c_uint, Addr.*.Ipv6.sin6_port)) & @as(c_int, 255));
        Hash = ((Hash << @intCast(u5, 5)) -% Hash) +% @bitCast(c_uint, @bitCast(c_int, @as(c_uint, Addr.*.Ipv6.sin6_port)) >> @intCast(@import("std").math.Log2Int(c_int), 8));
        {
            var i: u8 = 0;
            while (@bitCast(c_ulong, @as(c_ulong, i)) < @sizeOf(struct_in6_addr)) : (i +%= 1) {
                Hash = ((Hash << @intCast(u5, 5)) -% Hash) +% @bitCast(c_uint, @as(c_uint, @intToPtr([*c]u8, @ptrToInt(&Addr.*.Ipv6.sin6_addr))[i]));
            }
        }
    }
    return Hash;
}
pub fn QuicAddrIsWildCard(Addr: [*c]const QUIC_ADDR) callconv(.C) BOOLEAN {
    if (@bitCast(c_int, @as(c_uint, Addr.*.Ip.sa_family)) == @as(c_int, 0)) {
        return 1;
    } else if (@bitCast(c_int, @as(c_uint, Addr.*.Ip.sa_family)) == @as(c_int, 2)) {
        const ZeroAddr: IN_ADDR = IN_ADDR{
            .s_addr = @bitCast(in_addr_t, @as(c_int, 0)),
        };
        return @bitCast(BOOLEAN, @truncate(i8, @boolToInt(memcmp(@ptrCast(?*const anyopaque, &Addr.*.Ipv4.sin_addr.s_addr), @ptrCast(?*const anyopaque, &ZeroAddr), @sizeOf(IN_ADDR)) == @as(c_int, 0))));
    } else {
        const ZeroAddr: IN6_ADDR = IN6_ADDR{
            .__u6_addr = union_unnamed_3{
                .__u6_addr8 = [1]__uint8_t{
                    0,
                } ++ [1]__uint8_t{0} ** 15,
            },
        };
        return @bitCast(BOOLEAN, @truncate(i8, @boolToInt(memcmp(@ptrCast(?*const anyopaque, &Addr.*.Ipv6.sin6_addr), @ptrCast(?*const anyopaque, &ZeroAddr), @sizeOf(IN6_ADDR)) == @as(c_int, 0))));
    }
    return 0;
}
pub fn QuicAddr4FromString(arg_AddrStr: [*c]const u8, arg_Addr: [*c]QUIC_ADDR) callconv(.C) BOOLEAN {
    var AddrStr = arg_AddrStr;
    var Addr = arg_Addr;
    if (@bitCast(c_int, @as(c_uint, AddrStr[@intCast(c_uint, @as(c_int, 0))])) == @as(c_int, '[')) {
        return 0;
    }
    var PortStart: [*c]const u8 = strchr(AddrStr, @as(c_int, ':'));
    if (PortStart != @ptrCast([*c]const u8, @alignCast(@import("std").meta.alignment([*c]const u8), @intToPtr(?*anyopaque, @as(c_int, 0))))) {
        if (strchr(PortStart + @bitCast(usize, @intCast(isize, @as(c_int, 1))), @as(c_int, ':')) != @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment([*c]u8), @intToPtr(?*anyopaque, @as(c_int, 0))))) {
            return 0;
        }
        var TmpAddrStr: [16]u8 = undefined;
        var AddrLength: usize = @bitCast(usize, @divExact(@bitCast(c_long, @ptrToInt(PortStart) -% @ptrToInt(AddrStr)), @sizeOf(u8)));
        if (AddrLength >= @sizeOf([16]u8)) {
            return 0;
        }
        _ = __builtin___memcpy_chk(@ptrCast(?*anyopaque, @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment([*c]u8), &TmpAddrStr))), @ptrCast(?*const anyopaque, AddrStr), AddrLength, __builtin_object_size(@ptrCast(?*const anyopaque, @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment([*c]u8), &TmpAddrStr))), @as(c_int, 0)));
        TmpAddrStr[AddrLength] = '\x00';
        if (inet_pton(@as(c_int, 2), @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment([*c]u8), &TmpAddrStr)), @ptrCast(?*anyopaque, &Addr.*.Ipv4.sin_addr)) != @as(c_int, 1)) {
            return 0;
        }
        Addr.*.Ipv4.sin_port = @bitCast(__uint16_t, @truncate(c_short, if (__builtin_constant_p(atoi(PortStart + @bitCast(usize, @intCast(isize, @as(c_int, 1))))) != 0) @bitCast(c_int, @as(c_uint, @bitCast(__uint16_t, @truncate(c_ushort, ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, @truncate(c_short, atoi(PortStart + @bitCast(usize, @intCast(isize, @as(c_int, 1)))))))) & @as(c_uint, 65280)) >> @intCast(@import("std").math.Log2Int(c_uint), 8)) | ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, @truncate(c_short, atoi(PortStart + @bitCast(usize, @intCast(isize, @as(c_int, 1)))))))) & @as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 8)))))) else @bitCast(c_int, @as(c_uint, _OSSwapInt16(@bitCast(u16, @truncate(c_short, atoi(PortStart + @bitCast(usize, @intCast(isize, @as(c_int, 1)))))))))));
    } else {
        if (inet_pton(@as(c_int, 2), AddrStr, @ptrCast(?*anyopaque, &Addr.*.Ipv4.sin_addr)) != @as(c_int, 1)) {
            return 0;
        }
    }
    Addr.*.Ip.sa_family = 2;
    return 1;
}
pub fn QuicAddr6FromString(arg_AddrStr: [*c]const u8, arg_Addr: [*c]QUIC_ADDR) callconv(.C) BOOLEAN {
    var AddrStr = arg_AddrStr;
    var Addr = arg_Addr;
    if (@bitCast(c_int, @as(c_uint, AddrStr[@intCast(c_uint, @as(c_int, 0))])) == @as(c_int, '[')) {
        var BracketEnd: [*c]const u8 = strchr(AddrStr, @as(c_int, ']'));
        if ((BracketEnd == @ptrCast([*c]const u8, @alignCast(@import("std").meta.alignment([*c]const u8), @intToPtr(?*anyopaque, @as(c_int, 0))))) or (@bitCast(c_int, @as(c_uint, (BracketEnd + @bitCast(usize, @intCast(isize, @as(c_int, 1)))).*)) != @as(c_int, ':'))) {
            return 0;
        }
        var TmpAddrStr: [64]u8 = undefined;
        var AddrLength: usize = @bitCast(usize, @divExact(@bitCast(c_long, @ptrToInt(BracketEnd) -% @ptrToInt(AddrStr)), @sizeOf(u8)) - @bitCast(c_long, @as(c_long, @as(c_int, 1))));
        if (AddrLength >= @sizeOf([64]u8)) {
            return 0;
        }
        _ = __builtin___memcpy_chk(@ptrCast(?*anyopaque, @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment([*c]u8), &TmpAddrStr))), @ptrCast(?*const anyopaque, AddrStr + @bitCast(usize, @intCast(isize, @as(c_int, 1)))), AddrLength, __builtin_object_size(@ptrCast(?*const anyopaque, @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment([*c]u8), &TmpAddrStr))), @as(c_int, 0)));
        TmpAddrStr[AddrLength] = '\x00';
        if (inet_pton(@as(c_int, 30), @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment([*c]u8), &TmpAddrStr)), @ptrCast(?*anyopaque, &Addr.*.Ipv6.sin6_addr)) != @as(c_int, 1)) {
            return 0;
        }
        Addr.*.Ipv6.sin6_port = @bitCast(__uint16_t, @truncate(c_short, if (__builtin_constant_p(atoi(BracketEnd + @bitCast(usize, @intCast(isize, @as(c_int, 2))))) != 0) @bitCast(c_int, @as(c_uint, @bitCast(__uint16_t, @truncate(c_ushort, ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, @truncate(c_short, atoi(BracketEnd + @bitCast(usize, @intCast(isize, @as(c_int, 2)))))))) & @as(c_uint, 65280)) >> @intCast(@import("std").math.Log2Int(c_uint), 8)) | ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, @truncate(c_short, atoi(BracketEnd + @bitCast(usize, @intCast(isize, @as(c_int, 2)))))))) & @as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 8)))))) else @bitCast(c_int, @as(c_uint, _OSSwapInt16(@bitCast(u16, @truncate(c_short, atoi(BracketEnd + @bitCast(usize, @intCast(isize, @as(c_int, 2)))))))))));
    } else {
        if (inet_pton(@as(c_int, 30), AddrStr, @ptrCast(?*anyopaque, &Addr.*.Ipv6.sin6_addr)) != @as(c_int, 1)) {
            return 0;
        }
    }
    Addr.*.Ip.sa_family = 30;
    return 1;
}
pub fn QuicAddrFromString(arg_AddrStr: [*c]const u8, arg_Port: u16, arg_Addr: [*c]QUIC_ADDR) callconv(.C) BOOLEAN {
    var AddrStr = arg_AddrStr;
    var Port = arg_Port;
    var Addr = arg_Addr;
    Addr.*.Ipv4.sin_port = @bitCast(__uint16_t, @truncate(c_short, if (__builtin_constant_p(Port) != 0) @bitCast(c_int, @as(c_uint, @bitCast(__uint16_t, @truncate(c_ushort, ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, Port))) & @as(c_uint, 65280)) >> @intCast(@import("std").math.Log2Int(c_uint), 8)) | ((@bitCast(c_uint, @as(c_uint, @bitCast(__uint16_t, Port))) & @as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 8)))))) else @bitCast(c_int, @as(c_uint, _OSSwapInt16(Port)))));
    return @bitCast(BOOLEAN, @truncate(i8, @boolToInt((@bitCast(c_int, @as(c_uint, QuicAddr4FromString(AddrStr, Addr))) != 0) or (@bitCast(c_int, @as(c_uint, QuicAddr6FromString(AddrStr, Addr))) != 0))));
}
pub const struct_QUIC_ADDR_STR = extern struct {
    Address: [64]u8,
};
pub const QUIC_ADDR_STR = struct_QUIC_ADDR_STR; // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/secure/_stdio.h:47:3: warning: TODO implement function '__builtin___sprintf_chk' in std.zig.c_builtins
// /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:482:1: warning: unable to translate function, demoted to extern
pub extern fn QuicAddrToString(arg_Addr: [*c]const QUIC_ADDR, arg_AddrStr: [*c]QUIC_ADDR_STR) callconv(.C) BOOLEAN;
pub const struct_QUIC_HANDLE = opaque {};
pub const HQUIC = ?*struct_QUIC_HANDLE;
pub const QUIC_UINT62 = u64;
pub const QUIC_EXECUTION_PROFILE_LOW_LATENCY: c_int = 0;
pub const QUIC_EXECUTION_PROFILE_TYPE_MAX_THROUGHPUT: c_int = 1;
pub const QUIC_EXECUTION_PROFILE_TYPE_SCAVENGER: c_int = 2;
pub const QUIC_EXECUTION_PROFILE_TYPE_REAL_TIME: c_int = 3;
pub const enum_QUIC_EXECUTION_PROFILE = c_uint;
pub const QUIC_EXECUTION_PROFILE = enum_QUIC_EXECUTION_PROFILE;
pub const QUIC_LOAD_BALANCING_DISABLED: c_int = 0;
pub const QUIC_LOAD_BALANCING_SERVER_ID_IP: c_int = 1;
pub const enum_QUIC_LOAD_BALANCING_MODE = c_uint;
pub const QUIC_LOAD_BALANCING_MODE = enum_QUIC_LOAD_BALANCING_MODE;
pub const QUIC_CREDENTIAL_TYPE_NONE: c_int = 0;
pub const QUIC_CREDENTIAL_TYPE_CERTIFICATE_HASH: c_int = 1;
pub const QUIC_CREDENTIAL_TYPE_CERTIFICATE_HASH_STORE: c_int = 2;
pub const QUIC_CREDENTIAL_TYPE_CERTIFICATE_CONTEXT: c_int = 3;
pub const QUIC_CREDENTIAL_TYPE_CERTIFICATE_FILE: c_int = 4;
pub const QUIC_CREDENTIAL_TYPE_CERTIFICATE_FILE_PROTECTED: c_int = 5;
pub const QUIC_CREDENTIAL_TYPE_CERTIFICATE_PKCS12: c_int = 6;
pub const enum_QUIC_CREDENTIAL_TYPE = c_uint;
pub const QUIC_CREDENTIAL_TYPE = enum_QUIC_CREDENTIAL_TYPE;
pub const QUIC_CREDENTIAL_FLAG_NONE: c_int = 0;
pub const QUIC_CREDENTIAL_FLAG_CLIENT: c_int = 1;
pub const QUIC_CREDENTIAL_FLAG_LOAD_ASYNCHRONOUS: c_int = 2;
pub const QUIC_CREDENTIAL_FLAG_NO_CERTIFICATE_VALIDATION: c_int = 4;
pub const QUIC_CREDENTIAL_FLAG_ENABLE_OCSP: c_int = 8;
pub const QUIC_CREDENTIAL_FLAG_INDICATE_CERTIFICATE_RECEIVED: c_int = 16;
pub const QUIC_CREDENTIAL_FLAG_DEFER_CERTIFICATE_VALIDATION: c_int = 32;
pub const QUIC_CREDENTIAL_FLAG_REQUIRE_CLIENT_AUTHENTICATION: c_int = 64;
pub const QUIC_CREDENTIAL_FLAG_USE_TLS_BUILTIN_CERTIFICATE_VALIDATION: c_int = 128;
pub const QUIC_CREDENTIAL_FLAG_REVOCATION_CHECK_END_CERT: c_int = 256;
pub const QUIC_CREDENTIAL_FLAG_REVOCATION_CHECK_CHAIN: c_int = 512;
pub const QUIC_CREDENTIAL_FLAG_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT: c_int = 1024;
pub const QUIC_CREDENTIAL_FLAG_IGNORE_NO_REVOCATION_CHECK: c_int = 2048;
pub const QUIC_CREDENTIAL_FLAG_IGNORE_REVOCATION_OFFLINE: c_int = 4096;
pub const QUIC_CREDENTIAL_FLAG_SET_ALLOWED_CIPHER_SUITES: c_int = 8192;
pub const QUIC_CREDENTIAL_FLAG_USE_PORTABLE_CERTIFICATES: c_int = 16384;
pub const QUIC_CREDENTIAL_FLAG_USE_SUPPLIED_CREDENTIALS: c_int = 32768;
pub const enum_QUIC_CREDENTIAL_FLAGS = c_uint;
pub const QUIC_CREDENTIAL_FLAGS = enum_QUIC_CREDENTIAL_FLAGS;
pub const QUIC_ALLOWED_CIPHER_SUITE_NONE: c_int = 0;
pub const QUIC_ALLOWED_CIPHER_SUITE_AES_128_GCM_SHA256: c_int = 1;
pub const QUIC_ALLOWED_CIPHER_SUITE_AES_256_GCM_SHA384: c_int = 2;
pub const QUIC_ALLOWED_CIPHER_SUITE_CHACHA20_POLY1305_SHA256: c_int = 4;
pub const enum_QUIC_ALLOWED_CIPHER_SUITE_FLAGS = c_uint;
pub const QUIC_ALLOWED_CIPHER_SUITE_FLAGS = enum_QUIC_ALLOWED_CIPHER_SUITE_FLAGS;
pub const QUIC_CERTIFICATE_HASH_STORE_FLAG_NONE: c_int = 0;
pub const QUIC_CERTIFICATE_HASH_STORE_FLAG_MACHINE_STORE: c_int = 1;
pub const enum_QUIC_CERTIFICATE_HASH_STORE_FLAGS = c_uint;
pub const QUIC_CERTIFICATE_HASH_STORE_FLAGS = enum_QUIC_CERTIFICATE_HASH_STORE_FLAGS;
pub const QUIC_CONNECTION_SHUTDOWN_FLAG_NONE: c_int = 0;
pub const QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT: c_int = 1;
pub const enum_QUIC_CONNECTION_SHUTDOWN_FLAGS = c_uint;
pub const QUIC_CONNECTION_SHUTDOWN_FLAGS = enum_QUIC_CONNECTION_SHUTDOWN_FLAGS;
pub const QUIC_SERVER_NO_RESUME: c_int = 0;
pub const QUIC_SERVER_RESUME_ONLY: c_int = 1;
pub const QUIC_SERVER_RESUME_AND_ZERORTT: c_int = 2;
pub const enum_QUIC_SERVER_RESUMPTION_LEVEL = c_uint;
pub const QUIC_SERVER_RESUMPTION_LEVEL = enum_QUIC_SERVER_RESUMPTION_LEVEL;
pub const QUIC_SEND_RESUMPTION_FLAG_NONE: c_int = 0;
pub const QUIC_SEND_RESUMPTION_FLAG_FINAL: c_int = 1;
pub const enum_QUIC_SEND_RESUMPTION_FLAGS = c_uint;
pub const QUIC_SEND_RESUMPTION_FLAGS = enum_QUIC_SEND_RESUMPTION_FLAGS;
pub const QUIC_STREAM_SCHEDULING_SCHEME_FIFO: c_int = 0;
pub const QUIC_STREAM_SCHEDULING_SCHEME_ROUND_ROBIN: c_int = 1;
pub const QUIC_STREAM_SCHEDULING_SCHEME_COUNT: c_int = 2;
pub const enum_QUIC_STREAM_SCHEDULING_SCHEME = c_uint;
pub const QUIC_STREAM_SCHEDULING_SCHEME = enum_QUIC_STREAM_SCHEDULING_SCHEME;
pub const QUIC_STREAM_OPEN_FLAG_NONE: c_int = 0;
pub const QUIC_STREAM_OPEN_FLAG_UNIDIRECTIONAL: c_int = 1;
pub const QUIC_STREAM_OPEN_FLAG_0_RTT: c_int = 2;
pub const enum_QUIC_STREAM_OPEN_FLAGS = c_uint;
pub const QUIC_STREAM_OPEN_FLAGS = enum_QUIC_STREAM_OPEN_FLAGS;
pub const QUIC_STREAM_START_FLAG_NONE: c_int = 0;
pub const QUIC_STREAM_START_FLAG_IMMEDIATE: c_int = 1;
pub const QUIC_STREAM_START_FLAG_FAIL_BLOCKED: c_int = 2;
pub const QUIC_STREAM_START_FLAG_SHUTDOWN_ON_FAIL: c_int = 4;
pub const QUIC_STREAM_START_FLAG_INDICATE_PEER_ACCEPT: c_int = 8;
pub const enum_QUIC_STREAM_START_FLAGS = c_uint;
pub const QUIC_STREAM_START_FLAGS = enum_QUIC_STREAM_START_FLAGS;
pub const QUIC_STREAM_SHUTDOWN_FLAG_NONE: c_int = 0;
pub const QUIC_STREAM_SHUTDOWN_FLAG_GRACEFUL: c_int = 1;
pub const QUIC_STREAM_SHUTDOWN_FLAG_ABORT_SEND: c_int = 2;
pub const QUIC_STREAM_SHUTDOWN_FLAG_ABORT_RECEIVE: c_int = 4;
pub const QUIC_STREAM_SHUTDOWN_FLAG_ABORT: c_int = 6;
pub const QUIC_STREAM_SHUTDOWN_FLAG_IMMEDIATE: c_int = 8;
pub const QUIC_STREAM_SHUTDOWN_FLAG_INLINE: c_int = 16;
pub const enum_QUIC_STREAM_SHUTDOWN_FLAGS = c_uint;
pub const QUIC_STREAM_SHUTDOWN_FLAGS = enum_QUIC_STREAM_SHUTDOWN_FLAGS;
pub const QUIC_RECEIVE_FLAG_NONE: c_int = 0;
pub const QUIC_RECEIVE_FLAG_0_RTT: c_int = 1;
pub const QUIC_RECEIVE_FLAG_FIN: c_int = 2;
pub const enum_QUIC_RECEIVE_FLAGS = c_uint;
pub const QUIC_RECEIVE_FLAGS = enum_QUIC_RECEIVE_FLAGS;
pub const QUIC_SEND_FLAG_NONE: c_int = 0;
pub const QUIC_SEND_FLAG_ALLOW_0_RTT: c_int = 1;
pub const QUIC_SEND_FLAG_START: c_int = 2;
pub const QUIC_SEND_FLAG_FIN: c_int = 4;
pub const QUIC_SEND_FLAG_DGRAM_PRIORITY: c_int = 8;
pub const QUIC_SEND_FLAG_DELAY_SEND: c_int = 16;
pub const enum_QUIC_SEND_FLAGS = c_uint;
pub const QUIC_SEND_FLAGS = enum_QUIC_SEND_FLAGS;
pub const QUIC_DATAGRAM_SEND_UNKNOWN: c_int = 0;
pub const QUIC_DATAGRAM_SEND_SENT: c_int = 1;
pub const QUIC_DATAGRAM_SEND_LOST_SUSPECT: c_int = 2;
pub const QUIC_DATAGRAM_SEND_LOST_DISCARDED: c_int = 3;
pub const QUIC_DATAGRAM_SEND_ACKNOWLEDGED: c_int = 4;
pub const QUIC_DATAGRAM_SEND_ACKNOWLEDGED_SPURIOUS: c_int = 5;
pub const QUIC_DATAGRAM_SEND_CANCELED: c_int = 6;
pub const enum_QUIC_DATAGRAM_SEND_STATE = c_uint;
pub const QUIC_DATAGRAM_SEND_STATE = enum_QUIC_DATAGRAM_SEND_STATE;
pub const struct_QUIC_REGISTRATION_CONFIG = extern struct {
    AppName: [*c]const u8,
    ExecutionProfile: QUIC_EXECUTION_PROFILE,
};
pub const QUIC_REGISTRATION_CONFIG = struct_QUIC_REGISTRATION_CONFIG;
pub const QUIC_CREDENTIAL_LOAD_COMPLETE = fn (HQUIC, ?*anyopaque, c_uint) callconv(.C) void;
pub const QUIC_CREDENTIAL_LOAD_COMPLETE_HANDLER = ?*const QUIC_CREDENTIAL_LOAD_COMPLETE;
pub const struct_QUIC_CERTIFICATE_HASH = extern struct {
    ShaHash: [20]u8,
};
pub const QUIC_CERTIFICATE_HASH = struct_QUIC_CERTIFICATE_HASH;
pub const struct_QUIC_CERTIFICATE_HASH_STORE = extern struct {
    Flags: QUIC_CERTIFICATE_HASH_STORE_FLAGS,
    ShaHash: [20]u8,
    StoreName: [128]u8,
};
pub const QUIC_CERTIFICATE_HASH_STORE = struct_QUIC_CERTIFICATE_HASH_STORE;
pub const struct_QUIC_CERTIFICATE_FILE = extern struct {
    PrivateKeyFile: [*c]const u8,
    CertificateFile: [*c]const u8,
};
pub const QUIC_CERTIFICATE_FILE = struct_QUIC_CERTIFICATE_FILE;
pub const struct_QUIC_CERTIFICATE_FILE_PROTECTED = extern struct {
    PrivateKeyFile: [*c]const u8,
    CertificateFile: [*c]const u8,
    PrivateKeyPassword: [*c]const u8,
};
pub const QUIC_CERTIFICATE_FILE_PROTECTED = struct_QUIC_CERTIFICATE_FILE_PROTECTED;
pub const struct_QUIC_CERTIFICATE_PKCS12 = extern struct {
    Asn1Blob: [*c]const u8,
    Asn1BlobLength: u32,
    PrivateKeyPassword: [*c]const u8,
};
pub const QUIC_CERTIFICATE_PKCS12 = struct_QUIC_CERTIFICATE_PKCS12;
pub const QUIC_CERTIFICATE = anyopaque;
pub const QUIC_CERTIFICATE_CHAIN = anyopaque;
const union_unnamed_4 = extern union {
    CertificateHash: [*c]QUIC_CERTIFICATE_HASH,
    CertificateHashStore: [*c]QUIC_CERTIFICATE_HASH_STORE,
    CertificateContext: ?*QUIC_CERTIFICATE,
    CertificateFile: [*c]QUIC_CERTIFICATE_FILE,
    CertificateFileProtected: [*c]QUIC_CERTIFICATE_FILE_PROTECTED,
    CertificatePkcs12: [*c]QUIC_CERTIFICATE_PKCS12,
};
pub const struct_QUIC_CREDENTIAL_CONFIG = extern struct {
    Type: QUIC_CREDENTIAL_TYPE,
    Flags: QUIC_CREDENTIAL_FLAGS,
    unnamed_0: union_unnamed_4,
    Principal: [*c]const u8,
    Reserved: ?*anyopaque,
    AsyncHandler: QUIC_CREDENTIAL_LOAD_COMPLETE_HANDLER,
    AllowedCipherSuites: QUIC_ALLOWED_CIPHER_SUITE_FLAGS,
};
pub const QUIC_CREDENTIAL_CONFIG = struct_QUIC_CREDENTIAL_CONFIG;
pub const struct_QUIC_TICKET_KEY_CONFIG = extern struct {
    Id: [16]u8,
    Material: [64]u8,
    MaterialLength: u8,
};
pub const QUIC_TICKET_KEY_CONFIG = struct_QUIC_TICKET_KEY_CONFIG;
pub const struct_QUIC_BUFFER = extern struct {
    Length: u32,
    Buffer: [*c]u8,
};
pub const QUIC_BUFFER = struct_QUIC_BUFFER;
pub const struct_QUIC_NEW_CONNECTION_INFO = extern struct {
    QuicVersion: u32,
    LocalAddress: [*c]const QUIC_ADDR,
    RemoteAddress: [*c]const QUIC_ADDR,
    CryptoBufferLength: u32,
    ClientAlpnListLength: u16,
    ServerNameLength: u16,
    NegotiatedAlpnLength: u8,
    CryptoBuffer: [*c]const u8,
    ClientAlpnList: [*c]const u8,
    NegotiatedAlpn: [*c]const u8,
    ServerName: [*c]const u8,
};
pub const QUIC_NEW_CONNECTION_INFO = struct_QUIC_NEW_CONNECTION_INFO;
pub const QUIC_TLS_PROTOCOL_UNKNOWN: c_int = 0;
pub const QUIC_TLS_PROTOCOL_1_3: c_int = 12288;
pub const enum_QUIC_TLS_PROTOCOL_VERSION = c_uint;
pub const QUIC_TLS_PROTOCOL_VERSION = enum_QUIC_TLS_PROTOCOL_VERSION;
pub const QUIC_CIPHER_ALGORITHM_NONE: c_int = 0;
pub const QUIC_CIPHER_ALGORITHM_AES_128: c_int = 26126;
pub const QUIC_CIPHER_ALGORITHM_AES_256: c_int = 26128;
pub const QUIC_CIPHER_ALGORITHM_CHACHA20: c_int = 26130;
pub const enum_QUIC_CIPHER_ALGORITHM = c_uint;
pub const QUIC_CIPHER_ALGORITHM = enum_QUIC_CIPHER_ALGORITHM;
pub const QUIC_HASH_ALGORITHM_NONE: c_int = 0;
pub const QUIC_HASH_ALGORITHM_SHA_256: c_int = 32780;
pub const QUIC_HASH_ALGORITHM_SHA_384: c_int = 32781;
pub const enum_QUIC_HASH_ALGORITHM = c_uint;
pub const QUIC_HASH_ALGORITHM = enum_QUIC_HASH_ALGORITHM;
pub const QUIC_KEY_EXCHANGE_ALGORITHM_NONE: c_int = 0;
pub const enum_QUIC_KEY_EXCHANGE_ALGORITHM = c_uint;
pub const QUIC_KEY_EXCHANGE_ALGORITHM = enum_QUIC_KEY_EXCHANGE_ALGORITHM;
pub const QUIC_CIPHER_SUITE_TLS_AES_128_GCM_SHA256: c_int = 4865;
pub const QUIC_CIPHER_SUITE_TLS_AES_256_GCM_SHA384: c_int = 4866;
pub const QUIC_CIPHER_SUITE_TLS_CHACHA20_POLY1305_SHA256: c_int = 4867;
pub const enum_QUIC_CIPHER_SUITE = c_uint;
pub const QUIC_CIPHER_SUITE = enum_QUIC_CIPHER_SUITE;
pub const QUIC_CONGESTION_CONTROL_ALGORITHM_CUBIC: c_int = 0;
pub const QUIC_CONGESTION_CONTROL_ALGORITHM_MAX: c_int = 1;
pub const enum_QUIC_CONGESTION_CONTROL_ALGORITHM = c_uint;
pub const QUIC_CONGESTION_CONTROL_ALGORITHM = enum_QUIC_CONGESTION_CONTROL_ALGORITHM;
pub const struct_QUIC_HANDSHAKE_INFO = extern struct {
    TlsProtocolVersion: QUIC_TLS_PROTOCOL_VERSION,
    CipherAlgorithm: QUIC_CIPHER_ALGORITHM,
    CipherStrength: i32,
    Hash: QUIC_HASH_ALGORITHM,
    HashStrength: i32,
    KeyExchangeAlgorithm: QUIC_KEY_EXCHANGE_ALGORITHM,
    KeyExchangeStrength: i32,
    CipherSuite: QUIC_CIPHER_SUITE,
};
pub const QUIC_HANDSHAKE_INFO = struct_QUIC_HANDSHAKE_INFO; // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:387:14: warning: struct demoted to opaque type - has bitfield
pub const struct_QUIC_STATISTICS = opaque {};
pub const QUIC_STATISTICS = struct_QUIC_STATISTICS; // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:433:14: warning: struct demoted to opaque type - has bitfield
pub const struct_QUIC_STATISTICS_V2 = opaque {};
pub const QUIC_STATISTICS_V2 = struct_QUIC_STATISTICS_V2;
pub const struct_QUIC_LISTENER_STATISTICS = extern struct {
    TotalAcceptedConnections: u64,
    TotalRejectedConnections: u64,
    BindingRecvDroppedPackets: u64,
};
pub const QUIC_LISTENER_STATISTICS = struct_QUIC_LISTENER_STATISTICS;
pub const QUIC_PERF_COUNTER_CONN_CREATED: c_int = 0;
pub const QUIC_PERF_COUNTER_CONN_HANDSHAKE_FAIL: c_int = 1;
pub const QUIC_PERF_COUNTER_CONN_APP_REJECT: c_int = 2;
pub const QUIC_PERF_COUNTER_CONN_RESUMED: c_int = 3;
pub const QUIC_PERF_COUNTER_CONN_ACTIVE: c_int = 4;
pub const QUIC_PERF_COUNTER_CONN_CONNECTED: c_int = 5;
pub const QUIC_PERF_COUNTER_CONN_PROTOCOL_ERRORS: c_int = 6;
pub const QUIC_PERF_COUNTER_CONN_NO_ALPN: c_int = 7;
pub const QUIC_PERF_COUNTER_STRM_ACTIVE: c_int = 8;
pub const QUIC_PERF_COUNTER_PKTS_SUSPECTED_LOST: c_int = 9;
pub const QUIC_PERF_COUNTER_PKTS_DROPPED: c_int = 10;
pub const QUIC_PERF_COUNTER_PKTS_DECRYPTION_FAIL: c_int = 11;
pub const QUIC_PERF_COUNTER_UDP_RECV: c_int = 12;
pub const QUIC_PERF_COUNTER_UDP_SEND: c_int = 13;
pub const QUIC_PERF_COUNTER_UDP_RECV_BYTES: c_int = 14;
pub const QUIC_PERF_COUNTER_UDP_SEND_BYTES: c_int = 15;
pub const QUIC_PERF_COUNTER_UDP_RECV_EVENTS: c_int = 16;
pub const QUIC_PERF_COUNTER_UDP_SEND_CALLS: c_int = 17;
pub const QUIC_PERF_COUNTER_APP_SEND_BYTES: c_int = 18;
pub const QUIC_PERF_COUNTER_APP_RECV_BYTES: c_int = 19;
pub const QUIC_PERF_COUNTER_CONN_QUEUE_DEPTH: c_int = 20;
pub const QUIC_PERF_COUNTER_CONN_OPER_QUEUE_DEPTH: c_int = 21;
pub const QUIC_PERF_COUNTER_CONN_OPER_QUEUED: c_int = 22;
pub const QUIC_PERF_COUNTER_CONN_OPER_COMPLETED: c_int = 23;
pub const QUIC_PERF_COUNTER_WORK_OPER_QUEUE_DEPTH: c_int = 24;
pub const QUIC_PERF_COUNTER_WORK_OPER_QUEUED: c_int = 25;
pub const QUIC_PERF_COUNTER_WORK_OPER_COMPLETED: c_int = 26;
pub const QUIC_PERF_COUNTER_PATH_VALIDATED: c_int = 27;
pub const QUIC_PERF_COUNTER_PATH_FAILURE: c_int = 28;
pub const QUIC_PERF_COUNTER_SEND_STATELESS_RESET: c_int = 29;
pub const QUIC_PERF_COUNTER_SEND_STATELESS_RETRY: c_int = 30;
pub const QUIC_PERF_COUNTER_MAX: c_int = 31;
pub const enum_QUIC_PERFORMANCE_COUNTERS = c_uint;
pub const QUIC_PERFORMANCE_COUNTERS = enum_QUIC_PERFORMANCE_COUNTERS; // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:537:22: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_6 = opaque {};
const union_unnamed_5 = extern union {
    IsSetFlags: u64,
    IsSet: struct_unnamed_6,
};
pub const struct_QUIC_GLOBAL_SETTINGS = extern struct {
    unnamed_0: union_unnamed_5,
    RetryMemoryLimit: u16,
    LoadBalancingMode: u16,
};
pub const QUIC_GLOBAL_SETTINGS = struct_QUIC_GLOBAL_SETTINGS; // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:551:22: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_8 = opaque {};
const union_unnamed_7 = extern union {
    IsSetFlags: u64,
    IsSet: struct_unnamed_8,
}; // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:610:13: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_9 = opaque {};
pub const struct_QUIC_TLS_SECRETS = extern struct {
    SecretLength: u8,
    IsSet: struct_unnamed_9,
    ClientRandom: [32]u8,
    ClientEarlyTrafficSecret: [64]u8,
    ClientHandshakeTrafficSecret: [64]u8,
    ServerHandshakeTrafficSecret: [64]u8,
    ClientTrafficSecret0: [64]u8,
    ServerTrafficSecret0: [64]u8,
};
pub const QUIC_TLS_SECRETS = struct_QUIC_TLS_SECRETS;
pub const QUIC_SET_CONTEXT_FN = ?*const fn (HQUIC, ?*anyopaque) callconv(.C) void;
pub const QUIC_GET_CONTEXT_FN = ?*const fn (HQUIC) callconv(.C) ?*anyopaque;
pub const QUIC_SET_CALLBACK_HANDLER_FN = ?*const fn (HQUIC, ?*anyopaque, ?*anyopaque) callconv(.C) void;
pub const QUIC_SET_PARAM_FN = ?*const fn (HQUIC, u32, u32, ?*const anyopaque) callconv(.C) c_uint;
pub const QUIC_GET_PARAM_FN = ?*const fn (HQUIC, u32, [*c]u32, ?*anyopaque) callconv(.C) c_uint;
pub const QUIC_REGISTRATION_OPEN_FN = ?*const fn ([*c]const QUIC_REGISTRATION_CONFIG, [*c]HQUIC) callconv(.C) c_uint;
pub const QUIC_REGISTRATION_CLOSE_FN = ?*const fn (HQUIC) callconv(.C) void;
pub const QUIC_REGISTRATION_SHUTDOWN_FN = ?*const fn (HQUIC, QUIC_CONNECTION_SHUTDOWN_FLAGS, QUIC_UINT62) callconv(.C) void;
pub const QUIC_CONFIGURATION_OPEN_FN = ?*const fn (HQUIC, [*c]const QUIC_BUFFER, u32, ?*const QUIC_SETTINGS, u32, ?*anyopaque, [*c]HQUIC) callconv(.C) c_uint;
pub const QUIC_CONFIGURATION_CLOSE_FN = ?*const fn (HQUIC) callconv(.C) void;
pub const QUIC_CONFIGURATION_LOAD_CREDENTIAL_FN = ?*const fn (HQUIC, [*c]const QUIC_CREDENTIAL_CONFIG) callconv(.C) c_uint;
pub const QUIC_LISTENER_EVENT_NEW_CONNECTION: c_int = 0;
pub const QUIC_LISTENER_EVENT_STOP_COMPLETE: c_int = 1;
pub const enum_QUIC_LISTENER_EVENT_TYPE = c_uint;
pub const QUIC_LISTENER_EVENT_TYPE = enum_QUIC_LISTENER_EVENT_TYPE;
const struct_unnamed_11 = extern struct {
    Info: [*c]const QUIC_NEW_CONNECTION_INFO,
    Connection: HQUIC,
}; // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:918:21: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_12 = opaque {};
const union_unnamed_10 = extern union {
    NEW_CONNECTION: LISTENER_NEW_CONNECTION_WRAPPER,
    STOP_COMPLETE: LISTENER_STOP_COMPLETE_WRAPPER,
};
pub const struct_QUIC_LISTENER_EVENT = extern struct {
    Type: QUIC_LISTENER_EVENT_TYPE,
    unnamed_0: union_unnamed_10,
};
pub const QUIC_LISTENER_EVENT = struct_QUIC_LISTENER_EVENT;
pub const QUIC_LISTENER_CALLBACK = fn (HQUIC, ?*anyopaque, ?*QUIC_LISTENER_EVENT) callconv(.C) c_uint;
pub const QUIC_LISTENER_CALLBACK_HANDLER = ?*const QUIC_LISTENER_CALLBACK;
pub const QUIC_LISTENER_OPEN_FN = ?*const fn (HQUIC, QUIC_LISTENER_CALLBACK_HANDLER, ?*anyopaque, [*c]HQUIC) callconv(.C) c_uint;
pub const QUIC_LISTENER_CLOSE_FN = ?*const fn (HQUIC) callconv(.C) void;
pub const QUIC_LISTENER_START_FN = ?*const fn (HQUIC, [*c]const QUIC_BUFFER, u32, [*c]const QUIC_ADDR) callconv(.C) c_uint;
pub const QUIC_LISTENER_STOP_FN = ?*const fn (HQUIC) callconv(.C) void;
pub const QUIC_CONNECTION_EVENT_CONNECTED: c_int = 0;
pub const QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_TRANSPORT: c_int = 1;
pub const QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_PEER: c_int = 2;
pub const QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE: c_int = 3;
pub const QUIC_CONNECTION_EVENT_LOCAL_ADDRESS_CHANGED: c_int = 4;
pub const QUIC_CONNECTION_EVENT_PEER_ADDRESS_CHANGED: c_int = 5;
pub const QUIC_CONNECTION_EVENT_PEER_STREAM_STARTED: c_int = 6;
pub const QUIC_CONNECTION_EVENT_STREAMS_AVAILABLE: c_int = 7;
pub const QUIC_CONNECTION_EVENT_PEER_NEEDS_STREAMS: c_int = 8;
pub const QUIC_CONNECTION_EVENT_IDEAL_PROCESSOR_CHANGED: c_int = 9;
pub const QUIC_CONNECTION_EVENT_DATAGRAM_STATE_CHANGED: c_int = 10;
pub const QUIC_CONNECTION_EVENT_DATAGRAM_RECEIVED: c_int = 11;
pub const QUIC_CONNECTION_EVENT_DATAGRAM_SEND_STATE_CHANGED: c_int = 12;
pub const QUIC_CONNECTION_EVENT_RESUMED: c_int = 13;
pub const QUIC_CONNECTION_EVENT_RESUMPTION_TICKET_RECEIVED: c_int = 14;
pub const QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED: c_int = 15;
pub const enum_QUIC_CONNECTION_EVENT_TYPE = c_uint;
pub const QUIC_CONNECTION_EVENT_TYPE = enum_QUIC_CONNECTION_EVENT_TYPE;
const struct_unnamed_14 = extern struct {
    SessionResumed: BOOLEAN,
    NegotiatedAlpnLength: u8,
    NegotiatedAlpn: [*c]const u8,
};
const struct_unnamed_15 = extern struct {
    Status: c_uint,
};
const struct_unnamed_16 = extern struct {
    ErrorCode: QUIC_UINT62,
}; // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:1025:21: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_17 = opaque {};
const struct_unnamed_18 = extern struct {
    Address: [*c]const QUIC_ADDR,
};
const struct_unnamed_19 = extern struct {
    Address: [*c]const QUIC_ADDR,
};
const struct_unnamed_20 = extern struct {
    Stream: HQUIC,
    Flags: QUIC_STREAM_OPEN_FLAGS,
};
const struct_unnamed_21 = extern struct {
    BidirectionalCount: u16,
    UnidirectionalCount: u16,
};
const struct_unnamed_22 = extern struct {
    IdealProcessor: u16,
};
const struct_unnamed_23 = extern struct {
    SendEnabled: BOOLEAN,
    MaxSendLength: u16,
};
const struct_unnamed_24 = extern struct {
    Buffer: [*c]const QUIC_BUFFER,
    Flags: QUIC_RECEIVE_FLAGS,
};
const struct_unnamed_25 = extern struct {
    ClientContext: ?*anyopaque,
    State: QUIC_DATAGRAM_SEND_STATE,
};
const struct_unnamed_26 = extern struct {
    ResumptionStateLength: u16,
    ResumptionState: [*c]const u8,
};
const struct_unnamed_27 = extern struct {
    ResumptionTicketLength: u32,
    ResumptionTicket: [*c]const u8,
};
const struct_unnamed_28 = extern struct {
    Certificate: ?*QUIC_CERTIFICATE,
    DeferredErrorFlags: u32,
    DeferredStatus: c_uint,
    Chain: ?*QUIC_CERTIFICATE_CHAIN,
};
const union_unnamed_13 = extern union {
    CONNECTED: struct_unnamed_14,
    SHUTDOWN_INITIATED_BY_TRANSPORT: struct_unnamed_15,
    SHUTDOWN_INITIATED_BY_PEER: SHUTDOWN_INITIATED_BY_PEER,
    SHUTDOWN_COMPLETE: CONN_SHUTDOWN_COMPLETE,
    LOCAL_ADDRESS_CHANGED: struct_unnamed_18,
    PEER_ADDRESS_CHANGED: struct_unnamed_19,
    PEER_STREAM_STARTED: struct_unnamed_20,
    STREAMS_AVAILABLE: struct_unnamed_21,
    IDEAL_PROCESSOR_CHANGED: struct_unnamed_22,
    DATAGRAM_STATE_CHANGED: struct_unnamed_23,
    DATAGRAM_RECEIVED: struct_unnamed_24,
    DATAGRAM_SEND_STATE_CHANGED: struct_unnamed_25,
    RESUMED: struct_unnamed_26,
    RESUMPTION_TICKET_RECEIVED: struct_unnamed_27,
    PEER_CERTIFICATE_RECEIVED: struct_unnamed_28,
};
pub const struct_QUIC_CONNECTION_EVENT = extern struct {
    Type: QUIC_CONNECTION_EVENT_TYPE,
    unnamed_0: union_unnamed_13,
};
pub const QUIC_CONNECTION_EVENT = struct_QUIC_CONNECTION_EVENT;
pub const QUIC_CONNECTION_CALLBACK = fn (HQUIC, ?*anyopaque, ?*QUIC_CONNECTION_EVENT) callconv(.C) c_uint;
pub const QUIC_CONNECTION_CALLBACK_HANDLER = ?*const QUIC_CONNECTION_CALLBACK;
pub const QUIC_CONNECTION_OPEN_FN = ?*const fn (HQUIC, QUIC_CONNECTION_CALLBACK_HANDLER, ?*anyopaque, [*c]HQUIC) callconv(.C) c_uint;
pub const QUIC_CONNECTION_CLOSE_FN = ?*const fn (HQUIC) callconv(.C) void;
pub const QUIC_CONNECTION_SHUTDOWN_FN = ?*const fn (HQUIC, QUIC_CONNECTION_SHUTDOWN_FLAGS, QUIC_UINT62) callconv(.C) void;
pub const QUIC_CONNECTION_START_FN = ?*const fn (HQUIC, HQUIC, QUIC_ADDRESS_FAMILY, [*c]const u8, u16) callconv(.C) c_uint;
pub const QUIC_CONNECTION_SET_CONFIGURATION_FN = ?*const fn (HQUIC, HQUIC) callconv(.C) c_uint;
pub const QUIC_CONNECTION_SEND_RESUMPTION_FN = ?*const fn (HQUIC, QUIC_SEND_RESUMPTION_FLAGS, u16, [*c]const u8) callconv(.C) c_uint;
pub const QUIC_STREAM_EVENT_START_COMPLETE: c_int = 0;
pub const QUIC_STREAM_EVENT_RECEIVE: c_int = 1;
pub const QUIC_STREAM_EVENT_SEND_COMPLETE: c_int = 2;
pub const QUIC_STREAM_EVENT_PEER_SEND_SHUTDOWN: c_int = 3;
pub const QUIC_STREAM_EVENT_PEER_SEND_ABORTED: c_int = 4;
pub const QUIC_STREAM_EVENT_PEER_RECEIVE_ABORTED: c_int = 5;
pub const QUIC_STREAM_EVENT_SEND_SHUTDOWN_COMPLETE: c_int = 6;
pub const QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE: c_int = 7;
pub const QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE: c_int = 8;
pub const QUIC_STREAM_EVENT_PEER_ACCEPTED: c_int = 9;
pub const enum_QUIC_STREAM_EVENT_TYPE = c_uint;
pub const QUIC_STREAM_EVENT_TYPE = enum_QUIC_STREAM_EVENT_TYPE; // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:1195:21: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_30 = opaque {};
const struct_unnamed_31 = extern struct {
    AbsoluteOffset: u64,
    TotalBufferLength: u64,
    Buffers: [*c]const QUIC_BUFFER,
    BufferCount: u32,
    Flags: QUIC_RECEIVE_FLAGS,
};
const struct_unnamed_32 = extern struct {
    Canceled: BOOLEAN,
    ClientContext: ?*anyopaque,
};
const struct_unnamed_33 = extern struct {
    ErrorCode: QUIC_UINT62,
};
const struct_unnamed_34 = extern struct {
    ErrorCode: QUIC_UINT62,
};
const struct_unnamed_35 = extern struct {
    Graceful: BOOLEAN,
}; // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:1222:21: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_37 = extern struct {
    ByteCount: u64,
};
const union_unnamed_29 = extern union {
    START_COMPLETE: STREAM_START_COMPLETE,
    RECEIVE: struct_unnamed_31,
    SEND_COMPLETE: struct_unnamed_32,
    PEER_SEND_ABORTED: struct_unnamed_33,
    PEER_RECEIVE_ABORTED: struct_unnamed_34,
    SEND_SHUTDOWN_COMPLETE: struct_unnamed_35,
    SHUTDOWN_COMPLETE: STREAM_SHUTDOWN_COMPLETE,
    IDEAL_SEND_BUFFER_SIZE: struct_unnamed_37,
};
pub const struct_QUIC_STREAM_EVENT = extern struct {
    Type: QUIC_STREAM_EVENT_TYPE,
    unnamed_0: union_unnamed_29,
};
pub const QUIC_STREAM_EVENT = struct_QUIC_STREAM_EVENT;
pub const QUIC_STREAM_CALLBACK = fn (HQUIC, ?*anyopaque, ?*QUIC_STREAM_EVENT) callconv(.C) c_uint;
pub const QUIC_STREAM_CALLBACK_HANDLER = ?*const QUIC_STREAM_CALLBACK;
pub const QUIC_STREAM_OPEN_FN = ?*const fn (HQUIC, QUIC_STREAM_OPEN_FLAGS, QUIC_STREAM_CALLBACK_HANDLER, ?*anyopaque, [*c]HQUIC) callconv(.C) c_uint;
pub const QUIC_STREAM_CLOSE_FN = ?*const fn (HQUIC) callconv(.C) void;
pub const QUIC_STREAM_START_FN = ?*const fn (HQUIC, QUIC_STREAM_START_FLAGS) callconv(.C) c_uint;
pub const QUIC_STREAM_SHUTDOWN_FN = ?*const fn (HQUIC, QUIC_STREAM_SHUTDOWN_FLAGS, QUIC_UINT62) callconv(.C) c_uint;
pub const QUIC_STREAM_SEND_FN = ?*const fn (HQUIC, [*c]const QUIC_BUFFER, u32, QUIC_SEND_FLAGS, ?*anyopaque) callconv(.C) c_uint;
pub const QUIC_STREAM_RECEIVE_COMPLETE_FN = ?*const fn (HQUIC, u64) callconv(.C) void;
pub const QUIC_STREAM_RECEIVE_SET_ENABLED_FN = ?*const fn (HQUIC, BOOLEAN) callconv(.C) c_uint;
pub const QUIC_DATAGRAM_SEND_FN = ?*const fn (HQUIC, [*c]const QUIC_BUFFER, u32, QUIC_SEND_FLAGS, ?*anyopaque) callconv(.C) c_uint;
pub const struct_QUIC_API_TABLE = extern struct {
    SetContext: QUIC_SET_CONTEXT_FN,
    GetContext: QUIC_GET_CONTEXT_FN,
    SetCallbackHandler: QUIC_SET_CALLBACK_HANDLER_FN,
    SetParam: QUIC_SET_PARAM_FN,
    GetParam: QUIC_GET_PARAM_FN,
    RegistrationOpen: QUIC_REGISTRATION_OPEN_FN,
    RegistrationClose: QUIC_REGISTRATION_CLOSE_FN,
    RegistrationShutdown: QUIC_REGISTRATION_SHUTDOWN_FN,
    ConfigurationOpen: QUIC_CONFIGURATION_OPEN_FN,
    ConfigurationClose: QUIC_CONFIGURATION_CLOSE_FN,
    ConfigurationLoadCredential: QUIC_CONFIGURATION_LOAD_CREDENTIAL_FN,
    ListenerOpen: QUIC_LISTENER_OPEN_FN,
    ListenerClose: QUIC_LISTENER_CLOSE_FN,
    ListenerStart: QUIC_LISTENER_START_FN,
    ListenerStop: QUIC_LISTENER_STOP_FN,
    ConnectionOpen: QUIC_CONNECTION_OPEN_FN,
    ConnectionClose: QUIC_CONNECTION_CLOSE_FN,
    ConnectionShutdown: QUIC_CONNECTION_SHUTDOWN_FN,
    ConnectionStart: QUIC_CONNECTION_START_FN,
    ConnectionSetConfiguration: QUIC_CONNECTION_SET_CONFIGURATION_FN,
    ConnectionSendResumptionTicket: QUIC_CONNECTION_SEND_RESUMPTION_FN,
    StreamOpen: QUIC_STREAM_OPEN_FN,
    StreamClose: QUIC_STREAM_CLOSE_FN,
    StreamStart: QUIC_STREAM_START_FN,
    StreamShutdown: QUIC_STREAM_SHUTDOWN_FN,
    StreamSend: QUIC_STREAM_SEND_FN,
    StreamReceiveComplete: QUIC_STREAM_RECEIVE_COMPLETE_FN,
    StreamReceiveSetEnabled: QUIC_STREAM_RECEIVE_SET_ENABLED_FN,
    DatagramSend: QUIC_DATAGRAM_SEND_FN,
};
pub const QUIC_API_TABLE = struct_QUIC_API_TABLE;
pub extern fn MsQuicOpenVersion(Version: u32, QuicApi: [*c]?*const anyopaque) c_uint;
pub extern fn MsQuicClose(QuicApi: ?*const anyopaque) void;
pub const __block = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // (no file):27:9
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):82:9
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):88:9
pub const __FLT16_DENORM_MIN__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):111:9
pub const __FLT16_EPSILON__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):115:9
pub const __FLT16_MAX__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):121:9
pub const __FLT16_MIN__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):124:9
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`"); // (no file):184:9
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // (no file):206:9
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`"); // (no file):214:9
pub const __USER_LABEL_PREFIX__ = @compileError("unable to translate macro: undefined identifier `_`"); // (no file):305:9
pub const __nonnull = @compileError("unable to translate macro: undefined identifier `_Nonnull`"); // (no file):336:9
pub const __null_unspecified = @compileError("unable to translate macro: undefined identifier `_Null_unspecified`"); // (no file):337:9
pub const __nullable = @compileError("unable to translate macro: undefined identifier `_Nullable`"); // (no file):338:9
pub const __weak = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // (no file):393:9
pub const __AVAILABILITY_INTERNAL_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:109:9
pub const __AVAILABILITY_INTERNAL_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:112:17
pub const __AVAILABILITY_INTERNAL_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:121:9
pub const __AVAILABILITY_INTERNAL_WEAK_IMPORT = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:122:9
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2922:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2923:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2924:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2926:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2930:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2932:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2937:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2941:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2942:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2944:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2948:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2950:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2954:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2956:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2961:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2965:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2966:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2968:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2972:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2974:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2978:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2980:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2985:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2990:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2994:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:2996:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3000:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3002:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3006:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3008:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3012:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3014:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3018:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3020:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3024:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3026:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3030:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3032:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3036:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3038:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3042:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3043:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3044:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3045:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3046:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3047:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3049:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3053:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3055:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3060:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3064:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3065:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3067:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3071:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3073:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3077:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3079:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3084:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3088:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3089:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3091:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3095:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3097:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3101:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3103:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3108:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3112:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3113:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3115:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3119:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3121:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3125:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3127:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3131:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3133:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3137:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3139:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3143:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3145:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3149:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3151:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3155:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3157:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3162:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3163:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3164:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3165:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3166:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3168:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3172:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3174:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3179:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3183:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3184:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3186:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3190:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3192:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3196:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3198:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3203:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3207:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3208:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3210:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3214:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3216:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3220:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3222:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3227:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3231:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3232:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3234:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3238:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3240:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3244:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3246:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3250:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3252:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3256:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3258:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3262:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3264:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3268:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3270:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3274:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3275:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3276:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3277:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3278:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3279:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3281:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3285:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3287:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3292:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3296:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3297:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3299:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3303:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3305:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3309:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3311:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3316:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3320:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3321:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3323:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3327:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3329:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3333:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3335:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3340:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3344:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3345:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3347:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3351:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3353:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3357:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3359:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3363:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3365:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3369:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3371:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3375:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3377:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3381:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3382:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3383:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEPRECATED__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3384:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3385:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3386:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3387:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3389:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3393:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3395:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3400:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3404:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3405:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3407:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3411:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3413:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3417:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3419:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3424:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3428:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3429:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3431:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3435:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3437:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3441:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3443:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3448:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3452:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3454:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3458:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3460:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3464:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3466:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3470:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3472:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3476:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3478:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3482:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3483:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3484:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3485:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3486:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3487:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3489:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3493:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3495:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3500:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3504:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3505:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3507:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3511:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3513:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3517:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3519:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3524:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3528:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3529:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3531:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3535:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3537:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3541:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3543:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3548:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3552:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3553:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3555:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3559:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3561:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3565:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3567:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3571:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3573:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3577:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3578:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3579:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3580:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3581:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3582:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3584:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3588:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3590:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3595:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3599:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3600:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3602:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3606:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3608:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3612:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3614:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3619:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3623:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3624:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3626:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3630:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3632:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3636:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3638:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3643:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_13_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3647:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3648:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3650:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3654:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3656:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3660:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3662:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3666:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3667:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3668:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3669:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3670:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3671:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3673:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3677:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3679:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3684:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3688:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3689:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3691:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3695:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3697:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3701:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3703:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3708:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3712:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3713:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3715:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3719:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3721:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3725:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3727:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3732:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3736:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3737:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3739:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3743:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3745:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3749:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3750:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3751:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3752:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3753:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3754:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3756:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3760:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3762:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3767:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3771:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3772:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3774:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3778:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3780:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3784:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3786:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3791:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3795:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3796:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3798:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3802:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3804:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3808:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3810:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3815:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3819:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3820:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3821:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3823:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3827:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3828:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3829:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3830:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3832:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3836:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3837:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3838:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3840:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3844:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3846:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3851:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3855:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3856:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3858:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3862:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3864:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3868:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3870:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3875:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3879:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3880:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3882:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3886:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3888:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3892:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3894:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3899:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3903:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3905:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3909:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3911:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3915:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3917:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3921:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3923:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3927:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3929:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3933:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3935:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3939:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3941:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3945:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3947:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3951:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3953:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3958:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3962:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3963:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3964:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3965:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3966:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3967:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3969:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3973:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3975:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3979:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3980:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3982:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3986:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3988:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3992:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3994:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:3999:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4003:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4004:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4006:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4010:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4012:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4016:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4018:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4023:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4027:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4028:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4029:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4030:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4032:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4036:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4037:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4039:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4043:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4045:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4049:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4051:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4056:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4060:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4061:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4063:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4067:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4069:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4073:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4075:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4080:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4084:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4085:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4086:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4087:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4088:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4090:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4094:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4096:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4101:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4105:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4106:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4108:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4112:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4114:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4118:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4120:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4125:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4129:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4130:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4132:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4136:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4138:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4142:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4144:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4149:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4153:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4155:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4159:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4160:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4162:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4163:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4164:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4166:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4170:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4172:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4176:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4178:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4182:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4183:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4185:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4189:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4191:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4195:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4197:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4202:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4206:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4207:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4208:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4209:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4211:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4215:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4217:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4221:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4222:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4224:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4228:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4230:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4234:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4236:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4241:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4245:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4246:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4247:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4248:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4250:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4254:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4255:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4257:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4261:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4263:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4267:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4269:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4274:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4278:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4279:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4280:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4281:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4282:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4284:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4288:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4290:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4294:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4296:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4301:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4305:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4306:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4308:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4312:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4314:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4318:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4320:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4325:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4329:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4330:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4331:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4332:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4333:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4335:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4339:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4341:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4345:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4347:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4351:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4352:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4353:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4354:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4356:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4360:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4362:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4366:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4367:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4368:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4369:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4371:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4375:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4376:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4377:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4378:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4380:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4384:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4386:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4390:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4392:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4397:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4401:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4403:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4407:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4408:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4409:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4410:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4411:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13_4 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4412:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4413:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14_DEP__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4414:21
pub const __AVAILABILITY_INTERNAL__MAC_10_15 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4415:21
pub const __AVAILABILITY_INTERNAL__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4417:21
pub const __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4418:21
pub const __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4419:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4421:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4422:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4423:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4424:21
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4427:22
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4428:22
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4429:22
pub const __API_AVAILABLE_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4445:13
pub const __API_AVAILABLE_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4446:13
pub const __API_AVAILABLE_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4447:13
pub const __API_AVAILABLE_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4448:13
pub const __API_AVAILABLE_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4449:13
pub const __API_AVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4451:13
pub const __API_AVAILABLE_PLATFORM_uikitformac = @compileError("unable to translate macro: undefined identifier `uikitformac`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4454:14
pub const __API_AVAILABLE_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4456:13
pub const __API_A = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4460:17
pub const __API_AVAILABLE2 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4469:13
pub const __API_AVAILABLE3 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4470:13
pub const __API_AVAILABLE4 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4471:13
pub const __API_AVAILABLE5 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4472:13
pub const __API_AVAILABLE6 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4473:13
pub const __API_AVAILABLE7 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4474:13
pub const __API_AVAILABLE_GET_MACRO = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4475:13
pub const __API_APPLY_TO = @compileError("unable to translate macro: undefined identifier `any`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4477:13
pub const __API_RANGE_STRINGIFY2 = @compileError("unable to translate C expr: unexpected token '#'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4479:13
pub const __API_A_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4481:13
pub const __API_AVAILABLE_BEGIN2 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4484:13
pub const __API_AVAILABLE_BEGIN3 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4485:13
pub const __API_AVAILABLE_BEGIN4 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4486:13
pub const __API_AVAILABLE_BEGIN5 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4487:13
pub const __API_AVAILABLE_BEGIN6 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4488:13
pub const __API_AVAILABLE_BEGIN7 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4489:13
pub const __API_AVAILABLE_BEGIN_GET_MACRO = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4490:13
pub const __API_DEPRECATED_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4493:13
pub const __API_DEPRECATED_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4494:13
pub const __API_DEPRECATED_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4495:13
pub const __API_DEPRECATED_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4496:13
pub const __API_DEPRECATED_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4497:13
pub const __API_DEPRECATED_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4499:13
pub const __API_DEPRECATED_PLATFORM_uikitformac = @compileError("unable to translate macro: undefined identifier `uikitformac`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4502:14
pub const __API_DEPRECATED_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4504:13
pub const __API_D = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4508:17
pub const __API_DEPRECATED_MSG3 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4517:13
pub const __API_DEPRECATED_MSG4 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4518:13
pub const __API_DEPRECATED_MSG5 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4519:13
pub const __API_DEPRECATED_MSG6 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4520:13
pub const __API_DEPRECATED_MSG7 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4521:13
pub const __API_DEPRECATED_MSG8 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4522:13
pub const __API_DEPRECATED_MSG_GET_MACRO = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4523:13
pub const __API_D_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4525:13
pub const __API_DEPRECATED_BEGIN_MSG3 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4528:13
pub const __API_DEPRECATED_BEGIN_MSG4 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4529:13
pub const __API_DEPRECATED_BEGIN_MSG5 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4530:13
pub const __API_DEPRECATED_BEGIN_MSG6 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4531:13
pub const __API_DEPRECATED_BEGIN_MSG7 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4532:13
pub const __API_DEPRECATED_BEGIN_MSG8 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4533:13
pub const __API_DEPRECATED_BEGIN_MSG_GET_MACRO = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4534:13
pub const __API_R = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4537:17
pub const __API_DEPRECATED_REP3 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4543:13
pub const __API_DEPRECATED_REP4 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4544:13
pub const __API_DEPRECATED_REP5 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4545:13
pub const __API_DEPRECATED_REP6 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4546:13
pub const __API_DEPRECATED_REP7 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4547:13
pub const __API_DEPRECATED_REP8 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4548:13
pub const __API_DEPRECATED_REP_GET_MACRO = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4549:13
pub const __API_R_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4552:17
pub const __API_DEPRECATED_BEGIN_REP3 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4558:13
pub const __API_DEPRECATED_BEGIN_REP4 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4559:13
pub const __API_DEPRECATED_BEGIN_REP5 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4560:13
pub const __API_DEPRECATED_BEGIN_REP6 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4561:13
pub const __API_DEPRECATED_BEGIN_REP7 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4562:13
pub const __API_DEPRECATED_BEGIN_REP8 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4563:13
pub const __API_DEPRECATED_BEGIN_REP_GET_MACRO = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4564:13
pub const __API_UNAVAILABLE_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4574:13
pub const __API_UNAVAILABLE_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4575:13
pub const __API_UNAVAILABLE_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4576:13
pub const __API_UNAVAILABLE_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4577:13
pub const __API_UNAVAILABLE_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4578:13
pub const __API_UNAVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4580:13
pub const __API_UNAVAILABLE_PLATFORM_uikitformac = @compileError("unable to translate macro: undefined identifier `uikitformac`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4583:14
pub const __API_UNAVAILABLE_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4585:13
pub const __API_U = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4589:17
pub const __API_UNAVAILABLE2 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4598:13
pub const __API_UNAVAILABLE3 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4599:13
pub const __API_UNAVAILABLE4 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4600:13
pub const __API_UNAVAILABLE5 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4601:13
pub const __API_UNAVAILABLE6 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4602:13
pub const __API_UNAVAILABLE7 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4603:13
pub const __API_UNAVAILABLE_GET_MACRO = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4604:13
pub const __API_U_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4606:13
pub const __API_UNAVAILABLE_BEGIN2 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4609:13
pub const __API_UNAVAILABLE_BEGIN3 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4610:13
pub const __API_UNAVAILABLE_BEGIN4 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4611:13
pub const __API_UNAVAILABLE_BEGIN5 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4612:13
pub const __API_UNAVAILABLE_BEGIN6 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4613:13
pub const __API_UNAVAILABLE_BEGIN7 = @compileError("unable to translate macro: undefined identifier `g`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4614:13
pub const __API_UNAVAILABLE_BEGIN_GET_MACRO = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4615:13
pub const __swift_compiler_version_at_least = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4664:13
pub const __SPI_AVAILABLE = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/AvailabilityInternal.h:4672:11
pub const __OSX_AVAILABLE_STARTING = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:172:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:173:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:175:17
pub const __OS_AVAILABILITY = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:198:13
pub const __OS_AVAILABILITY_MSG = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:199:13
pub const __OSX_EXTENSION_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx_app_extension`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:216:13
pub const __IOS_EXTENSION_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `ios_app_extension`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:217:13
pub const __OS_EXTENSION_UNAVAILABLE = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:227:9
pub const __OSX_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:234:13
pub const __OSX_AVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:235:13
pub const __OSX_DEPRECATED = @compileError("unable to translate macro: undefined identifier `macosx`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:236:13
pub const __IOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:256:13
pub const __IOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:257:13
pub const __IOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:258:13
pub const __IOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `ios`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:259:13
pub const __TVOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:283:13
pub const __TVOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:284:13
pub const __TVOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:285:13
pub const __TVOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `tvos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:286:13
pub const __WATCHOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:310:13
pub const __WATCHOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:311:13
pub const __WATCHOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:312:13
pub const __WATCHOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `watchos`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:313:13
pub const __SWIFT_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `swift`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:337:13
pub const __SWIFT_UNAVAILABLE_MSG = @compileError("unable to translate macro: undefined identifier `swift`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:338:13
pub const __API_AVAILABLE = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:381:13
pub const __API_AVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:383:13
pub const __API_AVAILABLE_END = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:384:13
pub const __API_DEPRECATED = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:402:13
pub const __API_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:403:13
pub const __API_DEPRECATED_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:405:13
pub const __API_DEPRECATED_END = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:406:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:408:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_END = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:409:13
pub const __API_UNAVAILABLE = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:419:13
pub const __API_UNAVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:421:13
pub const __API_UNAVAILABLE_END = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:422:13
pub const __SPI_DEPRECATED = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:475:11
pub const __SPI_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/Availability.h:479:11
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:113:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:114:9
pub const __const = @compileError("unable to translate C expr: unexpected token 'const'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:116:9
pub const __volatile = @compileError("unable to translate C expr: unexpected token 'volatile'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:118:9
pub const __dead2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:155:9
pub const __pure2 = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:156:9
pub const __unused = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:161:9
pub const __used = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:166:9
pub const __cold = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:172:9
pub const __exported = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:182:9
pub const __exported_push = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:183:9
pub const __exported_pop = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:184:9
pub const __deprecated = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:196:9
pub const __deprecated_msg = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:200:10
pub const __kpi_deprecated = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:211:9
pub const __unavailable = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:217:9
pub const __restrict = @compileError("unable to translate C expr: unexpected token 'restrict'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:239:9
pub const __disable_tail_calls = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:272:9
pub const __not_tail_called = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:284:9
pub const __result_use_check = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:295:9
pub const __swift_unavailable = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:305:9
pub const __header_inline = @compileError("unable to translate C expr: unexpected token 'inline'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:339:10
pub const __header_always_inline = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:352:10
pub const __unreachable_ok_push = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:365:10
pub const __unreachable_ok_pop = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:368:10
pub const __printflike = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:389:9
pub const __printf0like = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:391:9
pub const __scanflike = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:393:9
pub const __IDSTRING = @compileError("unable to translate C expr: unexpected token 'static'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:396:9
pub const __COPYRIGHT = @compileError("unable to translate macro: undefined identifier `copyright`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:399:9
pub const __RCSID = @compileError("unable to translate macro: undefined identifier `rcsid`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:403:9
pub const __SCCSID = @compileError("unable to translate macro: undefined identifier `sccsid`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:407:9
pub const __PROJECT_VERSION = @compileError("unable to translate macro: undefined identifier `project_version`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:411:9
pub const __FBSDID = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:416:9
pub const __DECONST = @compileError("unable to translate C expr: unexpected token 'const'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:420:9
pub const __DEVOLATILE = @compileError("unable to translate C expr: unexpected token 'volatile'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:424:9
pub const __DEQUALIFY = @compileError("unable to translate C expr: unexpected token 'const'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:428:9
pub const __alloc_size = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:446:9
pub const __DARWIN_ALIAS = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:631:9
pub const __DARWIN_ALIAS_C = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:632:9
pub const __DARWIN_ALIAS_I = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:633:9
pub const __DARWIN_NOCANCEL = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:634:9
pub const __DARWIN_INODE64 = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:635:9
pub const __DARWIN_1050 = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:637:9
pub const __DARWIN_1050ALIAS = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:638:9
pub const __DARWIN_1050ALIAS_C = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:639:9
pub const __DARWIN_1050ALIAS_I = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:640:9
pub const __DARWIN_1050INODE64 = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:641:9
pub const __DARWIN_EXTSN = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:643:9
pub const __DARWIN_EXTSN_C = @compileError("unable to translate macro: undefined identifier `__asm`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:644:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:35:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:41:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_2 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:47:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:53:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:59:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_2 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:65:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:71:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:77:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_2 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:83:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_3 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:89:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:95:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:101:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:107:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:113:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:119:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:125:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:131:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:137:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_2 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:143:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_3 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:149:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_4 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:155:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:161:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:167:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_2 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:173:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_3 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:179:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:185:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:191:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_2 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:197:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_3 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:203:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:209:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:215:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_2 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:221:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_3 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:227:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_4 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:233:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:239:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:245:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_2 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:251:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_3 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:257:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_4 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:263:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:269:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:275:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_2 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:281:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_3 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:287:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_4 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:293:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_5 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:299:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_6 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:305:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_7 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:311:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_0 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:317:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_1 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:323:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_2 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:329:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_3 = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_symbol_aliasing.h:335:9
pub const __DARWIN_ALIAS_STARTING = @compileError("unable to translate macro: undefined identifier `__DARWIN_ALIAS_STARTING_MAC_`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:654:9
pub const __POSIX_C_DEPRECATED = @compileError("unable to translate macro: undefined identifier `___POSIX_C_DEPRECATED_STARTING_`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:717:9
pub const __XNU_PRIVATE_EXTERN = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:817:9
pub const __compiler_barrier = @compileError("unable to translate macro: undefined identifier `__asm__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:833:9
pub const __enum_open = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:836:9
pub const __enum_closed = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:837:9
pub const __enum_options = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:844:9
pub const __enum_decl = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:857:9
pub const __enum_closed_decl = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:859:9
pub const __options_decl = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:861:9
pub const __options_closed_decl = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/cdefs.h:863:9
pub const __offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_types.h:83:9
pub const __strfmonlike = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/_types.h:31:9
pub const __strftimelike = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/_types.h:33:9
pub const SIG_DFL = @compileError("unable to translate C expr: expected ')' instead got '('"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/signal.h:131:9
pub const SIG_IGN = @compileError("unable to translate C expr: expected ')' instead got '('"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/signal.h:132:9
pub const SIG_HOLD = @compileError("unable to translate C expr: expected ')' instead got '('"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/signal.h:133:9
pub const SIG_ERR = @compileError("unable to translate C expr: expected ')' instead got '('"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/signal.h:134:9
pub const __darwin_arm_thread_state64_set_pc_fptr = @compileError("unable to translate C expr: expected ')' instead got '='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/mach/arm/_structs.h:351:9
pub const __darwin_arm_thread_state64_set_lr_fptr = @compileError("unable to translate C expr: expected ')' instead got '='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/mach/arm/_structs.h:360:9
pub const __darwin_arm_thread_state64_set_sp = @compileError("unable to translate C expr: expected ')' instead got '='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/mach/arm/_structs.h:366:9
pub const __darwin_arm_thread_state64_set_fp = @compileError("unable to translate C expr: expected ')' instead got '='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/mach/arm/_structs.h:372:9
pub const sv_onstack = @compileError("unable to translate macro: undefined identifier `sv_flags`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/signal.h:361:9
pub const ru_first = @compileError("unable to translate macro: undefined identifier `ru_ixrss`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/resource.h:164:9
pub const ru_last = @compileError("unable to translate macro: undefined identifier `ru_nivcsw`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/resource.h:178:9
pub const __DARWIN_OS_INLINE = @compileError("unable to translate C expr: unexpected token 'static'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/libkern/_OSByteOrder.h:67:17
pub const NTOHL = @compileError("unable to translate C expr: unexpected token '='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_endian.h:143:9
pub const NTOHS = @compileError("unable to translate C expr: unexpected token '='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_endian.h:144:9
pub const NTOHLL = @compileError("unable to translate C expr: unexpected token '='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_endian.h:145:9
pub const HTONL = @compileError("unable to translate C expr: unexpected token '='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_endian.h:146:9
pub const HTONS = @compileError("unable to translate C expr: unexpected token '='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_endian.h:147:9
pub const HTONLL = @compileError("unable to translate C expr: unexpected token '='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_endian.h:148:9
pub const w_termsig = @compileError("unable to translate macro: undefined identifier `w_T`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/wait.h:231:9
pub const w_coredump = @compileError("unable to translate macro: undefined identifier `w_T`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/wait.h:232:9
pub const w_retcode = @compileError("unable to translate macro: undefined identifier `w_T`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/wait.h:233:9
pub const w_stopval = @compileError("unable to translate macro: undefined identifier `w_S`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/wait.h:234:9
pub const w_stopsig = @compileError("unable to translate macro: undefined identifier `w_S`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/wait.h:235:9
pub const __alloca = @compileError("unable to translate macro: undefined identifier `__builtin_alloca`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/alloca.h:40:9
pub const __sort_noescape = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdlib.h:303:9
pub const __sgetc = @compileError("TODO unary inc/dec expr"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdio.h:258:9
pub const __sclearerr = @compileError("unable to translate C expr: expected ')' instead got '&='"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/stdio.h:282:9
pub const __DARWIN_FD_ZERO = @compileError("unable to translate macro: undefined identifier `__builtin_bzero`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_types/_fd_def.h:115:9
pub const __DARWIN_FD_COPY = @compileError("unable to translate C expr: unexpected token '*'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/sys/_types/_fd_def.h:120:9
pub const __assert = @compileError("unable to translate C expr: unexpected token 'const'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/assert.h:87:9
pub const assert = @compileError("unable to translate macro: undefined identifier `__func__`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/assert.h:92:9
pub const static_assert = @compileError("unable to translate C expr: unexpected token '_Static_assert'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/assert.h:107:9
pub const s6_addr = @compileError("unable to translate macro: undefined identifier `__u6_addr`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:160:9
pub const IN6ADDR_ANY_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:186:9
pub const IN6ADDR_LOOPBACK_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:189:9
pub const IN6ADDR_NODELOCAL_ALLNODES_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:193:9
pub const IN6ADDR_INTFACELOCAL_ALLNODES_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:196:9
pub const IN6ADDR_LINKLOCAL_ALLNODES_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:199:9
pub const IN6ADDR_LINKLOCAL_ALLROUTERS_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:202:9
pub const IN6ADDR_LINKLOCAL_ALLV2ROUTERS_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:205:9
pub const IN6ADDR_V4MAPPED_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:208:9
pub const IN6ADDR_MULTICAST_PREFIX = @compileError("unable to translate macro: undefined identifier `IN6MASK8`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:211:9
pub const IN6_IS_ADDR_UNSPECIFIED = @compileError("unable to translate C expr: unexpected token 'const'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:239:9
pub const IN6_IS_ADDR_LOOPBACK = @compileError("unable to translate C expr: unexpected token 'const'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:248:9
pub const IN6_IS_ADDR_V4COMPAT = @compileError("unable to translate C expr: unexpected token 'const'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:257:9
pub const IN6_IS_ADDR_V4MAPPED = @compileError("unable to translate C expr: unexpected token 'const'"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netinet6/in6.h:267:9
pub const h_addr = @compileError("unable to translate macro: undefined identifier `h_addr_list`"); // /nix/store/brjkxprm5sw1nymsnm8q750i14rbaq2h-libSystem-11.0.0/include/netdb.h:119:9
pub const INIT_NO_SAL = @compileError("unable to translate C expr: unexpected token '='"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:16:9
pub const _IRQL_requires_max_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:31:9
pub const _Function_class_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:35:9
pub const _Out_range_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:67:9
pub const _Field_size_bytes_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:71:9
pub const _Field_size_bytes_opt_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:75:9
pub const _In_reads_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:79:9
pub const _In_reads_bytes_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:83:9
pub const _In_reads_z_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:87:9
pub const _In_reads_opt_z_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:91:9
pub const _In_reads_or_z_opt_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:95:9
pub const _Out_writes_bytes_opt_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:99:9
pub const _Out_writes_bytes_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:111:9
pub const _Field_size_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:115:9
pub const _Success_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:119:9
pub const _Field_range_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:123:9
pub const _In_reads_bytes_opt_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:127:9
pub const _Out_writes_bytes_to_opt_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:131:9
pub const _Deref_pre_opt_count_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:135:9
pub const _Deref_post_opt_count_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:139:9
pub const _Outptr_result_buffer_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:143:9
pub const _Outptr_result_buffer_maybenull_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:147:9
pub const _Inout_updates_bytes_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:151:9
pub const _Inout_updates_bytes_opt_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:155:9
pub const _Post_writable_byte_size_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:179:9
pub const __drv_allocatesMem = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:183:9
pub const __drv_freesMem = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:187:9
pub const _In_range_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:203:9
pub const _When_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:207:9
pub const _Post_equal_to_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:211:9
pub const _Deref_in_range_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:215:9
pub const _Deref_out_range_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:219:9
pub const _Out_writes_all_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:223:9
pub const _Out_writes_to_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:227:9
pub const _Out_writes_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:231:9
pub const __analysis_assume = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:239:9
pub const _Out_writes_bytes_all_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:243:9
pub const _Analysis_assume_ = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:247:9
pub const _Ret_range_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:251:9
pub const _Ret_writes_bytes_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:255:9
pub const _In_reads_opt_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:267:9
pub const _At_ = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/quic_sal_stub.h:271:9
pub const DEFINE_ENUM_FLAG_OPERATORS = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:73:9
pub const QUIC_STATUS_SUCCESS = @compileError("unable to translate C expr: expected ')' instead got 'IntegerLiteral'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:104:9
pub const RTL_FIELD_SIZE = @compileError("unable to translate C expr: unexpected token '('"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:161:9
pub const QUIC_ADDR_V4_PORT_OFFSET = @compileError("unable to translate macro: undefined identifier `sin_port`"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:166:9
pub const QUIC_ADDR_V4_IP_OFFSET = @compileError("unable to translate macro: undefined identifier `sin_addr`"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:167:9
pub const QUIC_ADDR_V6_PORT_OFFSET = @compileError("unable to translate macro: undefined identifier `sin6_port`"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:169:9
pub const QUIC_ADDR_V6_IP_OFFSET = @compileError("unable to translate macro: undefined identifier `sin6_addr`"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:170:9
pub const QUIC_NO_SANITIZE = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:199:9
pub const sprintf_s = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:209:9
pub const _vsnprintf_s = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:210:9
pub const UPDATE_HASH = @compileError("unable to translate macro: undefined identifier `Hash`"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic_posix.h:353:9
pub const MsQuicOpen2 = @compileError("unable to translate C expr: unexpected token 'const'"); // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:1467:9
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 15);
pub const __clang_minor__ = @as(c_int, 0);
pub const __clang_patchlevel__ = @as(c_int, 3);
pub const __clang_version__ = "15.0.3 (git@github.com:ziglang/zig-bootstrap.git 0ce789d0f7a4d89fdc4d9571209b6874d3e260c9)";
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
pub const __VERSION__ = "Clang 15.0.3 (git@github.com:ziglang/zig-bootstrap.git 0ce789d0f7a4d89fdc4d9571209b6874d3e260c9)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 1);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __BLOCKS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @as(c_int, 128);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
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
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_int;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
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
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
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
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
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
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
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
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
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
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
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
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
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
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
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
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
pub const __NO_MATH_ERRNO__ = @as(c_int, 1);
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
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
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
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __FP_FAST_FMA = @as(c_int, 1);
pub const __FP_FAST_FMAF = @as(c_int, 1);
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
pub const __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130000, .decimal);
pub const __MACH__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const _DEBUG = @as(c_int, 1);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const _MSQUIC_ = "";
pub const _MSQUIC_POSIX_ = "";
pub const _STDLIB_H_ = "";
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
pub const __DRIVERKIT_19_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 190000, .decimal);
pub const __DRIVERKIT_20_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 200000, .decimal);
pub const __AVAILABILITY_INTERNAL__ = "";
pub const __MAC_OS_X_VERSION_MIN_REQUIRED = __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__;
pub const __MAC_OS_X_VERSION_MAX_ALLOWED = __MAC_11_1;
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
    _ = @TypeOf(qualifier);
    return @"type"(c_long)(variable);
}
pub const __TYPES_H_ = "";
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
pub const __DARWIN_WCHAR_MAX = __WCHAR_MAX__;
pub const __DARWIN_WCHAR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hexadecimal) - @as(c_int, 1);
pub const __DARWIN_WEOF = @import("std").zig.c_translation.cast(__darwin_wint_t, -@as(c_int, 1));
pub const _FORTIFY_SOURCE = @as(c_int, 2);
pub const _SYS_WAIT_H_ = "";
pub const _PID_T = "";
pub const _ID_T = "";
pub const _SYS_SIGNAL_H_ = "";
pub const __SYS_APPLEAPIOPTS_H__ = "";
pub const __APPLE_API_STANDARD = "";
pub const __APPLE_API_STABLE = "";
pub const __APPLE_API_EVOLVING = "";
pub const __APPLE_API_UNSTABLE = "";
pub const __APPLE_API_PRIVATE = "";
pub const __APPLE_API_OBSOLETE = "";
pub const __DARWIN_NSIG = @as(c_int, 32);
pub const NSIG = __DARWIN_NSIG;
pub const _BSD_MACHINE_SIGNAL_H_ = "";
pub const _ARM_SIGNAL_ = @as(c_int, 1);
pub const SIGHUP = @as(c_int, 1);
pub const SIGINT = @as(c_int, 2);
pub const SIGQUIT = @as(c_int, 3);
pub const SIGILL = @as(c_int, 4);
pub const SIGTRAP = @as(c_int, 5);
pub const SIGABRT = @as(c_int, 6);
pub const SIGIOT = SIGABRT;
pub const SIGEMT = @as(c_int, 7);
pub const SIGFPE = @as(c_int, 8);
pub const SIGKILL = @as(c_int, 9);
pub const SIGBUS = @as(c_int, 10);
pub const SIGSEGV = @as(c_int, 11);
pub const SIGSYS = @as(c_int, 12);
pub const SIGPIPE = @as(c_int, 13);
pub const SIGALRM = @as(c_int, 14);
pub const SIGTERM = @as(c_int, 15);
pub const SIGURG = @as(c_int, 16);
pub const SIGSTOP = @as(c_int, 17);
pub const SIGTSTP = @as(c_int, 18);
pub const SIGCONT = @as(c_int, 19);
pub const SIGCHLD = @as(c_int, 20);
pub const SIGTTIN = @as(c_int, 21);
pub const SIGTTOU = @as(c_int, 22);
pub const SIGIO = @as(c_int, 23);
pub const SIGXCPU = @as(c_int, 24);
pub const SIGXFSZ = @as(c_int, 25);
pub const SIGVTALRM = @as(c_int, 26);
pub const SIGPROF = @as(c_int, 27);
pub const SIGWINCH = @as(c_int, 28);
pub const SIGINFO = @as(c_int, 29);
pub const SIGUSR1 = @as(c_int, 30);
pub const SIGUSR2 = @as(c_int, 31);
pub const __ARM_MCONTEXT_H_ = "";
pub const _MACH_MACHINE__STRUCTS_H_ = "";
pub const _MACH_ARM__STRUCTS_H_ = "";
pub const _BSD_MACHINE_TYPES_H_ = "";
pub const _MACHTYPES_H_ = "";
pub const _INT8_T = "";
pub const _INT16_T = "";
pub const _INT32_T = "";
pub const _INT64_T = "";
pub const _U_INT8_T = "";
pub const _U_INT16_T = "";
pub const _U_INT32_T = "";
pub const _U_INT64_T = "";
pub const _INTPTR_T = "";
pub const _UINTPTR_T = "";
pub const USER_ADDR_NULL = @import("std").zig.c_translation.cast(user_addr_t, @as(c_int, 0));
pub inline fn CAST_USER_ADDR_T(a_ptr: anytype) user_addr_t {
    return @import("std").zig.c_translation.cast(user_addr_t, @import("std").zig.c_translation.cast(usize, a_ptr));
}
pub const _STRUCT_ARM_EXCEPTION_STATE = struct___darwin_arm_exception_state;
pub const _STRUCT_ARM_EXCEPTION_STATE64 = struct___darwin_arm_exception_state64;
pub const _STRUCT_ARM_THREAD_STATE = struct___darwin_arm_thread_state;
pub const __DARWIN_OPAQUE_ARM_THREAD_STATE64 = @as(c_int, 0);
pub const _STRUCT_ARM_THREAD_STATE64 = struct___darwin_arm_thread_state64;
pub inline fn __darwin_arm_thread_state64_get_pc(ts: anytype) @TypeOf(ts.__pc) {
    return ts.__pc;
}
pub inline fn __darwin_arm_thread_state64_get_pc_fptr(ts: anytype) ?*anyopaque {
    return @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast(usize, ts.__pc));
}
pub inline fn __darwin_arm_thread_state64_get_lr(ts: anytype) @TypeOf(ts.__lr) {
    return ts.__lr;
}
pub inline fn __darwin_arm_thread_state64_get_lr_fptr(ts: anytype) ?*anyopaque {
    return @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast(usize, ts.__lr));
}
pub inline fn __darwin_arm_thread_state64_get_sp(ts: anytype) @TypeOf(ts.__sp) {
    return ts.__sp;
}
pub inline fn __darwin_arm_thread_state64_get_fp(ts: anytype) @TypeOf(ts.__fp) {
    return ts.__fp;
}
pub const __darwin_arm_thread_state64_ptrauth_strip = @import("std").zig.c_translation.Macros.DISCARD;
pub const _STRUCT_ARM_VFP_STATE = struct___darwin_arm_vfp_state;
pub const _STRUCT_ARM_NEON_STATE64 = struct___darwin_arm_neon_state64;
pub const _STRUCT_ARM_NEON_STATE = struct___darwin_arm_neon_state;
pub const _STRUCT_ARM_AMX_STATE_V1 = struct___darwin_arm_amx_state_v1;
pub const _STRUCT_ARM_PAGEIN_STATE = struct___arm_pagein_state;
pub const _STRUCT_ARM_LEGACY_DEBUG_STATE = struct___arm_legacy_debug_state;
pub const _STRUCT_ARM_DEBUG_STATE32 = struct___darwin_arm_debug_state32;
pub const _STRUCT_ARM_DEBUG_STATE64 = struct___darwin_arm_debug_state64;
pub const _STRUCT_ARM_CPMU_STATE64 = struct___darwin_arm_cpmu_state64;
pub const _STRUCT_MCONTEXT32 = struct___darwin_mcontext32;
pub const _STRUCT_MCONTEXT64 = struct___darwin_mcontext64;
pub const _MCONTEXT_T = "";
pub const _STRUCT_MCONTEXT = _STRUCT_MCONTEXT64;
pub const _PTHREAD_ATTR_T = "";
pub const _STRUCT_SIGALTSTACK = struct___darwin_sigaltstack;
pub const _STRUCT_UCONTEXT = struct___darwin_ucontext;
pub const _SIGSET_T = "";
pub const _SIZE_T = "";
pub const _UID_T = "";
pub const SIGEV_NONE = @as(c_int, 0);
pub const SIGEV_SIGNAL = @as(c_int, 1);
pub const SIGEV_THREAD = @as(c_int, 3);
pub const ILL_NOOP = @as(c_int, 0);
pub const ILL_ILLOPC = @as(c_int, 1);
pub const ILL_ILLTRP = @as(c_int, 2);
pub const ILL_PRVOPC = @as(c_int, 3);
pub const ILL_ILLOPN = @as(c_int, 4);
pub const ILL_ILLADR = @as(c_int, 5);
pub const ILL_PRVREG = @as(c_int, 6);
pub const ILL_COPROC = @as(c_int, 7);
pub const ILL_BADSTK = @as(c_int, 8);
pub const FPE_NOOP = @as(c_int, 0);
pub const FPE_FLTDIV = @as(c_int, 1);
pub const FPE_FLTOVF = @as(c_int, 2);
pub const FPE_FLTUND = @as(c_int, 3);
pub const FPE_FLTRES = @as(c_int, 4);
pub const FPE_FLTINV = @as(c_int, 5);
pub const FPE_FLTSUB = @as(c_int, 6);
pub const FPE_INTDIV = @as(c_int, 7);
pub const FPE_INTOVF = @as(c_int, 8);
pub const SEGV_NOOP = @as(c_int, 0);
pub const SEGV_MAPERR = @as(c_int, 1);
pub const SEGV_ACCERR = @as(c_int, 2);
pub const BUS_NOOP = @as(c_int, 0);
pub const BUS_ADRALN = @as(c_int, 1);
pub const BUS_ADRERR = @as(c_int, 2);
pub const BUS_OBJERR = @as(c_int, 3);
pub const TRAP_BRKPT = @as(c_int, 1);
pub const TRAP_TRACE = @as(c_int, 2);
pub const CLD_NOOP = @as(c_int, 0);
pub const CLD_EXITED = @as(c_int, 1);
pub const CLD_KILLED = @as(c_int, 2);
pub const CLD_DUMPED = @as(c_int, 3);
pub const CLD_TRAPPED = @as(c_int, 4);
pub const CLD_STOPPED = @as(c_int, 5);
pub const CLD_CONTINUED = @as(c_int, 6);
pub const POLL_IN = @as(c_int, 1);
pub const POLL_OUT = @as(c_int, 2);
pub const POLL_MSG = @as(c_int, 3);
pub const POLL_ERR = @as(c_int, 4);
pub const POLL_PRI = @as(c_int, 5);
pub const POLL_HUP = @as(c_int, 6);
pub const sa_handler = __sigaction_u.__sa_handler;
pub const sa_sigaction = __sigaction_u.__sa_sigaction;
pub const SA_ONSTACK = @as(c_int, 0x0001);
pub const SA_RESTART = @as(c_int, 0x0002);
pub const SA_RESETHAND = @as(c_int, 0x0004);
pub const SA_NOCLDSTOP = @as(c_int, 0x0008);
pub const SA_NODEFER = @as(c_int, 0x0010);
pub const SA_NOCLDWAIT = @as(c_int, 0x0020);
pub const SA_SIGINFO = @as(c_int, 0x0040);
pub const SA_USERTRAMP = @as(c_int, 0x0100);
pub const SA_64REGSET = @as(c_int, 0x0200);
pub const SA_USERSPACE_MASK = (((((SA_ONSTACK | SA_RESTART) | SA_RESETHAND) | SA_NOCLDSTOP) | SA_NODEFER) | SA_NOCLDWAIT) | SA_SIGINFO;
pub const SIG_BLOCK = @as(c_int, 1);
pub const SIG_UNBLOCK = @as(c_int, 2);
pub const SIG_SETMASK = @as(c_int, 3);
pub const SI_USER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10001, .hexadecimal);
pub const SI_QUEUE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10002, .hexadecimal);
pub const SI_TIMER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10003, .hexadecimal);
pub const SI_ASYNCIO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004, .hexadecimal);
pub const SI_MESGQ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10005, .hexadecimal);
pub const SS_ONSTACK = @as(c_int, 0x0001);
pub const SS_DISABLE = @as(c_int, 0x0004);
pub const MINSIGSTKSZ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const SIGSTKSZ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 131072, .decimal);
pub const SV_ONSTACK = SA_ONSTACK;
pub const SV_INTERRUPT = SA_RESTART;
pub const SV_RESETHAND = SA_RESETHAND;
pub const SV_NODEFER = SA_NODEFER;
pub const SV_NOCLDSTOP = SA_NOCLDSTOP;
pub const SV_SIGINFO = SA_SIGINFO;
pub inline fn sigmask(m: anytype) @TypeOf(@as(c_int, 1) << (m - @as(c_int, 1))) {
    return @as(c_int, 1) << (m - @as(c_int, 1));
}
pub const BADSIG = SIG_ERR;
pub const _SYS_RESOURCE_H_ = "";
pub const _STDINT_H_ = "";
pub const __WORDSIZE = @as(c_int, 64);
pub const _UINT8_T = "";
pub const _UINT16_T = "";
pub const _UINT32_T = "";
pub const _UINT64_T = "";
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
pub const _STRUCT_TIMEVAL = struct_timeval;
pub const PRIO_PROCESS = @as(c_int, 0);
pub const PRIO_PGRP = @as(c_int, 1);
pub const PRIO_USER = @as(c_int, 2);
pub const PRIO_DARWIN_THREAD = @as(c_int, 3);
pub const PRIO_DARWIN_PROCESS = @as(c_int, 4);
pub const PRIO_MIN = -@as(c_int, 20);
pub const PRIO_MAX = @as(c_int, 20);
pub const PRIO_DARWIN_BG = @as(c_int, 0x1000);
pub const PRIO_DARWIN_NONUI = @as(c_int, 0x1001);
pub const RUSAGE_SELF = @as(c_int, 0);
pub const RUSAGE_CHILDREN = -@as(c_int, 1);
pub const RUSAGE_INFO_V0 = @as(c_int, 0);
pub const RUSAGE_INFO_V1 = @as(c_int, 1);
pub const RUSAGE_INFO_V2 = @as(c_int, 2);
pub const RUSAGE_INFO_V3 = @as(c_int, 3);
pub const RUSAGE_INFO_V4 = @as(c_int, 4);
pub const RUSAGE_INFO_V5 = @as(c_int, 5);
pub const RUSAGE_INFO_CURRENT = RUSAGE_INFO_V5;
pub const RU_PROC_RUNS_RESLIDE = @as(c_int, 0x00000001);
pub const RLIM_INFINITY = (@import("std").zig.c_translation.cast(__uint64_t, @as(c_int, 1)) << @as(c_int, 63)) - @as(c_int, 1);
pub const RLIM_SAVED_MAX = RLIM_INFINITY;
pub const RLIM_SAVED_CUR = RLIM_INFINITY;
pub const RLIMIT_CPU = @as(c_int, 0);
pub const RLIMIT_FSIZE = @as(c_int, 1);
pub const RLIMIT_DATA = @as(c_int, 2);
pub const RLIMIT_STACK = @as(c_int, 3);
pub const RLIMIT_CORE = @as(c_int, 4);
pub const RLIMIT_AS = @as(c_int, 5);
pub const RLIMIT_RSS = RLIMIT_AS;
pub const RLIMIT_MEMLOCK = @as(c_int, 6);
pub const RLIMIT_NPROC = @as(c_int, 7);
pub const RLIMIT_NOFILE = @as(c_int, 8);
pub const RLIM_NLIMITS = @as(c_int, 9);
pub const _RLIMIT_POSIX_FLAG = @as(c_int, 0x1000);
pub const RLIMIT_WAKEUPS_MONITOR = @as(c_int, 0x1);
pub const RLIMIT_CPU_USAGE_MONITOR = @as(c_int, 0x2);
pub const RLIMIT_THREAD_CPULIMITS = @as(c_int, 0x3);
pub const RLIMIT_FOOTPRINT_INTERVAL = @as(c_int, 0x4);
pub const WAKEMON_ENABLE = @as(c_int, 0x01);
pub const WAKEMON_DISABLE = @as(c_int, 0x02);
pub const WAKEMON_GET_PARAMS = @as(c_int, 0x04);
pub const WAKEMON_SET_DEFAULTS = @as(c_int, 0x08);
pub const WAKEMON_MAKE_FATAL = @as(c_int, 0x10);
pub const CPUMON_MAKE_FATAL = @as(c_int, 0x1000);
pub const FOOTPRINT_INTERVAL_RESET = @as(c_int, 0x1);
pub const IOPOL_TYPE_DISK = @as(c_int, 0);
pub const IOPOL_TYPE_VFS_ATIME_UPDATES = @as(c_int, 2);
pub const IOPOL_TYPE_VFS_MATERIALIZE_DATALESS_FILES = @as(c_int, 3);
pub const IOPOL_TYPE_VFS_STATFS_NO_DATA_VOLUME = @as(c_int, 4);
pub const IOPOL_TYPE_VFS_TRIGGER_RESOLVE = @as(c_int, 5);
pub const IOPOL_TYPE_VFS_IGNORE_CONTENT_PROTECTION = @as(c_int, 6);
pub const IOPOL_SCOPE_PROCESS = @as(c_int, 0);
pub const IOPOL_SCOPE_THREAD = @as(c_int, 1);
pub const IOPOL_SCOPE_DARWIN_BG = @as(c_int, 2);
pub const IOPOL_DEFAULT = @as(c_int, 0);
pub const IOPOL_IMPORTANT = @as(c_int, 1);
pub const IOPOL_PASSIVE = @as(c_int, 2);
pub const IOPOL_THROTTLE = @as(c_int, 3);
pub const IOPOL_UTILITY = @as(c_int, 4);
pub const IOPOL_STANDARD = @as(c_int, 5);
pub const IOPOL_APPLICATION = IOPOL_STANDARD;
pub const IOPOL_NORMAL = IOPOL_IMPORTANT;
pub const IOPOL_ATIME_UPDATES_DEFAULT = @as(c_int, 0);
pub const IOPOL_ATIME_UPDATES_OFF = @as(c_int, 1);
pub const IOPOL_MATERIALIZE_DATALESS_FILES_DEFAULT = @as(c_int, 0);
pub const IOPOL_MATERIALIZE_DATALESS_FILES_OFF = @as(c_int, 1);
pub const IOPOL_MATERIALIZE_DATALESS_FILES_ON = @as(c_int, 2);
pub const IOPOL_VFS_STATFS_NO_DATA_VOLUME_DEFAULT = @as(c_int, 0);
pub const IOPOL_VFS_STATFS_FORCE_NO_DATA_VOLUME = @as(c_int, 1);
pub const IOPOL_VFS_TRIGGER_RESOLVE_DEFAULT = @as(c_int, 0);
pub const IOPOL_VFS_TRIGGER_RESOLVE_OFF = @as(c_int, 1);
pub const IOPOL_VFS_CONTENT_PROTECTION_DEFAULT = @as(c_int, 0);
pub const IOPOL_VFS_CONTENT_PROTECTION_IGNORE = @as(c_int, 1);
pub const WNOHANG = @as(c_int, 0x00000001);
pub const WUNTRACED = @as(c_int, 0x00000002);
pub inline fn _W_INT(w: anytype) @TypeOf(@import("std").zig.c_translation.cast([*c]c_int, &w).*) {
    return @import("std").zig.c_translation.cast([*c]c_int, &w).*;
}
pub const WCOREFLAG = @as(c_int, 0o200);
pub inline fn _WSTATUS(x: anytype) @TypeOf(_W_INT(x) & @as(c_int, 0o177)) {
    return _W_INT(x) & @as(c_int, 0o177);
}
pub const _WSTOPPED = @as(c_int, 0o177);
pub inline fn WEXITSTATUS(x: anytype) @TypeOf((_W_INT(x) >> @as(c_int, 8)) & @as(c_int, 0x000000ff)) {
    return (_W_INT(x) >> @as(c_int, 8)) & @as(c_int, 0x000000ff);
}
pub inline fn WSTOPSIG(x: anytype) @TypeOf(_W_INT(x) >> @as(c_int, 8)) {
    return _W_INT(x) >> @as(c_int, 8);
}
pub inline fn WIFCONTINUED(x: anytype) @TypeOf((_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) == @as(c_int, 0x13))) {
    return (_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) == @as(c_int, 0x13));
}
pub inline fn WIFSTOPPED(x: anytype) @TypeOf((_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) != @as(c_int, 0x13))) {
    return (_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) != @as(c_int, 0x13));
}
pub inline fn WIFEXITED(x: anytype) @TypeOf(_WSTATUS(x) == @as(c_int, 0)) {
    return _WSTATUS(x) == @as(c_int, 0);
}
pub inline fn WIFSIGNALED(x: anytype) @TypeOf((_WSTATUS(x) != _WSTOPPED) and (_WSTATUS(x) != @as(c_int, 0))) {
    return (_WSTATUS(x) != _WSTOPPED) and (_WSTATUS(x) != @as(c_int, 0));
}
pub inline fn WTERMSIG(x: anytype) @TypeOf(_WSTATUS(x)) {
    return _WSTATUS(x);
}
pub inline fn WCOREDUMP(x: anytype) @TypeOf(_W_INT(x) & WCOREFLAG) {
    return _W_INT(x) & WCOREFLAG;
}
pub inline fn W_EXITCODE(ret: anytype, sig: anytype) @TypeOf((ret << @as(c_int, 8)) | sig) {
    return (ret << @as(c_int, 8)) | sig;
}
pub inline fn W_STOPCODE(sig: anytype) @TypeOf((sig << @as(c_int, 8)) | _WSTOPPED) {
    return (sig << @as(c_int, 8)) | _WSTOPPED;
}
pub const WEXITED = @as(c_int, 0x00000004);
pub const WSTOPPED = @as(c_int, 0x00000008);
pub const WCONTINUED = @as(c_int, 0x00000010);
pub const WNOWAIT = @as(c_int, 0x00000020);
pub const WAIT_ANY = -@as(c_int, 1);
pub const WAIT_MYPGRP = @as(c_int, 0);
pub const _BSD_MACHINE_ENDIAN_H_ = "";
pub const _ARM__ENDIAN_H_ = "";
pub const _QUAD_HIGHWORD = @as(c_int, 1);
pub const _QUAD_LOWWORD = @as(c_int, 0);
pub const __DARWIN_LITTLE_ENDIAN = @as(c_int, 1234);
pub const __DARWIN_BIG_ENDIAN = @as(c_int, 4321);
pub const __DARWIN_PDP_ENDIAN = @as(c_int, 3412);
pub const __DARWIN_BYTE_ORDER = __DARWIN_LITTLE_ENDIAN;
pub const LITTLE_ENDIAN = __DARWIN_LITTLE_ENDIAN;
pub const BIG_ENDIAN = __DARWIN_BIG_ENDIAN;
pub const PDP_ENDIAN = __DARWIN_PDP_ENDIAN;
pub const BYTE_ORDER = __DARWIN_BYTE_ORDER;
pub const _SYS__ENDIAN_H_ = "";
pub const _OS__OSBYTEORDER_H = "";
pub inline fn __DARWIN_OSSwapConstInt16(x: anytype) __uint16_t {
    return @import("std").zig.c_translation.cast(__uint16_t, ((@import("std").zig.c_translation.cast(__uint16_t, x) & @as(c_uint, 0xff00)) >> @as(c_int, 8)) | ((@import("std").zig.c_translation.cast(__uint16_t, x) & @as(c_uint, 0x00ff)) << @as(c_int, 8)));
}
pub inline fn __DARWIN_OSSwapConstInt32(x: anytype) __uint32_t {
    return @import("std").zig.c_translation.cast(__uint32_t, ((((@import("std").zig.c_translation.cast(__uint32_t, x) & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hexadecimal)) >> @as(c_int, 24)) | ((@import("std").zig.c_translation.cast(__uint32_t, x) & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hexadecimal)) >> @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint32_t, x) & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint32_t, x) & @as(c_uint, 0x000000ff)) << @as(c_int, 24)));
}
pub inline fn __DARWIN_OSSwapConstInt64(x: anytype) __uint64_t {
    return @import("std").zig.c_translation.cast(__uint64_t, ((((((((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56)));
}
pub const _OS_OSBYTEORDERARM_H = "";
pub const _ARM_ARCH_H = "";
pub inline fn __DARWIN_OSSwapInt16(x: anytype) __uint16_t {
    return @import("std").zig.c_translation.cast(__uint16_t, if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt16(x) else _OSSwapInt16(x));
}
pub inline fn __DARWIN_OSSwapInt32(x: anytype) @TypeOf(if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt32(x) else _OSSwapInt32(x)) {
    return if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt32(x) else _OSSwapInt32(x);
}
pub inline fn __DARWIN_OSSwapInt64(x: anytype) @TypeOf(if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt64(x) else _OSSwapInt64(x)) {
    return if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt64(x) else _OSSwapInt64(x);
}
pub inline fn ntohs(x: anytype) @TypeOf(__DARWIN_OSSwapInt16(x)) {
    return __DARWIN_OSSwapInt16(x);
}
pub inline fn htons(x: anytype) @TypeOf(__DARWIN_OSSwapInt16(x)) {
    return __DARWIN_OSSwapInt16(x);
}
pub inline fn ntohl(x: anytype) @TypeOf(__DARWIN_OSSwapInt32(x)) {
    return __DARWIN_OSSwapInt32(x);
}
pub inline fn htonl(x: anytype) @TypeOf(__DARWIN_OSSwapInt32(x)) {
    return __DARWIN_OSSwapInt32(x);
}
pub inline fn ntohll(x: anytype) @TypeOf(__DARWIN_OSSwapInt64(x)) {
    return __DARWIN_OSSwapInt64(x);
}
pub inline fn htonll(x: anytype) @TypeOf(__DARWIN_OSSwapInt64(x)) {
    return __DARWIN_OSSwapInt64(x);
}
pub const _ALLOCA_H_ = "";
pub const _CT_RUNE_T = "";
pub const _RUNE_T = "";
pub const _WCHAR_T = "";
pub const NULL = __DARWIN_NULL;
pub const EXIT_FAILURE = @as(c_int, 1);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const RAND_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hexadecimal);
pub const MB_CUR_MAX = __mb_cur_max;
pub const _MALLOC_UNDERSCORE_MALLOC_H_ = "";
pub inline fn __swift_unavailable_on(osx_msg: anytype, ios_msg: anytype) @TypeOf(__swift_unavailable(osx_msg)) {
    _ = @TypeOf(ios_msg);
    return __swift_unavailable(osx_msg);
}
pub const _DEV_T = "";
pub const _MODE_T = "";
pub const _STDIO_H_ = "";
pub const __STDIO_H_ = "";
pub const _VA_LIST_T = "";
pub const _SYS_STDIO_H_ = "";
pub const RENAME_SECLUDE = @as(c_int, 0x00000001);
pub const RENAME_SWAP = @as(c_int, 0x00000002);
pub const RENAME_EXCL = @as(c_int, 0x00000004);
pub const _FSTDIO = "";
pub const __SLBF = @as(c_int, 0x0001);
pub const __SNBF = @as(c_int, 0x0002);
pub const __SRD = @as(c_int, 0x0004);
pub const __SWR = @as(c_int, 0x0008);
pub const __SRW = @as(c_int, 0x0010);
pub const __SEOF = @as(c_int, 0x0020);
pub const __SERR = @as(c_int, 0x0040);
pub const __SMBF = @as(c_int, 0x0080);
pub const __SAPP = @as(c_int, 0x0100);
pub const __SSTR = @as(c_int, 0x0200);
pub const __SOPT = @as(c_int, 0x0400);
pub const __SNPT = @as(c_int, 0x0800);
pub const __SOFF = @as(c_int, 0x1000);
pub const __SMOD = @as(c_int, 0x2000);
pub const __SALC = @as(c_int, 0x4000);
pub const __SIGN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hexadecimal);
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 1024);
pub const EOF = -@as(c_int, 1);
pub const FOPEN_MAX = @as(c_int, 20);
pub const FILENAME_MAX = @as(c_int, 1024);
pub const P_tmpdir = "/var/tmp/";
pub const L_tmpnam = @as(c_int, 1024);
pub const TMP_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 308915776, .decimal);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const stdin = __stdinp;
pub const stdout = __stdoutp;
pub const stderr = __stderrp;
pub const L_ctermid = @as(c_int, 1024);
pub const _CTERMID_H_ = "";
pub inline fn __sfeof(p: anytype) @TypeOf((p.*._flags & __SEOF) != @as(c_int, 0)) {
    return (p.*._flags & __SEOF) != @as(c_int, 0);
}
pub inline fn __sferror(p: anytype) @TypeOf((p.*._flags & __SERR) != @as(c_int, 0)) {
    return (p.*._flags & __SERR) != @as(c_int, 0);
}
pub inline fn __sfileno(p: anytype) @TypeOf(p.*._file) {
    return p.*._file;
}
pub const _OFF_T = "";
pub const _SSIZE_T = "";
pub inline fn fropen(cookie: anytype, @"fn": anytype) @TypeOf(funopen(cookie, @"fn", @as(c_int, 0), @as(c_int, 0), @as(c_int, 0))) {
    return funopen(cookie, @"fn", @as(c_int, 0), @as(c_int, 0), @as(c_int, 0));
}
pub inline fn fwopen(cookie: anytype, @"fn": anytype) @TypeOf(funopen(cookie, @as(c_int, 0), @"fn", @as(c_int, 0), @as(c_int, 0))) {
    return funopen(cookie, @as(c_int, 0), @"fn", @as(c_int, 0), @as(c_int, 0));
}
pub inline fn feof_unlocked(p: anytype) @TypeOf(__sfeof(p)) {
    return __sfeof(p);
}
pub inline fn ferror_unlocked(p: anytype) @TypeOf(__sferror(p)) {
    return __sferror(p);
}
pub inline fn clearerr_unlocked(p: anytype) @TypeOf(__sclearerr(p)) {
    return __sclearerr(p);
}
pub inline fn fileno_unlocked(p: anytype) @TypeOf(__sfileno(p)) {
    return __sfileno(p);
}
pub const _SECURE__STDIO_H_ = "";
pub const _SECURE__COMMON_H_ = "";
pub const _USE_FORTIFY_LEVEL = @as(c_int, 2);
pub inline fn __darwin_obsz0(object: anytype) @TypeOf(__builtin_object_size(object, @as(c_int, 0))) {
    return __builtin_object_size(object, @as(c_int, 0));
}
pub inline fn __darwin_obsz(object: anytype) @TypeOf(__builtin_object_size(object, if (_USE_FORTIFY_LEVEL > @as(c_int, 1)) @as(c_int, 1) else @as(c_int, 0))) {
    return __builtin_object_size(object, if (_USE_FORTIFY_LEVEL > @as(c_int, 1)) @as(c_int, 1) else @as(c_int, 0));
}
pub const _SYS_TYPES_H_ = "";
pub const _U_CHAR = "";
pub const _U_SHORT = "";
pub const _U_INT = "";
pub const _U_LONG = "";
pub const _CADDR_T = "";
pub const _BLKCNT_T = "";
pub const _BLKSIZE_T = "";
pub const _GID_T = "";
pub const _IN_ADDR_T = "";
pub const _IN_PORT_T = "";
pub const _INO_T = "";
pub const _INO64_T = "";
pub const _KEY_T = "";
pub const _NLINK_T = "";
pub inline fn major(x: anytype) i32 {
    return @import("std").zig.c_translation.cast(i32, (@import("std").zig.c_translation.cast(u_int32_t, x) >> @as(c_int, 24)) & @as(c_int, 0xff));
}
pub inline fn minor(x: anytype) i32 {
    return @import("std").zig.c_translation.cast(i32, x & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff, .hexadecimal));
}
pub inline fn makedev(x: anytype, y: anytype) dev_t {
    return @import("std").zig.c_translation.cast(dev_t, (x << @as(c_int, 24)) | y);
}
pub const _CLOCK_T = "";
pub const _TIME_T = "";
pub const _USECONDS_T = "";
pub const _SUSECONDS_T = "";
pub const _RSIZE_T = "";
pub const _ERRNO_T = "";
pub const _FD_SET = "";
pub const __DARWIN_FD_SETSIZE = @as(c_int, 1024);
pub const __DARWIN_NBBY = @as(c_int, 8);
pub const __DARWIN_NFDBITS = @import("std").zig.c_translation.sizeof(__int32_t) * __DARWIN_NBBY;
pub inline fn __DARWIN_howmany(x: anytype, y: anytype) @TypeOf(if ((x % y) == @as(c_int, 0)) @import("std").zig.c_translation.MacroArithmetic.div(x, y) else @import("std").zig.c_translation.MacroArithmetic.div(x, y) + @as(c_int, 1)) {
    return if ((x % y) == @as(c_int, 0)) @import("std").zig.c_translation.MacroArithmetic.div(x, y) else @import("std").zig.c_translation.MacroArithmetic.div(x, y) + @as(c_int, 1);
}
pub inline fn __DARWIN_FD_SET(n: anytype, p: anytype) @TypeOf(__darwin_fd_set(n, p)) {
    return __darwin_fd_set(n, p);
}
pub inline fn __DARWIN_FD_CLR(n: anytype, p: anytype) @TypeOf(__darwin_fd_clr(n, p)) {
    return __darwin_fd_clr(n, p);
}
pub inline fn __DARWIN_FD_ISSET(n: anytype, p: anytype) @TypeOf(__darwin_fd_isset(n, p)) {
    return __darwin_fd_isset(n, p);
}
pub const NBBY = __DARWIN_NBBY;
pub const NFDBITS = __DARWIN_NFDBITS;
pub inline fn howmany(x: anytype, y: anytype) @TypeOf(__DARWIN_howmany(x, y)) {
    return __DARWIN_howmany(x, y);
}
pub const FD_SETSIZE = __DARWIN_FD_SETSIZE;
pub inline fn FD_SET(n: anytype, p: anytype) @TypeOf(__DARWIN_FD_SET(n, p)) {
    return __DARWIN_FD_SET(n, p);
}
pub inline fn FD_CLR(n: anytype, p: anytype) @TypeOf(__DARWIN_FD_CLR(n, p)) {
    return __DARWIN_FD_CLR(n, p);
}
pub inline fn FD_ZERO(p: anytype) @TypeOf(__DARWIN_FD_ZERO(p)) {
    return __DARWIN_FD_ZERO(p);
}
pub inline fn FD_ISSET(n: anytype, p: anytype) @TypeOf(__DARWIN_FD_ISSET(n, p)) {
    return __DARWIN_FD_ISSET(n, p);
}
pub inline fn FD_COPY(f: anytype, t: anytype) @TypeOf(__DARWIN_FD_COPY(f, t)) {
    return __DARWIN_FD_COPY(f, t);
}
pub const _PTHREAD_COND_T = "";
pub const _PTHREAD_CONDATTR_T = "";
pub const _PTHREAD_MUTEX_T = "";
pub const _PTHREAD_MUTEXATTR_T = "";
pub const _PTHREAD_ONCE_T = "";
pub const _PTHREAD_RWLOCK_T = "";
pub const _PTHREAD_RWLOCKATTR_T = "";
pub const _PTHREAD_T = "";
pub const _PTHREAD_KEY_T = "";
pub const _FSBLKCNT_T = "";
pub const _FSFILCNT_T = "";
pub const _STRING_H_ = "";
pub const _STRINGS_H_ = "";
pub const _SECURE__STRINGS_H_ = "";
pub const _SECURE__STRING_H_ = "";
pub const __HAS_FIXED_CHK_PROTOTYPES = @as(c_int, 1);
pub const _ASSERT_H_ = "";
pub const _INTTYPES_H_ = "";
pub const __PRI_8_LENGTH_MODIFIER__ = "hh";
pub const __PRI_64_LENGTH_MODIFIER__ = "ll";
pub const __SCN_64_LENGTH_MODIFIER__ = "ll";
pub const __PRI_MAX_LENGTH_MODIFIER__ = "j";
pub const __SCN_MAX_LENGTH_MODIFIER__ = "j";
pub const PRId8 = __PRI_8_LENGTH_MODIFIER__ ++ "d";
pub const PRIi8 = __PRI_8_LENGTH_MODIFIER__ ++ "i";
pub const PRIo8 = __PRI_8_LENGTH_MODIFIER__ ++ "o";
pub const PRIu8 = __PRI_8_LENGTH_MODIFIER__ ++ "u";
pub const PRIx8 = __PRI_8_LENGTH_MODIFIER__ ++ "x";
pub const PRIX8 = __PRI_8_LENGTH_MODIFIER__ ++ "X";
pub const PRId16 = "hd";
pub const PRIi16 = "hi";
pub const PRIo16 = "ho";
pub const PRIu16 = "hu";
pub const PRIx16 = "hx";
pub const PRIX16 = "hX";
pub const PRId32 = "d";
pub const PRIi32 = "i";
pub const PRIo32 = "o";
pub const PRIu32 = "u";
pub const PRIx32 = "x";
pub const PRIX32 = "X";
pub const PRId64 = __PRI_64_LENGTH_MODIFIER__ ++ "d";
pub const PRIi64 = __PRI_64_LENGTH_MODIFIER__ ++ "i";
pub const PRIo64 = __PRI_64_LENGTH_MODIFIER__ ++ "o";
pub const PRIu64 = __PRI_64_LENGTH_MODIFIER__ ++ "u";
pub const PRIx64 = __PRI_64_LENGTH_MODIFIER__ ++ "x";
pub const PRIX64 = __PRI_64_LENGTH_MODIFIER__ ++ "X";
pub const PRIdLEAST8 = PRId8;
pub const PRIiLEAST8 = PRIi8;
pub const PRIoLEAST8 = PRIo8;
pub const PRIuLEAST8 = PRIu8;
pub const PRIxLEAST8 = PRIx8;
pub const PRIXLEAST8 = PRIX8;
pub const PRIdLEAST16 = PRId16;
pub const PRIiLEAST16 = PRIi16;
pub const PRIoLEAST16 = PRIo16;
pub const PRIuLEAST16 = PRIu16;
pub const PRIxLEAST16 = PRIx16;
pub const PRIXLEAST16 = PRIX16;
pub const PRIdLEAST32 = PRId32;
pub const PRIiLEAST32 = PRIi32;
pub const PRIoLEAST32 = PRIo32;
pub const PRIuLEAST32 = PRIu32;
pub const PRIxLEAST32 = PRIx32;
pub const PRIXLEAST32 = PRIX32;
pub const PRIdLEAST64 = PRId64;
pub const PRIiLEAST64 = PRIi64;
pub const PRIoLEAST64 = PRIo64;
pub const PRIuLEAST64 = PRIu64;
pub const PRIxLEAST64 = PRIx64;
pub const PRIXLEAST64 = PRIX64;
pub const PRIdFAST8 = PRId8;
pub const PRIiFAST8 = PRIi8;
pub const PRIoFAST8 = PRIo8;
pub const PRIuFAST8 = PRIu8;
pub const PRIxFAST8 = PRIx8;
pub const PRIXFAST8 = PRIX8;
pub const PRIdFAST16 = PRId16;
pub const PRIiFAST16 = PRIi16;
pub const PRIoFAST16 = PRIo16;
pub const PRIuFAST16 = PRIu16;
pub const PRIxFAST16 = PRIx16;
pub const PRIXFAST16 = PRIX16;
pub const PRIdFAST32 = PRId32;
pub const PRIiFAST32 = PRIi32;
pub const PRIoFAST32 = PRIo32;
pub const PRIuFAST32 = PRIu32;
pub const PRIxFAST32 = PRIx32;
pub const PRIXFAST32 = PRIX32;
pub const PRIdFAST64 = PRId64;
pub const PRIiFAST64 = PRIi64;
pub const PRIoFAST64 = PRIo64;
pub const PRIuFAST64 = PRIu64;
pub const PRIxFAST64 = PRIx64;
pub const PRIXFAST64 = PRIX64;
pub const PRIdPTR = "ld";
pub const PRIiPTR = "li";
pub const PRIoPTR = "lo";
pub const PRIuPTR = "lu";
pub const PRIxPTR = "lx";
pub const PRIXPTR = "lX";
pub const PRIdMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "d";
pub const PRIiMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "i";
pub const PRIoMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "o";
pub const PRIuMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "u";
pub const PRIxMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "x";
pub const PRIXMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "X";
pub const SCNd8 = __PRI_8_LENGTH_MODIFIER__ ++ "d";
pub const SCNi8 = __PRI_8_LENGTH_MODIFIER__ ++ "i";
pub const SCNo8 = __PRI_8_LENGTH_MODIFIER__ ++ "o";
pub const SCNu8 = __PRI_8_LENGTH_MODIFIER__ ++ "u";
pub const SCNx8 = __PRI_8_LENGTH_MODIFIER__ ++ "x";
pub const SCNd16 = "hd";
pub const SCNi16 = "hi";
pub const SCNo16 = "ho";
pub const SCNu16 = "hu";
pub const SCNx16 = "hx";
pub const SCNd32 = "d";
pub const SCNi32 = "i";
pub const SCNo32 = "o";
pub const SCNu32 = "u";
pub const SCNx32 = "x";
pub const SCNd64 = __SCN_64_LENGTH_MODIFIER__ ++ "d";
pub const SCNi64 = __SCN_64_LENGTH_MODIFIER__ ++ "i";
pub const SCNo64 = __SCN_64_LENGTH_MODIFIER__ ++ "o";
pub const SCNu64 = __SCN_64_LENGTH_MODIFIER__ ++ "u";
pub const SCNx64 = __SCN_64_LENGTH_MODIFIER__ ++ "x";
pub const SCNdLEAST8 = SCNd8;
pub const SCNiLEAST8 = SCNi8;
pub const SCNoLEAST8 = SCNo8;
pub const SCNuLEAST8 = SCNu8;
pub const SCNxLEAST8 = SCNx8;
pub const SCNdLEAST16 = SCNd16;
pub const SCNiLEAST16 = SCNi16;
pub const SCNoLEAST16 = SCNo16;
pub const SCNuLEAST16 = SCNu16;
pub const SCNxLEAST16 = SCNx16;
pub const SCNdLEAST32 = SCNd32;
pub const SCNiLEAST32 = SCNi32;
pub const SCNoLEAST32 = SCNo32;
pub const SCNuLEAST32 = SCNu32;
pub const SCNxLEAST32 = SCNx32;
pub const SCNdLEAST64 = SCNd64;
pub const SCNiLEAST64 = SCNi64;
pub const SCNoLEAST64 = SCNo64;
pub const SCNuLEAST64 = SCNu64;
pub const SCNxLEAST64 = SCNx64;
pub const SCNdFAST8 = SCNd8;
pub const SCNiFAST8 = SCNi8;
pub const SCNoFAST8 = SCNo8;
pub const SCNuFAST8 = SCNu8;
pub const SCNxFAST8 = SCNx8;
pub const SCNdFAST16 = SCNd16;
pub const SCNiFAST16 = SCNi16;
pub const SCNoFAST16 = SCNo16;
pub const SCNuFAST16 = SCNu16;
pub const SCNxFAST16 = SCNx16;
pub const SCNdFAST32 = SCNd32;
pub const SCNiFAST32 = SCNi32;
pub const SCNoFAST32 = SCNo32;
pub const SCNuFAST32 = SCNu32;
pub const SCNxFAST32 = SCNx32;
pub const SCNdFAST64 = SCNd64;
pub const SCNiFAST64 = SCNi64;
pub const SCNoFAST64 = SCNo64;
pub const SCNuFAST64 = SCNu64;
pub const SCNxFAST64 = SCNx64;
pub const SCNdPTR = "ld";
pub const SCNiPTR = "li";
pub const SCNoPTR = "lo";
pub const SCNuPTR = "lu";
pub const SCNxPTR = "lx";
pub const SCNdMAX = __SCN_MAX_LENGTH_MODIFIER__ ++ "d";
pub const SCNiMAX = __SCN_MAX_LENGTH_MODIFIER__ ++ "i";
pub const SCNoMAX = __SCN_MAX_LENGTH_MODIFIER__ ++ "o";
pub const SCNuMAX = __SCN_MAX_LENGTH_MODIFIER__ ++ "u";
pub const SCNxMAX = __SCN_MAX_LENGTH_MODIFIER__ ++ "x";
pub const __STDDEF_H__ = "";
pub inline fn offsetof(@"type": anytype, field: anytype) @TypeOf(__offsetof(@"type", field)) {
    return __offsetof(@"type", field);
}
pub const _PTRDIFF_T = "";
pub const _WINT_T = "";
pub const _NETDB_H_ = "";
pub const _SOCKLEN_T = "";
pub const _NETINET_IN_H_ = "";
pub const _SYS_SOCKET_H_ = "";
pub const _ARM__PARAM_H_ = "";
pub const __DARWIN_ALIGNBYTES = @import("std").zig.c_translation.sizeof(__darwin_size_t) - @as(c_int, 1);
pub inline fn __DARWIN_ALIGN(p: anytype) @TypeOf(@import("std").zig.c_translation.cast(__darwin_size_t, @import("std").zig.c_translation.cast(__darwin_size_t, p) + __DARWIN_ALIGNBYTES) & ~__DARWIN_ALIGNBYTES) {
    return @import("std").zig.c_translation.cast(__darwin_size_t, @import("std").zig.c_translation.cast(__darwin_size_t, p) + __DARWIN_ALIGNBYTES) & ~__DARWIN_ALIGNBYTES;
}
pub const __DARWIN_ALIGNBYTES32 = @import("std").zig.c_translation.sizeof(__uint32_t) - @as(c_int, 1);
pub inline fn __DARWIN_ALIGN32(p: anytype) @TypeOf(@import("std").zig.c_translation.cast(__darwin_size_t, @import("std").zig.c_translation.cast(__darwin_size_t, p) + __DARWIN_ALIGNBYTES32) & ~__DARWIN_ALIGNBYTES32) {
    return @import("std").zig.c_translation.cast(__darwin_size_t, @import("std").zig.c_translation.cast(__darwin_size_t, p) + __DARWIN_ALIGNBYTES32) & ~__DARWIN_ALIGNBYTES32;
}
pub const _NET_NETKEV_H_ = "";
pub const KEV_INET_SUBCLASS = @as(c_int, 1);
pub const KEV_INET_NEW_ADDR = @as(c_int, 1);
pub const KEV_INET_CHANGED_ADDR = @as(c_int, 2);
pub const KEV_INET_ADDR_DELETED = @as(c_int, 3);
pub const KEV_INET_SIFDSTADDR = @as(c_int, 4);
pub const KEV_INET_SIFBRDADDR = @as(c_int, 5);
pub const KEV_INET_SIFNETMASK = @as(c_int, 6);
pub const KEV_INET_ARPCOLLISION = @as(c_int, 7);
pub const KEV_INET_PORTINUSE = @as(c_int, 8);
pub const KEV_INET_ARPRTRFAILURE = @as(c_int, 9);
pub const KEV_INET_ARPRTRALIVE = @as(c_int, 10);
pub const KEV_DL_SUBCLASS = @as(c_int, 2);
pub const KEV_DL_SIFFLAGS = @as(c_int, 1);
pub const KEV_DL_SIFMETRICS = @as(c_int, 2);
pub const KEV_DL_SIFMTU = @as(c_int, 3);
pub const KEV_DL_SIFPHYS = @as(c_int, 4);
pub const KEV_DL_SIFMEDIA = @as(c_int, 5);
pub const KEV_DL_SIFGENERIC = @as(c_int, 6);
pub const KEV_DL_ADDMULTI = @as(c_int, 7);
pub const KEV_DL_DELMULTI = @as(c_int, 8);
pub const KEV_DL_IF_ATTACHED = @as(c_int, 9);
pub const KEV_DL_IF_DETACHING = @as(c_int, 10);
pub const KEV_DL_IF_DETACHED = @as(c_int, 11);
pub const KEV_DL_LINK_OFF = @as(c_int, 12);
pub const KEV_DL_LINK_ON = @as(c_int, 13);
pub const KEV_DL_PROTO_ATTACHED = @as(c_int, 14);
pub const KEV_DL_PROTO_DETACHED = @as(c_int, 15);
pub const KEV_DL_LINK_ADDRESS_CHANGED = @as(c_int, 16);
pub const KEV_DL_WAKEFLAGS_CHANGED = @as(c_int, 17);
pub const KEV_DL_IF_IDLE_ROUTE_REFCNT = @as(c_int, 18);
pub const KEV_DL_IFCAP_CHANGED = @as(c_int, 19);
pub const KEV_DL_LINK_QUALITY_METRIC_CHANGED = @as(c_int, 20);
pub const KEV_DL_NODE_PRESENCE = @as(c_int, 21);
pub const KEV_DL_NODE_ABSENCE = @as(c_int, 22);
pub const KEV_DL_MASTER_ELECTED = @as(c_int, 23);
pub const KEV_DL_ISSUES = @as(c_int, 24);
pub const KEV_DL_IFDELEGATE_CHANGED = @as(c_int, 25);
pub const KEV_DL_AWDL_RESTRICTED = @as(c_int, 26);
pub const KEV_DL_AWDL_UNRESTRICTED = @as(c_int, 27);
pub const KEV_DL_RRC_STATE_CHANGED = @as(c_int, 28);
pub const KEV_DL_QOS_MODE_CHANGED = @as(c_int, 29);
pub const KEV_DL_LOW_POWER_MODE_CHANGED = @as(c_int, 30);
pub const KEV_INET6_SUBCLASS = @as(c_int, 6);
pub const KEV_INET6_NEW_USER_ADDR = @as(c_int, 1);
pub const KEV_INET6_CHANGED_ADDR = @as(c_int, 2);
pub const KEV_INET6_ADDR_DELETED = @as(c_int, 3);
pub const KEV_INET6_NEW_LL_ADDR = @as(c_int, 4);
pub const KEV_INET6_NEW_RTADV_ADDR = @as(c_int, 5);
pub const KEV_INET6_DEFROUTER = @as(c_int, 6);
pub const KEV_INET6_REQUEST_NAT64_PREFIX = @as(c_int, 7);
pub const _SA_FAMILY_T = "";
pub const _STRUCT_IOVEC = "";
pub const SOCK_STREAM = @as(c_int, 1);
pub const SOCK_DGRAM = @as(c_int, 2);
pub const SOCK_RAW = @as(c_int, 3);
pub const SOCK_RDM = @as(c_int, 4);
pub const SOCK_SEQPACKET = @as(c_int, 5);
pub const SO_DEBUG = @as(c_int, 0x0001);
pub const SO_ACCEPTCONN = @as(c_int, 0x0002);
pub const SO_REUSEADDR = @as(c_int, 0x0004);
pub const SO_KEEPALIVE = @as(c_int, 0x0008);
pub const SO_DONTROUTE = @as(c_int, 0x0010);
pub const SO_BROADCAST = @as(c_int, 0x0020);
pub const SO_USELOOPBACK = @as(c_int, 0x0040);
pub const SO_LINGER = @as(c_int, 0x0080);
pub const SO_OOBINLINE = @as(c_int, 0x0100);
pub const SO_REUSEPORT = @as(c_int, 0x0200);
pub const SO_TIMESTAMP = @as(c_int, 0x0400);
pub const SO_TIMESTAMP_MONOTONIC = @as(c_int, 0x0800);
pub const SO_DONTTRUNC = @as(c_int, 0x2000);
pub const SO_WANTMORE = @as(c_int, 0x4000);
pub const SO_WANTOOBFLAG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hexadecimal);
pub const SO_SNDBUF = @as(c_int, 0x1001);
pub const SO_RCVBUF = @as(c_int, 0x1002);
pub const SO_SNDLOWAT = @as(c_int, 0x1003);
pub const SO_RCVLOWAT = @as(c_int, 0x1004);
pub const SO_SNDTIMEO = @as(c_int, 0x1005);
pub const SO_RCVTIMEO = @as(c_int, 0x1006);
pub const SO_ERROR = @as(c_int, 0x1007);
pub const SO_TYPE = @as(c_int, 0x1008);
pub const SO_LABEL = @as(c_int, 0x1010);
pub const SO_PEERLABEL = @as(c_int, 0x1011);
pub const SO_NREAD = @as(c_int, 0x1020);
pub const SO_NKE = @as(c_int, 0x1021);
pub const SO_NOSIGPIPE = @as(c_int, 0x1022);
pub const SO_NOADDRERR = @as(c_int, 0x1023);
pub const SO_NWRITE = @as(c_int, 0x1024);
pub const SO_REUSESHAREUID = @as(c_int, 0x1025);
pub const SO_NOTIFYCONFLICT = @as(c_int, 0x1026);
pub const SO_UPCALLCLOSEWAIT = @as(c_int, 0x1027);
pub const SO_LINGER_SEC = @as(c_int, 0x1080);
pub const SO_RANDOMPORT = @as(c_int, 0x1082);
pub const SO_NP_EXTENSIONS = @as(c_int, 0x1083);
pub const SO_NUMRCVPKT = @as(c_int, 0x1112);
pub const SO_NET_SERVICE_TYPE = @as(c_int, 0x1116);
pub const SO_NETSVC_MARKING_LEVEL = @as(c_int, 0x1119);
pub const NET_SERVICE_TYPE_BE = @as(c_int, 0);
pub const NET_SERVICE_TYPE_BK = @as(c_int, 1);
pub const NET_SERVICE_TYPE_SIG = @as(c_int, 2);
pub const NET_SERVICE_TYPE_VI = @as(c_int, 3);
pub const NET_SERVICE_TYPE_VO = @as(c_int, 4);
pub const NET_SERVICE_TYPE_RV = @as(c_int, 5);
pub const NET_SERVICE_TYPE_AV = @as(c_int, 6);
pub const NET_SERVICE_TYPE_OAM = @as(c_int, 7);
pub const NET_SERVICE_TYPE_RD = @as(c_int, 8);
pub const NETSVC_MRKNG_UNKNOWN = @as(c_int, 0);
pub const NETSVC_MRKNG_LVL_L2 = @as(c_int, 1);
pub const NETSVC_MRKNG_LVL_L3L2_ALL = @as(c_int, 2);
pub const NETSVC_MRKNG_LVL_L3L2_BK = @as(c_int, 3);
pub const SAE_ASSOCID_ANY = @as(c_int, 0);
pub const SAE_ASSOCID_ALL = @import("std").zig.c_translation.cast(sae_associd_t, -@as(c_ulonglong, 1));
pub const SAE_CONNID_ANY = @as(c_int, 0);
pub const SAE_CONNID_ALL = @import("std").zig.c_translation.cast(sae_connid_t, -@as(c_ulonglong, 1));
pub const CONNECT_RESUME_ON_READ_WRITE = @as(c_int, 0x1);
pub const CONNECT_DATA_IDEMPOTENT = @as(c_int, 0x2);
pub const CONNECT_DATA_AUTHENTICATED = @as(c_int, 0x4);
pub const SONPX_SETOPTSHUT = @as(c_int, 0x000000001);
pub const SOL_SOCKET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hexadecimal);
pub const AF_UNSPEC = @as(c_int, 0);
pub const AF_UNIX = @as(c_int, 1);
pub const AF_LOCAL = AF_UNIX;
pub const AF_INET = @as(c_int, 2);
pub const AF_IMPLINK = @as(c_int, 3);
pub const AF_PUP = @as(c_int, 4);
pub const AF_CHAOS = @as(c_int, 5);
pub const AF_NS = @as(c_int, 6);
pub const AF_ISO = @as(c_int, 7);
pub const AF_OSI = AF_ISO;
pub const AF_ECMA = @as(c_int, 8);
pub const AF_DATAKIT = @as(c_int, 9);
pub const AF_CCITT = @as(c_int, 10);
pub const AF_SNA = @as(c_int, 11);
pub const AF_DECnet = @as(c_int, 12);
pub const AF_DLI = @as(c_int, 13);
pub const AF_LAT = @as(c_int, 14);
pub const AF_HYLINK = @as(c_int, 15);
pub const AF_APPLETALK = @as(c_int, 16);
pub const AF_ROUTE = @as(c_int, 17);
pub const AF_LINK = @as(c_int, 18);
pub const pseudo_AF_XTP = @as(c_int, 19);
pub const AF_COIP = @as(c_int, 20);
pub const AF_CNT = @as(c_int, 21);
pub const pseudo_AF_RTIP = @as(c_int, 22);
pub const AF_IPX = @as(c_int, 23);
pub const AF_SIP = @as(c_int, 24);
pub const pseudo_AF_PIP = @as(c_int, 25);
pub const AF_NDRV = @as(c_int, 27);
pub const AF_ISDN = @as(c_int, 28);
pub const AF_E164 = AF_ISDN;
pub const pseudo_AF_KEY = @as(c_int, 29);
pub const AF_INET6 = @as(c_int, 30);
pub const AF_NATM = @as(c_int, 31);
pub const AF_SYSTEM = @as(c_int, 32);
pub const AF_NETBIOS = @as(c_int, 33);
pub const AF_PPP = @as(c_int, 34);
pub const pseudo_AF_HDRCMPLT = @as(c_int, 35);
pub const AF_RESERVED_36 = @as(c_int, 36);
pub const AF_IEEE80211 = @as(c_int, 37);
pub const AF_UTUN = @as(c_int, 38);
pub const AF_VSOCK = @as(c_int, 40);
pub const AF_MAX = @as(c_int, 41);
pub const SOCK_MAXADDRLEN = @as(c_int, 255);
pub const _SS_MAXSIZE = @as(c_int, 128);
pub const _SS_ALIGNSIZE = @import("std").zig.c_translation.sizeof(__int64_t);
pub const _SS_PAD1SIZE = (_SS_ALIGNSIZE - @import("std").zig.c_translation.sizeof(__uint8_t)) - @import("std").zig.c_translation.sizeof(sa_family_t);
pub const _SS_PAD2SIZE = (((_SS_MAXSIZE - @import("std").zig.c_translation.sizeof(__uint8_t)) - @import("std").zig.c_translation.sizeof(sa_family_t)) - _SS_PAD1SIZE) - _SS_ALIGNSIZE;
pub const PF_UNSPEC = AF_UNSPEC;
pub const PF_LOCAL = AF_LOCAL;
pub const PF_UNIX = PF_LOCAL;
pub const PF_INET = AF_INET;
pub const PF_IMPLINK = AF_IMPLINK;
pub const PF_PUP = AF_PUP;
pub const PF_CHAOS = AF_CHAOS;
pub const PF_NS = AF_NS;
pub const PF_ISO = AF_ISO;
pub const PF_OSI = AF_ISO;
pub const PF_ECMA = AF_ECMA;
pub const PF_DATAKIT = AF_DATAKIT;
pub const PF_CCITT = AF_CCITT;
pub const PF_SNA = AF_SNA;
pub const PF_DECnet = AF_DECnet;
pub const PF_DLI = AF_DLI;
pub const PF_LAT = AF_LAT;
pub const PF_HYLINK = AF_HYLINK;
pub const PF_APPLETALK = AF_APPLETALK;
pub const PF_ROUTE = AF_ROUTE;
pub const PF_LINK = AF_LINK;
pub const PF_XTP = pseudo_AF_XTP;
pub const PF_COIP = AF_COIP;
pub const PF_CNT = AF_CNT;
pub const PF_SIP = AF_SIP;
pub const PF_IPX = AF_IPX;
pub const PF_RTIP = pseudo_AF_RTIP;
pub const PF_PIP = pseudo_AF_PIP;
pub const PF_NDRV = AF_NDRV;
pub const PF_ISDN = AF_ISDN;
pub const PF_KEY = pseudo_AF_KEY;
pub const PF_INET6 = AF_INET6;
pub const PF_NATM = AF_NATM;
pub const PF_SYSTEM = AF_SYSTEM;
pub const PF_NETBIOS = AF_NETBIOS;
pub const PF_PPP = AF_PPP;
pub const PF_RESERVED_36 = AF_RESERVED_36;
pub const PF_UTUN = AF_UTUN;
pub const PF_VSOCK = AF_VSOCK;
pub const PF_MAX = AF_MAX;
pub const PF_VLAN = @import("std").zig.c_translation.cast(u32, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x766c616e, .hexadecimal));
pub const PF_BOND = @import("std").zig.c_translation.cast(u32, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x626f6e64, .hexadecimal));
pub const NET_MAXID = AF_MAX;
pub const NET_RT_DUMP = @as(c_int, 1);
pub const NET_RT_FLAGS = @as(c_int, 2);
pub const NET_RT_IFLIST = @as(c_int, 3);
pub const NET_RT_STAT = @as(c_int, 4);
pub const NET_RT_TRASH = @as(c_int, 5);
pub const NET_RT_IFLIST2 = @as(c_int, 6);
pub const NET_RT_DUMP2 = @as(c_int, 7);
pub const NET_RT_FLAGS_PRIV = @as(c_int, 10);
pub const NET_RT_MAXID = @as(c_int, 11);
pub const SOMAXCONN = @as(c_int, 128);
pub const MSG_OOB = @as(c_int, 0x1);
pub const MSG_PEEK = @as(c_int, 0x2);
pub const MSG_DONTROUTE = @as(c_int, 0x4);
pub const MSG_EOR = @as(c_int, 0x8);
pub const MSG_TRUNC = @as(c_int, 0x10);
pub const MSG_CTRUNC = @as(c_int, 0x20);
pub const MSG_WAITALL = @as(c_int, 0x40);
pub const MSG_DONTWAIT = @as(c_int, 0x80);
pub const MSG_EOF = @as(c_int, 0x100);
pub const MSG_WAITSTREAM = @as(c_int, 0x200);
pub const MSG_FLUSH = @as(c_int, 0x400);
pub const MSG_HOLD = @as(c_int, 0x800);
pub const MSG_SEND = @as(c_int, 0x1000);
pub const MSG_HAVEMORE = @as(c_int, 0x2000);
pub const MSG_RCVMORE = @as(c_int, 0x4000);
pub const MSG_NEEDSA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000, .hexadecimal);
pub const MSG_NOSIGNAL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000, .hexadecimal);
pub inline fn CMSG_DATA(cmsg: anytype) @TypeOf(@import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr))) {
    return @import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr));
}
pub inline fn CMSG_FIRSTHDR(mhdr: anytype) @TypeOf(if (mhdr.*.msg_controllen >= @import("std").zig.c_translation.sizeof(struct_cmsghdr)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_long, 0))) {
    return if (mhdr.*.msg_controllen >= @import("std").zig.c_translation.sizeof(struct_cmsghdr)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_long, 0));
}
pub inline fn CMSG_NXTHDR(mhdr: anytype, cmsg: anytype) @TypeOf(if (@import("std").zig.c_translation.cast([*c]u8, cmsg) == @import("std").zig.c_translation.cast([*c]u8, @as(c_long, 0))) CMSG_FIRSTHDR(mhdr) else if (((@import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.cast(__uint32_t, cmsg.*.cmsg_len))) + __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr))) > (@import("std").zig.c_translation.cast([*c]u8, mhdr.*.msg_control) + mhdr.*.msg_controllen)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_long, 0)) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.cast(__uint32_t, cmsg.*.cmsg_len))))) {
    return if (@import("std").zig.c_translation.cast([*c]u8, cmsg) == @import("std").zig.c_translation.cast([*c]u8, @as(c_long, 0))) CMSG_FIRSTHDR(mhdr) else if (((@import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.cast(__uint32_t, cmsg.*.cmsg_len))) + __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr))) > (@import("std").zig.c_translation.cast([*c]u8, mhdr.*.msg_control) + mhdr.*.msg_controllen)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_long, 0)) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.cast(__uint32_t, cmsg.*.cmsg_len))));
}
pub inline fn CMSG_SPACE(l: anytype) @TypeOf(__DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + __DARWIN_ALIGN32(l)) {
    return __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + __DARWIN_ALIGN32(l);
}
pub inline fn CMSG_LEN(l: anytype) @TypeOf(__DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + l) {
    return __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + l;
}
pub const SCM_RIGHTS = @as(c_int, 0x01);
pub const SCM_TIMESTAMP = @as(c_int, 0x02);
pub const SCM_CREDS = @as(c_int, 0x03);
pub const SCM_TIMESTAMP_MONOTONIC = @as(c_int, 0x04);
pub const SHUT_RD = @as(c_int, 0);
pub const SHUT_WR = @as(c_int, 1);
pub const SHUT_RDWR = @as(c_int, 2);
pub const IPPROTO_IP = @as(c_int, 0);
pub const IPPROTO_HOPOPTS = @as(c_int, 0);
pub const IPPROTO_ICMP = @as(c_int, 1);
pub const IPPROTO_IGMP = @as(c_int, 2);
pub const IPPROTO_GGP = @as(c_int, 3);
pub const IPPROTO_IPV4 = @as(c_int, 4);
pub const IPPROTO_IPIP = IPPROTO_IPV4;
pub const IPPROTO_TCP = @as(c_int, 6);
pub const IPPROTO_ST = @as(c_int, 7);
pub const IPPROTO_EGP = @as(c_int, 8);
pub const IPPROTO_PIGP = @as(c_int, 9);
pub const IPPROTO_RCCMON = @as(c_int, 10);
pub const IPPROTO_NVPII = @as(c_int, 11);
pub const IPPROTO_PUP = @as(c_int, 12);
pub const IPPROTO_ARGUS = @as(c_int, 13);
pub const IPPROTO_EMCON = @as(c_int, 14);
pub const IPPROTO_XNET = @as(c_int, 15);
pub const IPPROTO_CHAOS = @as(c_int, 16);
pub const IPPROTO_UDP = @as(c_int, 17);
pub const IPPROTO_MUX = @as(c_int, 18);
pub const IPPROTO_MEAS = @as(c_int, 19);
pub const IPPROTO_HMP = @as(c_int, 20);
pub const IPPROTO_PRM = @as(c_int, 21);
pub const IPPROTO_IDP = @as(c_int, 22);
pub const IPPROTO_TRUNK1 = @as(c_int, 23);
pub const IPPROTO_TRUNK2 = @as(c_int, 24);
pub const IPPROTO_LEAF1 = @as(c_int, 25);
pub const IPPROTO_LEAF2 = @as(c_int, 26);
pub const IPPROTO_RDP = @as(c_int, 27);
pub const IPPROTO_IRTP = @as(c_int, 28);
pub const IPPROTO_TP = @as(c_int, 29);
pub const IPPROTO_BLT = @as(c_int, 30);
pub const IPPROTO_NSP = @as(c_int, 31);
pub const IPPROTO_INP = @as(c_int, 32);
pub const IPPROTO_SEP = @as(c_int, 33);
pub const IPPROTO_3PC = @as(c_int, 34);
pub const IPPROTO_IDPR = @as(c_int, 35);
pub const IPPROTO_XTP = @as(c_int, 36);
pub const IPPROTO_DDP = @as(c_int, 37);
pub const IPPROTO_CMTP = @as(c_int, 38);
pub const IPPROTO_TPXX = @as(c_int, 39);
pub const IPPROTO_IL = @as(c_int, 40);
pub const IPPROTO_IPV6 = @as(c_int, 41);
pub const IPPROTO_SDRP = @as(c_int, 42);
pub const IPPROTO_ROUTING = @as(c_int, 43);
pub const IPPROTO_FRAGMENT = @as(c_int, 44);
pub const IPPROTO_IDRP = @as(c_int, 45);
pub const IPPROTO_RSVP = @as(c_int, 46);
pub const IPPROTO_GRE = @as(c_int, 47);
pub const IPPROTO_MHRP = @as(c_int, 48);
pub const IPPROTO_BHA = @as(c_int, 49);
pub const IPPROTO_ESP = @as(c_int, 50);
pub const IPPROTO_AH = @as(c_int, 51);
pub const IPPROTO_INLSP = @as(c_int, 52);
pub const IPPROTO_SWIPE = @as(c_int, 53);
pub const IPPROTO_NHRP = @as(c_int, 54);
pub const IPPROTO_ICMPV6 = @as(c_int, 58);
pub const IPPROTO_NONE = @as(c_int, 59);
pub const IPPROTO_DSTOPTS = @as(c_int, 60);
pub const IPPROTO_AHIP = @as(c_int, 61);
pub const IPPROTO_CFTP = @as(c_int, 62);
pub const IPPROTO_HELLO = @as(c_int, 63);
pub const IPPROTO_SATEXPAK = @as(c_int, 64);
pub const IPPROTO_KRYPTOLAN = @as(c_int, 65);
pub const IPPROTO_RVD = @as(c_int, 66);
pub const IPPROTO_IPPC = @as(c_int, 67);
pub const IPPROTO_ADFS = @as(c_int, 68);
pub const IPPROTO_SATMON = @as(c_int, 69);
pub const IPPROTO_VISA = @as(c_int, 70);
pub const IPPROTO_IPCV = @as(c_int, 71);
pub const IPPROTO_CPNX = @as(c_int, 72);
pub const IPPROTO_CPHB = @as(c_int, 73);
pub const IPPROTO_WSN = @as(c_int, 74);
pub const IPPROTO_PVP = @as(c_int, 75);
pub const IPPROTO_BRSATMON = @as(c_int, 76);
pub const IPPROTO_ND = @as(c_int, 77);
pub const IPPROTO_WBMON = @as(c_int, 78);
pub const IPPROTO_WBEXPAK = @as(c_int, 79);
pub const IPPROTO_EON = @as(c_int, 80);
pub const IPPROTO_VMTP = @as(c_int, 81);
pub const IPPROTO_SVMTP = @as(c_int, 82);
pub const IPPROTO_VINES = @as(c_int, 83);
pub const IPPROTO_TTP = @as(c_int, 84);
pub const IPPROTO_IGP = @as(c_int, 85);
pub const IPPROTO_DGP = @as(c_int, 86);
pub const IPPROTO_TCF = @as(c_int, 87);
pub const IPPROTO_IGRP = @as(c_int, 88);
pub const IPPROTO_OSPFIGP = @as(c_int, 89);
pub const IPPROTO_SRPC = @as(c_int, 90);
pub const IPPROTO_LARP = @as(c_int, 91);
pub const IPPROTO_MTP = @as(c_int, 92);
pub const IPPROTO_AX25 = @as(c_int, 93);
pub const IPPROTO_IPEIP = @as(c_int, 94);
pub const IPPROTO_MICP = @as(c_int, 95);
pub const IPPROTO_SCCSP = @as(c_int, 96);
pub const IPPROTO_ETHERIP = @as(c_int, 97);
pub const IPPROTO_ENCAP = @as(c_int, 98);
pub const IPPROTO_APES = @as(c_int, 99);
pub const IPPROTO_GMTP = @as(c_int, 100);
pub const IPPROTO_PIM = @as(c_int, 103);
pub const IPPROTO_IPCOMP = @as(c_int, 108);
pub const IPPROTO_PGM = @as(c_int, 113);
pub const IPPROTO_SCTP = @as(c_int, 132);
pub const IPPROTO_DIVERT = @as(c_int, 254);
pub const IPPROTO_RAW = @as(c_int, 255);
pub const IPPROTO_MAX = @as(c_int, 256);
pub const IPPROTO_DONE = @as(c_int, 257);
pub const __DARWIN_IPPORT_RESERVED = @as(c_int, 1024);
pub const IPPORT_RESERVED = __DARWIN_IPPORT_RESERVED;
pub const IPPORT_USERRESERVED = @as(c_int, 5000);
pub const IPPORT_HIFIRSTAUTO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 49152, .decimal);
pub const IPPORT_HILASTAUTO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const IPPORT_RESERVEDSTART = @as(c_int, 600);
pub const INADDR_ANY = @import("std").zig.c_translation.cast(u_int32_t, @as(c_int, 0x00000000));
pub const INADDR_BROADCAST = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hexadecimal));
pub inline fn IN_CLASSA(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hexadecimal)) == @as(c_int, 0)) {
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hexadecimal)) == @as(c_int, 0);
}
pub const IN_CLASSA_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hexadecimal);
pub const IN_CLASSA_NSHIFT = @as(c_int, 24);
pub const IN_CLASSA_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00ffffff, .hexadecimal);
pub const IN_CLASSA_MAX = @as(c_int, 128);
pub inline fn IN_CLASSB(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hexadecimal)) {
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hexadecimal);
}
pub const IN_CLASSB_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff0000, .hexadecimal);
pub const IN_CLASSB_NSHIFT = @as(c_int, 16);
pub const IN_CLASSB_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000ffff, .hexadecimal);
pub const IN_CLASSB_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub inline fn IN_CLASSC(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hexadecimal)) {
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hexadecimal);
}
pub const IN_CLASSC_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff00, .hexadecimal);
pub const IN_CLASSC_NSHIFT = @as(c_int, 8);
pub const IN_CLASSC_HOST = @as(c_int, 0x000000ff);
pub inline fn IN_CLASSD(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hexadecimal)) {
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hexadecimal);
}
pub const IN_CLASSD_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal);
pub const IN_CLASSD_NSHIFT = @as(c_int, 28);
pub const IN_CLASSD_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0fffffff, .hexadecimal);
pub inline fn IN_MULTICAST(i: anytype) @TypeOf(IN_CLASSD(i)) {
    return IN_CLASSD(i);
}
pub inline fn IN_EXPERIMENTAL(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal)) {
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal);
}
pub inline fn IN_BADCLASS(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal)) {
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hexadecimal);
}
pub const INADDR_LOOPBACK = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7f000001, .hexadecimal));
pub const INADDR_NONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hexadecimal);
pub const INADDR_UNSPEC_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hexadecimal));
pub const INADDR_ALLHOSTS_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000001, .hexadecimal));
pub const INADDR_ALLRTRS_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000002, .hexadecimal));
pub const INADDR_ALLRPTS_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000016, .hexadecimal));
pub const INADDR_CARP_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000012, .hexadecimal));
pub const INADDR_PFSYNC_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe00000f0, .hexadecimal));
pub const INADDR_ALLMDNS_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe00000fb, .hexadecimal));
pub const INADDR_MAX_LOCAL_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe00000ff, .hexadecimal));
pub const IN_LINKLOCALNETNUM = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xA9FE0000, .hexadecimal));
pub inline fn IN_LINKLOCAL(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & IN_CLASSB_NET) == IN_LINKLOCALNETNUM) {
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & IN_CLASSB_NET) == IN_LINKLOCALNETNUM;
}
pub inline fn IN_LOOPBACK(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7f000000, .hexadecimal)) {
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7f000000, .hexadecimal);
}
pub inline fn IN_ZERONET(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hexadecimal)) == @as(c_int, 0)) {
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hexadecimal)) == @as(c_int, 0);
}
pub inline fn IN_PRIVATE(i: anytype) @TypeOf((((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0a000000, .hexadecimal)) or ((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xfff00000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xac100000, .hexadecimal))) or ((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff0000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0a80000, .hexadecimal))) {
    return (((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0a000000, .hexadecimal)) or ((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xfff00000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xac100000, .hexadecimal))) or ((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff0000, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0a80000, .hexadecimal));
}
pub inline fn IN_LOCAL_GROUP(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff00, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hexadecimal)) {
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff00, .hexadecimal)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hexadecimal);
}
pub inline fn IN_ANY_LOCAL(i: anytype) @TypeOf((IN_LINKLOCAL(i) != 0) or (IN_LOCAL_GROUP(i) != 0)) {
    return (IN_LINKLOCAL(i) != 0) or (IN_LOCAL_GROUP(i) != 0);
}
pub const IN_LOOPBACKNET = @as(c_int, 127);
pub inline fn IN_ARE_ADDR_EQUAL(a: anytype, b: anytype) @TypeOf(bcmp(&a.*.s_addr, &b.*.s_addr, @import("std").zig.c_translation.sizeof(struct_in_addr)) == @as(c_int, 0)) {
    return bcmp(&a.*.s_addr, &b.*.s_addr, @import("std").zig.c_translation.sizeof(struct_in_addr)) == @as(c_int, 0);
}
pub const INET_ADDRSTRLEN = @as(c_int, 16);
pub const IP_OPTIONS = @as(c_int, 1);
pub const IP_HDRINCL = @as(c_int, 2);
pub const IP_TOS = @as(c_int, 3);
pub const IP_TTL = @as(c_int, 4);
pub const IP_RECVOPTS = @as(c_int, 5);
pub const IP_RECVRETOPTS = @as(c_int, 6);
pub const IP_RECVDSTADDR = @as(c_int, 7);
pub const IP_RETOPTS = @as(c_int, 8);
pub const IP_MULTICAST_IF = @as(c_int, 9);
pub const IP_MULTICAST_TTL = @as(c_int, 10);
pub const IP_MULTICAST_LOOP = @as(c_int, 11);
pub const IP_ADD_MEMBERSHIP = @as(c_int, 12);
pub const IP_DROP_MEMBERSHIP = @as(c_int, 13);
pub const IP_MULTICAST_VIF = @as(c_int, 14);
pub const IP_RSVP_ON = @as(c_int, 15);
pub const IP_RSVP_OFF = @as(c_int, 16);
pub const IP_RSVP_VIF_ON = @as(c_int, 17);
pub const IP_RSVP_VIF_OFF = @as(c_int, 18);
pub const IP_PORTRANGE = @as(c_int, 19);
pub const IP_RECVIF = @as(c_int, 20);
pub const IP_IPSEC_POLICY = @as(c_int, 21);
pub const IP_FAITH = @as(c_int, 22);
pub const IP_STRIPHDR = @as(c_int, 23);
pub const IP_RECVTTL = @as(c_int, 24);
pub const IP_BOUND_IF = @as(c_int, 25);
pub const IP_PKTINFO = @as(c_int, 26);
pub const IP_RECVPKTINFO = IP_PKTINFO;
pub const IP_RECVTOS = @as(c_int, 27);
pub const IP_DONTFRAG = @as(c_int, 28);
pub const IP_FW_ADD = @as(c_int, 40);
pub const IP_FW_DEL = @as(c_int, 41);
pub const IP_FW_FLUSH = @as(c_int, 42);
pub const IP_FW_ZERO = @as(c_int, 43);
pub const IP_FW_GET = @as(c_int, 44);
pub const IP_FW_RESETLOG = @as(c_int, 45);
pub const IP_OLD_FW_ADD = @as(c_int, 50);
pub const IP_OLD_FW_DEL = @as(c_int, 51);
pub const IP_OLD_FW_FLUSH = @as(c_int, 52);
pub const IP_OLD_FW_ZERO = @as(c_int, 53);
pub const IP_OLD_FW_GET = @as(c_int, 54);
pub const IP_NAT__XXX = @as(c_int, 55);
pub const IP_OLD_FW_RESETLOG = @as(c_int, 56);
pub const IP_DUMMYNET_CONFIGURE = @as(c_int, 60);
pub const IP_DUMMYNET_DEL = @as(c_int, 61);
pub const IP_DUMMYNET_FLUSH = @as(c_int, 62);
pub const IP_DUMMYNET_GET = @as(c_int, 64);
pub const IP_TRAFFIC_MGT_BACKGROUND = @as(c_int, 65);
pub const IP_MULTICAST_IFINDEX = @as(c_int, 66);
pub const IP_ADD_SOURCE_MEMBERSHIP = @as(c_int, 70);
pub const IP_DROP_SOURCE_MEMBERSHIP = @as(c_int, 71);
pub const IP_BLOCK_SOURCE = @as(c_int, 72);
pub const IP_UNBLOCK_SOURCE = @as(c_int, 73);
pub const IP_MSFILTER = @as(c_int, 74);
pub const MCAST_JOIN_GROUP = @as(c_int, 80);
pub const MCAST_LEAVE_GROUP = @as(c_int, 81);
pub const MCAST_JOIN_SOURCE_GROUP = @as(c_int, 82);
pub const MCAST_LEAVE_SOURCE_GROUP = @as(c_int, 83);
pub const MCAST_BLOCK_SOURCE = @as(c_int, 84);
pub const MCAST_UNBLOCK_SOURCE = @as(c_int, 85);
pub const IP_DEFAULT_MULTICAST_TTL = @as(c_int, 1);
pub const IP_DEFAULT_MULTICAST_LOOP = @as(c_int, 1);
pub const IP_MIN_MEMBERSHIPS = @as(c_int, 31);
pub const IP_MAX_MEMBERSHIPS = @as(c_int, 4095);
pub const IP_MAX_GROUP_SRC_FILTER = @as(c_int, 512);
pub const IP_MAX_SOCK_SRC_FILTER = @as(c_int, 128);
pub const IP_MAX_SOCK_MUTE_FILTER = @as(c_int, 128);
pub const __MSFILTERREQ_DEFINED = "";
pub const MCAST_UNDEFINED = @as(c_int, 0);
pub const MCAST_INCLUDE = @as(c_int, 1);
pub const MCAST_EXCLUDE = @as(c_int, 2);
pub const IP_PORTRANGE_DEFAULT = @as(c_int, 0);
pub const IP_PORTRANGE_HIGH = @as(c_int, 1);
pub const IP_PORTRANGE_LOW = @as(c_int, 2);
pub const IPPROTO_MAXID = IPPROTO_AH + @as(c_int, 1);
pub const IPCTL_FORWARDING = @as(c_int, 1);
pub const IPCTL_SENDREDIRECTS = @as(c_int, 2);
pub const IPCTL_DEFTTL = @as(c_int, 3);
pub const IPCTL_RTEXPIRE = @as(c_int, 5);
pub const IPCTL_RTMINEXPIRE = @as(c_int, 6);
pub const IPCTL_RTMAXCACHE = @as(c_int, 7);
pub const IPCTL_SOURCEROUTE = @as(c_int, 8);
pub const IPCTL_DIRECTEDBROADCAST = @as(c_int, 9);
pub const IPCTL_INTRQMAXLEN = @as(c_int, 10);
pub const IPCTL_INTRQDROPS = @as(c_int, 11);
pub const IPCTL_STATS = @as(c_int, 12);
pub const IPCTL_ACCEPTSOURCEROUTE = @as(c_int, 13);
pub const IPCTL_FASTFORWARDING = @as(c_int, 14);
pub const IPCTL_KEEPFAITH = @as(c_int, 15);
pub const IPCTL_GIF_TTL = @as(c_int, 16);
pub const IPCTL_MAXID = @as(c_int, 17);
pub const __KAME_NETINET_IN_H_INCLUDED_ = "";
pub const _NETINET6_IN6_H_ = "";
pub const __KAME__ = "";
pub const __KAME_VERSION = "2009/apple-darwin";
pub const IPV6PORT_RESERVED = @as(c_int, 1024);
pub const IPV6PORT_ANONMIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 49152, .decimal);
pub const IPV6PORT_ANONMAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const IPV6PORT_RESERVEDMIN = @as(c_int, 600);
pub const IPV6PORT_RESERVEDMAX = IPV6PORT_RESERVED - @as(c_int, 1);
pub const INET6_ADDRSTRLEN = @as(c_int, 46);
pub const SIN6_LEN = "";
pub inline fn IN6_ARE_ADDR_EQUAL(a: anytype, b: anytype) @TypeOf(memcmp(&a.*.s6_addr[@intCast(usize, @as(c_int, 0))], &b.*.s6_addr[@intCast(usize, @as(c_int, 0))], @import("std").zig.c_translation.sizeof(struct_in6_addr)) == @as(c_int, 0)) {
    return memcmp(&a.*.s6_addr[@intCast(usize, @as(c_int, 0))], &b.*.s6_addr[@intCast(usize, @as(c_int, 0))], @import("std").zig.c_translation.sizeof(struct_in6_addr)) == @as(c_int, 0);
}
pub inline fn IN6_IS_ADDR_6TO4(x: anytype) @TypeOf(ntohs(x.*.s6_addr16[@intCast(usize, @as(c_int, 0))]) == @as(c_int, 0x2002)) {
    return ntohs(x.*.s6_addr16[@intCast(usize, @as(c_int, 0))]) == @as(c_int, 0x2002);
}
pub const __IPV6_ADDR_SCOPE_NODELOCAL = @as(c_int, 0x01);
pub const __IPV6_ADDR_SCOPE_INTFACELOCAL = @as(c_int, 0x01);
pub const __IPV6_ADDR_SCOPE_LINKLOCAL = @as(c_int, 0x02);
pub const __IPV6_ADDR_SCOPE_SITELOCAL = @as(c_int, 0x05);
pub const __IPV6_ADDR_SCOPE_ORGLOCAL = @as(c_int, 0x08);
pub const __IPV6_ADDR_SCOPE_GLOBAL = @as(c_int, 0x0e);
pub inline fn IN6_IS_ADDR_LINKLOCAL(a: anytype) @TypeOf((a.*.s6_addr[@intCast(usize, @as(c_int, 0))] == @as(c_int, 0xfe)) and ((a.*.s6_addr[@intCast(usize, @as(c_int, 1))] & @as(c_int, 0xc0)) == @as(c_int, 0x80))) {
    return (a.*.s6_addr[@intCast(usize, @as(c_int, 0))] == @as(c_int, 0xfe)) and ((a.*.s6_addr[@intCast(usize, @as(c_int, 1))] & @as(c_int, 0xc0)) == @as(c_int, 0x80));
}
pub inline fn IN6_IS_ADDR_SITELOCAL(a: anytype) @TypeOf((a.*.s6_addr[@intCast(usize, @as(c_int, 0))] == @as(c_int, 0xfe)) and ((a.*.s6_addr[@intCast(usize, @as(c_int, 1))] & @as(c_int, 0xc0)) == @as(c_int, 0xc0))) {
    return (a.*.s6_addr[@intCast(usize, @as(c_int, 0))] == @as(c_int, 0xfe)) and ((a.*.s6_addr[@intCast(usize, @as(c_int, 1))] & @as(c_int, 0xc0)) == @as(c_int, 0xc0));
}
pub inline fn IN6_IS_ADDR_MULTICAST(a: anytype) @TypeOf(a.*.s6_addr[@intCast(usize, @as(c_int, 0))] == @as(c_int, 0xff)) {
    return a.*.s6_addr[@intCast(usize, @as(c_int, 0))] == @as(c_int, 0xff);
}
pub inline fn IPV6_ADDR_MC_FLAGS(a: anytype) @TypeOf(a.*.s6_addr[@intCast(usize, @as(c_int, 1))] & @as(c_int, 0xf0)) {
    return a.*.s6_addr[@intCast(usize, @as(c_int, 1))] & @as(c_int, 0xf0);
}
pub const IPV6_ADDR_MC_FLAGS_TRANSIENT = @as(c_int, 0x10);
pub const IPV6_ADDR_MC_FLAGS_PREFIX = @as(c_int, 0x20);
pub const IPV6_ADDR_MC_FLAGS_UNICAST_BASED = IPV6_ADDR_MC_FLAGS_TRANSIENT | IPV6_ADDR_MC_FLAGS_PREFIX;
pub inline fn IN6_IS_ADDR_UNICAST_BASED_MULTICAST(a: anytype) @TypeOf((IN6_IS_ADDR_MULTICAST(a) != 0) and (IPV6_ADDR_MC_FLAGS(a) == IPV6_ADDR_MC_FLAGS_UNICAST_BASED)) {
    return (IN6_IS_ADDR_MULTICAST(a) != 0) and (IPV6_ADDR_MC_FLAGS(a) == IPV6_ADDR_MC_FLAGS_UNICAST_BASED);
}
pub inline fn IN6_IS_ADDR_UNIQUE_LOCAL(a: anytype) @TypeOf((a.*.s6_addr[@intCast(usize, @as(c_int, 0))] == @as(c_int, 0xfc)) or (a.*.s6_addr[@intCast(usize, @as(c_int, 0))] == @as(c_int, 0xfd))) {
    return (a.*.s6_addr[@intCast(usize, @as(c_int, 0))] == @as(c_int, 0xfc)) or (a.*.s6_addr[@intCast(usize, @as(c_int, 0))] == @as(c_int, 0xfd));
}
pub inline fn __IPV6_ADDR_MC_SCOPE(a: anytype) @TypeOf(a.*.s6_addr[@intCast(usize, @as(c_int, 1))] & @as(c_int, 0x0f)) {
    return a.*.s6_addr[@intCast(usize, @as(c_int, 1))] & @as(c_int, 0x0f);
}
pub inline fn IN6_IS_ADDR_MC_NODELOCAL(a: anytype) @TypeOf((IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_NODELOCAL)) {
    return (IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_NODELOCAL);
}
pub inline fn IN6_IS_ADDR_MC_LINKLOCAL(a: anytype) @TypeOf(((IN6_IS_ADDR_MULTICAST(a) != 0) and (IPV6_ADDR_MC_FLAGS(a) != IPV6_ADDR_MC_FLAGS_UNICAST_BASED)) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_LINKLOCAL)) {
    return ((IN6_IS_ADDR_MULTICAST(a) != 0) and (IPV6_ADDR_MC_FLAGS(a) != IPV6_ADDR_MC_FLAGS_UNICAST_BASED)) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_LINKLOCAL);
}
pub inline fn IN6_IS_ADDR_MC_SITELOCAL(a: anytype) @TypeOf((IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_SITELOCAL)) {
    return (IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_SITELOCAL);
}
pub inline fn IN6_IS_ADDR_MC_ORGLOCAL(a: anytype) @TypeOf((IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_ORGLOCAL)) {
    return (IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_ORGLOCAL);
}
pub inline fn IN6_IS_ADDR_MC_GLOBAL(a: anytype) @TypeOf((IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_GLOBAL)) {
    return (IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_GLOBAL);
}
pub const IPV6_SOCKOPT_RESERVED1 = @as(c_int, 3);
pub const IPV6_UNICAST_HOPS = @as(c_int, 4);
pub const IPV6_MULTICAST_IF = @as(c_int, 9);
pub const IPV6_MULTICAST_HOPS = @as(c_int, 10);
pub const IPV6_MULTICAST_LOOP = @as(c_int, 11);
pub const IPV6_JOIN_GROUP = @as(c_int, 12);
pub const IPV6_LEAVE_GROUP = @as(c_int, 13);
pub const IPV6_PORTRANGE = @as(c_int, 14);
pub const ICMP6_FILTER = @as(c_int, 18);
pub const IPV6_2292PKTINFO = @as(c_int, 19);
pub const IPV6_2292HOPLIMIT = @as(c_int, 20);
pub const IPV6_2292NEXTHOP = @as(c_int, 21);
pub const IPV6_2292HOPOPTS = @as(c_int, 22);
pub const IPV6_2292DSTOPTS = @as(c_int, 23);
pub const IPV6_2292RTHDR = @as(c_int, 24);
pub const IPV6_2292PKTOPTIONS = @as(c_int, 25);
pub const IPV6_CHECKSUM = @as(c_int, 26);
pub const IPV6_V6ONLY = @as(c_int, 27);
pub const IPV6_BINDV6ONLY = IPV6_V6ONLY;
pub const IPV6_IPSEC_POLICY = @as(c_int, 28);
pub const IPV6_FAITH = @as(c_int, 29);
pub const IPV6_FW_ADD = @as(c_int, 30);
pub const IPV6_FW_DEL = @as(c_int, 31);
pub const IPV6_FW_FLUSH = @as(c_int, 32);
pub const IPV6_FW_ZERO = @as(c_int, 33);
pub const IPV6_FW_GET = @as(c_int, 34);
pub const IPV6_RECVTCLASS = @as(c_int, 35);
pub const IPV6_TCLASS = @as(c_int, 36);
pub const IPV6_BOUND_IF = @as(c_int, 125);
pub const IPV6_RTHDR_LOOSE = @as(c_int, 0);
pub const IPV6_RTHDR_STRICT = @as(c_int, 1);
pub const IPV6_RTHDR_TYPE_0 = @as(c_int, 0);
pub const IPV6_DEFAULT_MULTICAST_HOPS = @as(c_int, 1);
pub const IPV6_DEFAULT_MULTICAST_LOOP = @as(c_int, 1);
pub const IPV6_MIN_MEMBERSHIPS = @as(c_int, 31);
pub const IPV6_MAX_MEMBERSHIPS = @as(c_int, 4095);
pub const IPV6_MAX_GROUP_SRC_FILTER = @as(c_int, 512);
pub const IPV6_MAX_SOCK_SRC_FILTER = @as(c_int, 128);
pub const IPV6_PORTRANGE_DEFAULT = @as(c_int, 0);
pub const IPV6_PORTRANGE_HIGH = @as(c_int, 1);
pub const IPV6_PORTRANGE_LOW = @as(c_int, 2);
pub const IPV6PROTO_MAXID = IPPROTO_PIM + @as(c_int, 1);
pub const IPV6CTL_FORWARDING = @as(c_int, 1);
pub const IPV6CTL_SENDREDIRECTS = @as(c_int, 2);
pub const IPV6CTL_DEFHLIM = @as(c_int, 3);
pub const IPV6CTL_FORWSRCRT = @as(c_int, 5);
pub const IPV6CTL_STATS = @as(c_int, 6);
pub const IPV6CTL_MRTSTATS = @as(c_int, 7);
pub const IPV6CTL_MRTPROTO = @as(c_int, 8);
pub const IPV6CTL_MAXFRAGPACKETS = @as(c_int, 9);
pub const IPV6CTL_SOURCECHECK = @as(c_int, 10);
pub const IPV6CTL_SOURCECHECK_LOGINT = @as(c_int, 11);
pub const IPV6CTL_ACCEPT_RTADV = @as(c_int, 12);
pub const IPV6CTL_KEEPFAITH = @as(c_int, 13);
pub const IPV6CTL_LOG_INTERVAL = @as(c_int, 14);
pub const IPV6CTL_HDRNESTLIMIT = @as(c_int, 15);
pub const IPV6CTL_DAD_COUNT = @as(c_int, 16);
pub const IPV6CTL_AUTO_FLOWLABEL = @as(c_int, 17);
pub const IPV6CTL_DEFMCASTHLIM = @as(c_int, 18);
pub const IPV6CTL_GIF_HLIM = @as(c_int, 19);
pub const IPV6CTL_KAME_VERSION = @as(c_int, 20);
pub const IPV6CTL_USE_DEPRECATED = @as(c_int, 21);
pub const IPV6CTL_RR_PRUNE = @as(c_int, 22);
pub const IPV6CTL_V6ONLY = @as(c_int, 24);
pub const IPV6CTL_RTEXPIRE = @as(c_int, 25);
pub const IPV6CTL_RTMINEXPIRE = @as(c_int, 26);
pub const IPV6CTL_RTMAXCACHE = @as(c_int, 27);
pub const IPV6CTL_USETEMPADDR = @as(c_int, 32);
pub const IPV6CTL_TEMPPLTIME = @as(c_int, 33);
pub const IPV6CTL_TEMPVLTIME = @as(c_int, 34);
pub const IPV6CTL_AUTO_LINKLOCAL = @as(c_int, 35);
pub const IPV6CTL_RIP6STATS = @as(c_int, 36);
pub const IPV6CTL_PREFER_TEMPADDR = @as(c_int, 37);
pub const IPV6CTL_ADDRCTLPOLICY = @as(c_int, 38);
pub const IPV6CTL_USE_DEFAULTZONE = @as(c_int, 39);
pub const IPV6CTL_MAXFRAGS = @as(c_int, 41);
pub const IPV6CTL_MCAST_PMTU = @as(c_int, 44);
pub const IPV6CTL_NEIGHBORGCTHRESH = @as(c_int, 46);
pub const IPV6CTL_MAXIFPREFIXES = @as(c_int, 47);
pub const IPV6CTL_MAXIFDEFROUTERS = @as(c_int, 48);
pub const IPV6CTL_MAXDYNROUTES = @as(c_int, 49);
pub const ICMPV6CTL_ND6_ONLINKNSRFC4861 = @as(c_int, 50);
pub const IPV6CTL_MAXID = @as(c_int, 51);
pub const _PATH_HEQUIV = "/etc/hosts.equiv";
pub const _PATH_HOSTS = "/etc/hosts";
pub const _PATH_NETWORKS = "/etc/networks";
pub const _PATH_PROTOCOLS = "/etc/protocols";
pub const _PATH_SERVICES = "/etc/services";
pub const NETDB_INTERNAL = -@as(c_int, 1);
pub const NETDB_SUCCESS = @as(c_int, 0);
pub const HOST_NOT_FOUND = @as(c_int, 1);
pub const TRY_AGAIN = @as(c_int, 2);
pub const NO_RECOVERY = @as(c_int, 3);
pub const NO_DATA = @as(c_int, 4);
pub const NO_ADDRESS = NO_DATA;
pub const EAI_ADDRFAMILY = @as(c_int, 1);
pub const EAI_AGAIN = @as(c_int, 2);
pub const EAI_BADFLAGS = @as(c_int, 3);
pub const EAI_FAIL = @as(c_int, 4);
pub const EAI_FAMILY = @as(c_int, 5);
pub const EAI_MEMORY = @as(c_int, 6);
pub const EAI_NODATA = @as(c_int, 7);
pub const EAI_NONAME = @as(c_int, 8);
pub const EAI_SERVICE = @as(c_int, 9);
pub const EAI_SOCKTYPE = @as(c_int, 10);
pub const EAI_SYSTEM = @as(c_int, 11);
pub const EAI_BADHINTS = @as(c_int, 12);
pub const EAI_PROTOCOL = @as(c_int, 13);
pub const EAI_OVERFLOW = @as(c_int, 14);
pub const EAI_MAX = @as(c_int, 15);
pub const AI_PASSIVE = @as(c_int, 0x00000001);
pub const AI_CANONNAME = @as(c_int, 0x00000002);
pub const AI_NUMERICHOST = @as(c_int, 0x00000004);
pub const AI_NUMERICSERV = @as(c_int, 0x00001000);
pub const AI_MASK = (((AI_PASSIVE | AI_CANONNAME) | AI_NUMERICHOST) | AI_NUMERICSERV) | AI_ADDRCONFIG;
pub const AI_ALL = @as(c_int, 0x00000100);
pub const AI_V4MAPPED_CFG = @as(c_int, 0x00000200);
pub const AI_ADDRCONFIG = @as(c_int, 0x00000400);
pub const AI_V4MAPPED = @as(c_int, 0x00000800);
pub const AI_DEFAULT = AI_V4MAPPED_CFG | AI_ADDRCONFIG;
pub const AI_UNUSABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hexadecimal);
pub const NI_MAXHOST = @as(c_int, 1025);
pub const NI_MAXSERV = @as(c_int, 32);
pub const NI_NOFQDN = @as(c_int, 0x00000001);
pub const NI_NUMERICHOST = @as(c_int, 0x00000002);
pub const NI_NAMEREQD = @as(c_int, 0x00000004);
pub const NI_NUMERICSERV = @as(c_int, 0x00000008);
pub const NI_NUMERICSCOPE = @as(c_int, 0x00000100);
pub const NI_DGRAM = @as(c_int, 0x00000010);
pub const NI_WITHSCOPEID = @as(c_int, 0x00000020);
pub const SCOPE_DELIMITER = '%';
pub const _NETINET_IP_H_ = "";
pub const _NETINET_IN_SYSTM_H_ = "";
pub const IPVERSION = @as(c_int, 4);
pub const IP_RF = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hexadecimal);
pub const IP_DF = @as(c_int, 0x4000);
pub const IP_MF = @as(c_int, 0x2000);
pub const IP_OFFMASK = @as(c_int, 0x1fff);
pub const IP_MAXPACKET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const IPTOS_LOWDELAY = @as(c_int, 0x10);
pub const IPTOS_THROUGHPUT = @as(c_int, 0x08);
pub const IPTOS_RELIABILITY = @as(c_int, 0x04);
pub const IPTOS_MINCOST = @as(c_int, 0x02);
pub const IPTOS_CE = @as(c_int, 0x01);
pub const IPTOS_ECT = @as(c_int, 0x02);
pub const IPTOS_DSCP_SHIFT = @as(c_int, 2);
pub const IPTOS_ECN_NOTECT = @as(c_int, 0x00);
pub const IPTOS_ECN_ECT1 = @as(c_int, 0x01);
pub const IPTOS_ECN_ECT0 = @as(c_int, 0x02);
pub const IPTOS_ECN_CE = @as(c_int, 0x03);
pub const IPTOS_ECN_MASK = @as(c_int, 0x03);
pub const IPTOS_PREC_NETCONTROL = @as(c_int, 0xe0);
pub const IPTOS_PREC_INTERNETCONTROL = @as(c_int, 0xc0);
pub const IPTOS_PREC_CRITIC_ECP = @as(c_int, 0xa0);
pub const IPTOS_PREC_FLASHOVERRIDE = @as(c_int, 0x80);
pub const IPTOS_PREC_FLASH = @as(c_int, 0x60);
pub const IPTOS_PREC_IMMEDIATE = @as(c_int, 0x40);
pub const IPTOS_PREC_PRIORITY = @as(c_int, 0x20);
pub const IPTOS_PREC_ROUTINE = @as(c_int, 0x00);
pub inline fn IPOPT_COPIED(o: anytype) @TypeOf(o & @as(c_int, 0x80)) {
    return o & @as(c_int, 0x80);
}
pub inline fn IPOPT_CLASS(o: anytype) @TypeOf(o & @as(c_int, 0x60)) {
    return o & @as(c_int, 0x60);
}
pub inline fn IPOPT_NUMBER(o: anytype) @TypeOf(o & @as(c_int, 0x1f)) {
    return o & @as(c_int, 0x1f);
}
pub const IPOPT_CONTROL = @as(c_int, 0x00);
pub const IPOPT_RESERVED1 = @as(c_int, 0x20);
pub const IPOPT_DEBMEAS = @as(c_int, 0x40);
pub const IPOPT_RESERVED2 = @as(c_int, 0x60);
pub const IPOPT_EOL = @as(c_int, 0);
pub const IPOPT_NOP = @as(c_int, 1);
pub const IPOPT_RR = @as(c_int, 7);
pub const IPOPT_TS = @as(c_int, 68);
pub const IPOPT_SECURITY = @as(c_int, 130);
pub const IPOPT_LSRR = @as(c_int, 131);
pub const IPOPT_SATID = @as(c_int, 136);
pub const IPOPT_SSRR = @as(c_int, 137);
pub const IPOPT_RA = @as(c_int, 148);
pub const IPOPT_OPTVAL = @as(c_int, 0);
pub const IPOPT_OLEN = @as(c_int, 1);
pub const IPOPT_OFFSET = @as(c_int, 2);
pub const IPOPT_MINOFF = @as(c_int, 4);
pub const IPOPT_TS_TSONLY = @as(c_int, 0);
pub const IPOPT_TS_TSANDADDR = @as(c_int, 1);
pub const IPOPT_TS_PRESPEC = @as(c_int, 3);
pub const IPOPT_SECUR_UNCLASS = @as(c_int, 0x0000);
pub const IPOPT_SECUR_CONFID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf135, .hexadecimal);
pub const IPOPT_SECUR_EFTO = @as(c_int, 0x789a);
pub const IPOPT_SECUR_MMMM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xbc4d, .hexadecimal);
pub const IPOPT_SECUR_RESTR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xaf13, .hexadecimal);
pub const IPOPT_SECUR_SECRET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xd788, .hexadecimal);
pub const IPOPT_SECUR_TOPSECRET = @as(c_int, 0x6bc5);
pub const MAXTTL = @as(c_int, 255);
pub const IPDEFTTL = @as(c_int, 64);
pub const IPFRAGTTL = @as(c_int, 30);
pub const IPTTLDEC = @as(c_int, 1);
pub const IP_MSS = @as(c_int, 576);
pub const _UNISTD_H_ = "";
pub const _SYS_UNISTD_H_ = "";
pub const _POSIX_VERSION = @as(c_long, 200112);
pub const _POSIX2_VERSION = @as(c_long, 200112);
pub const _POSIX_VDISABLE = @import("std").zig.c_translation.cast(u8, '\xff');
pub const _POSIX_THREAD_KEYS_MAX = @as(c_int, 128);
pub const F_OK = @as(c_int, 0);
pub const X_OK = @as(c_int, 1) << @as(c_int, 0);
pub const W_OK = @as(c_int, 1) << @as(c_int, 1);
pub const R_OK = @as(c_int, 1) << @as(c_int, 2);
pub const _READ_OK = @as(c_int, 1) << @as(c_int, 9);
pub const _WRITE_OK = @as(c_int, 1) << @as(c_int, 10);
pub const _EXECUTE_OK = @as(c_int, 1) << @as(c_int, 11);
pub const _DELETE_OK = @as(c_int, 1) << @as(c_int, 12);
pub const _APPEND_OK = @as(c_int, 1) << @as(c_int, 13);
pub const _RMFILE_OK = @as(c_int, 1) << @as(c_int, 14);
pub const _RATTR_OK = @as(c_int, 1) << @as(c_int, 15);
pub const _WATTR_OK = @as(c_int, 1) << @as(c_int, 16);
pub const _REXT_OK = @as(c_int, 1) << @as(c_int, 17);
pub const _WEXT_OK = @as(c_int, 1) << @as(c_int, 18);
pub const _RPERM_OK = @as(c_int, 1) << @as(c_int, 19);
pub const _WPERM_OK = @as(c_int, 1) << @as(c_int, 20);
pub const _CHOWN_OK = @as(c_int, 1) << @as(c_int, 21);
pub const _ACCESS_EXTENDED_MASK = (((((((((((_READ_OK | _WRITE_OK) | _EXECUTE_OK) | _DELETE_OK) | _APPEND_OK) | _RMFILE_OK) | _REXT_OK) | _WEXT_OK) | _RATTR_OK) | _WATTR_OK) | _RPERM_OK) | _WPERM_OK) | _CHOWN_OK;
pub const SEEK_HOLE = @as(c_int, 3);
pub const SEEK_DATA = @as(c_int, 4);
pub const L_SET = SEEK_SET;
pub const L_INCR = SEEK_CUR;
pub const L_XTND = SEEK_END;
pub const ACCESSX_MAX_DESCRIPTORS = @as(c_int, 100);
pub const ACCESSX_MAX_TABLESIZE = @as(c_int, 16) * @as(c_int, 1024);
pub const _PC_LINK_MAX = @as(c_int, 1);
pub const _PC_MAX_CANON = @as(c_int, 2);
pub const _PC_MAX_INPUT = @as(c_int, 3);
pub const _PC_NAME_MAX = @as(c_int, 4);
pub const _PC_PATH_MAX = @as(c_int, 5);
pub const _PC_PIPE_BUF = @as(c_int, 6);
pub const _PC_CHOWN_RESTRICTED = @as(c_int, 7);
pub const _PC_NO_TRUNC = @as(c_int, 8);
pub const _PC_VDISABLE = @as(c_int, 9);
pub const _PC_NAME_CHARS_MAX = @as(c_int, 10);
pub const _PC_CASE_SENSITIVE = @as(c_int, 11);
pub const _PC_CASE_PRESERVING = @as(c_int, 12);
pub const _PC_EXTENDED_SECURITY_NP = @as(c_int, 13);
pub const _PC_AUTH_OPAQUE_NP = @as(c_int, 14);
pub const _PC_2_SYMLINKS = @as(c_int, 15);
pub const _PC_ALLOC_SIZE_MIN = @as(c_int, 16);
pub const _PC_ASYNC_IO = @as(c_int, 17);
pub const _PC_FILESIZEBITS = @as(c_int, 18);
pub const _PC_PRIO_IO = @as(c_int, 19);
pub const _PC_REC_INCR_XFER_SIZE = @as(c_int, 20);
pub const _PC_REC_MAX_XFER_SIZE = @as(c_int, 21);
pub const _PC_REC_MIN_XFER_SIZE = @as(c_int, 22);
pub const _PC_REC_XFER_ALIGN = @as(c_int, 23);
pub const _PC_SYMLINK_MAX = @as(c_int, 24);
pub const _PC_SYNC_IO = @as(c_int, 25);
pub const _PC_XATTR_SIZE_BITS = @as(c_int, 26);
pub const _PC_MIN_HOLE_SIZE = @as(c_int, 27);
pub const _CS_PATH = @as(c_int, 1);
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const _XOPEN_VERSION = @as(c_int, 600);
pub const _XOPEN_XCU_VERSION = @as(c_int, 4);
pub const _POSIX_ADVISORY_INFO = -@as(c_int, 1);
pub const _POSIX_ASYNCHRONOUS_IO = -@as(c_int, 1);
pub const _POSIX_BARRIERS = -@as(c_int, 1);
pub const _POSIX_CHOWN_RESTRICTED = @as(c_long, 200112);
pub const _POSIX_CLOCK_SELECTION = -@as(c_int, 1);
pub const _POSIX_CPUTIME = -@as(c_int, 1);
pub const _POSIX_FSYNC = @as(c_long, 200112);
pub const _POSIX_IPV6 = @as(c_long, 200112);
pub const _POSIX_JOB_CONTROL = @as(c_long, 200112);
pub const _POSIX_MAPPED_FILES = @as(c_long, 200112);
pub const _POSIX_MEMLOCK = -@as(c_int, 1);
pub const _POSIX_MEMLOCK_RANGE = -@as(c_int, 1);
pub const _POSIX_MEMORY_PROTECTION = @as(c_long, 200112);
pub const _POSIX_MESSAGE_PASSING = -@as(c_int, 1);
pub const _POSIX_MONOTONIC_CLOCK = -@as(c_int, 1);
pub const _POSIX_NO_TRUNC = @as(c_long, 200112);
pub const _POSIX_PRIORITIZED_IO = -@as(c_int, 1);
pub const _POSIX_PRIORITY_SCHEDULING = -@as(c_int, 1);
pub const _POSIX_RAW_SOCKETS = -@as(c_int, 1);
pub const _POSIX_READER_WRITER_LOCKS = @as(c_long, 200112);
pub const _POSIX_REALTIME_SIGNALS = -@as(c_int, 1);
pub const _POSIX_REGEXP = @as(c_long, 200112);
pub const _POSIX_SAVED_IDS = @as(c_long, 200112);
pub const _POSIX_SEMAPHORES = -@as(c_int, 1);
pub const _POSIX_SHARED_MEMORY_OBJECTS = -@as(c_int, 1);
pub const _POSIX_SHELL = @as(c_long, 200112);
pub const _POSIX_SPAWN = -@as(c_int, 1);
pub const _POSIX_SPIN_LOCKS = -@as(c_int, 1);
pub const _POSIX_SPORADIC_SERVER = -@as(c_int, 1);
pub const _POSIX_SYNCHRONIZED_IO = -@as(c_int, 1);
pub const _POSIX_THREAD_ATTR_STACKADDR = @as(c_long, 200112);
pub const _POSIX_THREAD_ATTR_STACKSIZE = @as(c_long, 200112);
pub const _POSIX_THREAD_CPUTIME = -@as(c_int, 1);
pub const _POSIX_THREAD_PRIO_INHERIT = -@as(c_int, 1);
pub const _POSIX_THREAD_PRIO_PROTECT = -@as(c_int, 1);
pub const _POSIX_THREAD_PRIORITY_SCHEDULING = -@as(c_int, 1);
pub const _POSIX_THREAD_PROCESS_SHARED = @as(c_long, 200112);
pub const _POSIX_THREAD_SAFE_FUNCTIONS = @as(c_long, 200112);
pub const _POSIX_THREAD_SPORADIC_SERVER = -@as(c_int, 1);
pub const _POSIX_THREADS = @as(c_long, 200112);
pub const _POSIX_TIMEOUTS = -@as(c_int, 1);
pub const _POSIX_TIMERS = -@as(c_int, 1);
pub const _POSIX_TRACE = -@as(c_int, 1);
pub const _POSIX_TRACE_EVENT_FILTER = -@as(c_int, 1);
pub const _POSIX_TRACE_INHERIT = -@as(c_int, 1);
pub const _POSIX_TRACE_LOG = -@as(c_int, 1);
pub const _POSIX_TYPED_MEMORY_OBJECTS = -@as(c_int, 1);
pub const _POSIX2_C_BIND = @as(c_long, 200112);
pub const _POSIX2_C_DEV = @as(c_long, 200112);
pub const _POSIX2_CHAR_TERM = @as(c_long, 200112);
pub const _POSIX2_FORT_DEV = -@as(c_int, 1);
pub const _POSIX2_FORT_RUN = @as(c_long, 200112);
pub const _POSIX2_LOCALEDEF = @as(c_long, 200112);
pub const _POSIX2_PBS = -@as(c_int, 1);
pub const _POSIX2_PBS_ACCOUNTING = -@as(c_int, 1);
pub const _POSIX2_PBS_CHECKPOINT = -@as(c_int, 1);
pub const _POSIX2_PBS_LOCATE = -@as(c_int, 1);
pub const _POSIX2_PBS_MESSAGE = -@as(c_int, 1);
pub const _POSIX2_PBS_TRACK = -@as(c_int, 1);
pub const _POSIX2_SW_DEV = @as(c_long, 200112);
pub const _POSIX2_UPE = @as(c_long, 200112);
pub const __ILP32_OFF32 = -@as(c_int, 1);
pub const __ILP32_OFFBIG = -@as(c_int, 1);
pub const __LP64_OFF64 = @as(c_int, 1);
pub const __LPBIG_OFFBIG = @as(c_int, 1);
pub const _POSIX_V6_ILP32_OFF32 = __ILP32_OFF32;
pub const _POSIX_V6_ILP32_OFFBIG = __ILP32_OFFBIG;
pub const _POSIX_V6_LP64_OFF64 = __LP64_OFF64;
pub const _POSIX_V6_LPBIG_OFFBIG = __LPBIG_OFFBIG;
pub const _POSIX_V7_ILP32_OFF32 = __ILP32_OFF32;
pub const _POSIX_V7_ILP32_OFFBIG = __ILP32_OFFBIG;
pub const _POSIX_V7_LP64_OFF64 = __LP64_OFF64;
pub const _POSIX_V7_LPBIG_OFFBIG = __LPBIG_OFFBIG;
pub const _V6_ILP32_OFF32 = __ILP32_OFF32;
pub const _V6_ILP32_OFFBIG = __ILP32_OFFBIG;
pub const _V6_LP64_OFF64 = __LP64_OFF64;
pub const _V6_LPBIG_OFFBIG = __LPBIG_OFFBIG;
pub const _XBS5_ILP32_OFF32 = __ILP32_OFF32;
pub const _XBS5_ILP32_OFFBIG = __ILP32_OFFBIG;
pub const _XBS5_LP64_OFF64 = __LP64_OFF64;
pub const _XBS5_LPBIG_OFFBIG = __LPBIG_OFFBIG;
pub const _XOPEN_CRYPT = @as(c_int, 1);
pub const _XOPEN_ENH_I18N = @as(c_int, 1);
pub const _XOPEN_LEGACY = -@as(c_int, 1);
pub const _XOPEN_REALTIME = -@as(c_int, 1);
pub const _XOPEN_REALTIME_THREADS = -@as(c_int, 1);
pub const _XOPEN_SHM = @as(c_int, 1);
pub const _XOPEN_STREAMS = -@as(c_int, 1);
pub const _XOPEN_UNIX = @as(c_int, 1);
pub const _SC_ARG_MAX = @as(c_int, 1);
pub const _SC_CHILD_MAX = @as(c_int, 2);
pub const _SC_CLK_TCK = @as(c_int, 3);
pub const _SC_NGROUPS_MAX = @as(c_int, 4);
pub const _SC_OPEN_MAX = @as(c_int, 5);
pub const _SC_JOB_CONTROL = @as(c_int, 6);
pub const _SC_SAVED_IDS = @as(c_int, 7);
pub const _SC_VERSION = @as(c_int, 8);
pub const _SC_BC_BASE_MAX = @as(c_int, 9);
pub const _SC_BC_DIM_MAX = @as(c_int, 10);
pub const _SC_BC_SCALE_MAX = @as(c_int, 11);
pub const _SC_BC_STRING_MAX = @as(c_int, 12);
pub const _SC_COLL_WEIGHTS_MAX = @as(c_int, 13);
pub const _SC_EXPR_NEST_MAX = @as(c_int, 14);
pub const _SC_LINE_MAX = @as(c_int, 15);
pub const _SC_RE_DUP_MAX = @as(c_int, 16);
pub const _SC_2_VERSION = @as(c_int, 17);
pub const _SC_2_C_BIND = @as(c_int, 18);
pub const _SC_2_C_DEV = @as(c_int, 19);
pub const _SC_2_CHAR_TERM = @as(c_int, 20);
pub const _SC_2_FORT_DEV = @as(c_int, 21);
pub const _SC_2_FORT_RUN = @as(c_int, 22);
pub const _SC_2_LOCALEDEF = @as(c_int, 23);
pub const _SC_2_SW_DEV = @as(c_int, 24);
pub const _SC_2_UPE = @as(c_int, 25);
pub const _SC_STREAM_MAX = @as(c_int, 26);
pub const _SC_TZNAME_MAX = @as(c_int, 27);
pub const _SC_ASYNCHRONOUS_IO = @as(c_int, 28);
pub const _SC_PAGESIZE = @as(c_int, 29);
pub const _SC_MEMLOCK = @as(c_int, 30);
pub const _SC_MEMLOCK_RANGE = @as(c_int, 31);
pub const _SC_MEMORY_PROTECTION = @as(c_int, 32);
pub const _SC_MESSAGE_PASSING = @as(c_int, 33);
pub const _SC_PRIORITIZED_IO = @as(c_int, 34);
pub const _SC_PRIORITY_SCHEDULING = @as(c_int, 35);
pub const _SC_REALTIME_SIGNALS = @as(c_int, 36);
pub const _SC_SEMAPHORES = @as(c_int, 37);
pub const _SC_FSYNC = @as(c_int, 38);
pub const _SC_SHARED_MEMORY_OBJECTS = @as(c_int, 39);
pub const _SC_SYNCHRONIZED_IO = @as(c_int, 40);
pub const _SC_TIMERS = @as(c_int, 41);
pub const _SC_AIO_LISTIO_MAX = @as(c_int, 42);
pub const _SC_AIO_MAX = @as(c_int, 43);
pub const _SC_AIO_PRIO_DELTA_MAX = @as(c_int, 44);
pub const _SC_DELAYTIMER_MAX = @as(c_int, 45);
pub const _SC_MQ_OPEN_MAX = @as(c_int, 46);
pub const _SC_MAPPED_FILES = @as(c_int, 47);
pub const _SC_RTSIG_MAX = @as(c_int, 48);
pub const _SC_SEM_NSEMS_MAX = @as(c_int, 49);
pub const _SC_SEM_VALUE_MAX = @as(c_int, 50);
pub const _SC_SIGQUEUE_MAX = @as(c_int, 51);
pub const _SC_TIMER_MAX = @as(c_int, 52);
pub const _SC_NPROCESSORS_CONF = @as(c_int, 57);
pub const _SC_NPROCESSORS_ONLN = @as(c_int, 58);
pub const _SC_2_PBS = @as(c_int, 59);
pub const _SC_2_PBS_ACCOUNTING = @as(c_int, 60);
pub const _SC_2_PBS_CHECKPOINT = @as(c_int, 61);
pub const _SC_2_PBS_LOCATE = @as(c_int, 62);
pub const _SC_2_PBS_MESSAGE = @as(c_int, 63);
pub const _SC_2_PBS_TRACK = @as(c_int, 64);
pub const _SC_ADVISORY_INFO = @as(c_int, 65);
pub const _SC_BARRIERS = @as(c_int, 66);
pub const _SC_CLOCK_SELECTION = @as(c_int, 67);
pub const _SC_CPUTIME = @as(c_int, 68);
pub const _SC_FILE_LOCKING = @as(c_int, 69);
pub const _SC_GETGR_R_SIZE_MAX = @as(c_int, 70);
pub const _SC_GETPW_R_SIZE_MAX = @as(c_int, 71);
pub const _SC_HOST_NAME_MAX = @as(c_int, 72);
pub const _SC_LOGIN_NAME_MAX = @as(c_int, 73);
pub const _SC_MONOTONIC_CLOCK = @as(c_int, 74);
pub const _SC_MQ_PRIO_MAX = @as(c_int, 75);
pub const _SC_READER_WRITER_LOCKS = @as(c_int, 76);
pub const _SC_REGEXP = @as(c_int, 77);
pub const _SC_SHELL = @as(c_int, 78);
pub const _SC_SPAWN = @as(c_int, 79);
pub const _SC_SPIN_LOCKS = @as(c_int, 80);
pub const _SC_SPORADIC_SERVER = @as(c_int, 81);
pub const _SC_THREAD_ATTR_STACKADDR = @as(c_int, 82);
pub const _SC_THREAD_ATTR_STACKSIZE = @as(c_int, 83);
pub const _SC_THREAD_CPUTIME = @as(c_int, 84);
pub const _SC_THREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 85);
pub const _SC_THREAD_KEYS_MAX = @as(c_int, 86);
pub const _SC_THREAD_PRIO_INHERIT = @as(c_int, 87);
pub const _SC_THREAD_PRIO_PROTECT = @as(c_int, 88);
pub const _SC_THREAD_PRIORITY_SCHEDULING = @as(c_int, 89);
pub const _SC_THREAD_PROCESS_SHARED = @as(c_int, 90);
pub const _SC_THREAD_SAFE_FUNCTIONS = @as(c_int, 91);
pub const _SC_THREAD_SPORADIC_SERVER = @as(c_int, 92);
pub const _SC_THREAD_STACK_MIN = @as(c_int, 93);
pub const _SC_THREAD_THREADS_MAX = @as(c_int, 94);
pub const _SC_TIMEOUTS = @as(c_int, 95);
pub const _SC_THREADS = @as(c_int, 96);
pub const _SC_TRACE = @as(c_int, 97);
pub const _SC_TRACE_EVENT_FILTER = @as(c_int, 98);
pub const _SC_TRACE_INHERIT = @as(c_int, 99);
pub const _SC_TRACE_LOG = @as(c_int, 100);
pub const _SC_TTY_NAME_MAX = @as(c_int, 101);
pub const _SC_TYPED_MEMORY_OBJECTS = @as(c_int, 102);
pub const _SC_V6_ILP32_OFF32 = @as(c_int, 103);
pub const _SC_V6_ILP32_OFFBIG = @as(c_int, 104);
pub const _SC_V6_LP64_OFF64 = @as(c_int, 105);
pub const _SC_V6_LPBIG_OFFBIG = @as(c_int, 106);
pub const _SC_IPV6 = @as(c_int, 118);
pub const _SC_RAW_SOCKETS = @as(c_int, 119);
pub const _SC_SYMLOOP_MAX = @as(c_int, 120);
pub const _SC_ATEXIT_MAX = @as(c_int, 107);
pub const _SC_IOV_MAX = @as(c_int, 56);
pub const _SC_PAGE_SIZE = _SC_PAGESIZE;
pub const _SC_XOPEN_CRYPT = @as(c_int, 108);
pub const _SC_XOPEN_ENH_I18N = @as(c_int, 109);
pub const _SC_XOPEN_LEGACY = @as(c_int, 110);
pub const _SC_XOPEN_REALTIME = @as(c_int, 111);
pub const _SC_XOPEN_REALTIME_THREADS = @as(c_int, 112);
pub const _SC_XOPEN_SHM = @as(c_int, 113);
pub const _SC_XOPEN_STREAMS = @as(c_int, 114);
pub const _SC_XOPEN_UNIX = @as(c_int, 115);
pub const _SC_XOPEN_VERSION = @as(c_int, 116);
pub const _SC_XOPEN_XCU_VERSION = @as(c_int, 121);
pub const _SC_XBS5_ILP32_OFF32 = @as(c_int, 122);
pub const _SC_XBS5_ILP32_OFFBIG = @as(c_int, 123);
pub const _SC_XBS5_LP64_OFF64 = @as(c_int, 124);
pub const _SC_XBS5_LPBIG_OFFBIG = @as(c_int, 125);
pub const _SC_SS_REPL_MAX = @as(c_int, 126);
pub const _SC_TRACE_EVENT_NAME_MAX = @as(c_int, 127);
pub const _SC_TRACE_NAME_MAX = @as(c_int, 128);
pub const _SC_TRACE_SYS_MAX = @as(c_int, 129);
pub const _SC_TRACE_USER_EVENT_MAX = @as(c_int, 130);
pub const _SC_PASS_MAX = @as(c_int, 131);
pub const _SC_PHYS_PAGES = @as(c_int, 200);
pub const _CS_POSIX_V6_ILP32_OFF32_CFLAGS = @as(c_int, 2);
pub const _CS_POSIX_V6_ILP32_OFF32_LDFLAGS = @as(c_int, 3);
pub const _CS_POSIX_V6_ILP32_OFF32_LIBS = @as(c_int, 4);
pub const _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS = @as(c_int, 5);
pub const _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS = @as(c_int, 6);
pub const _CS_POSIX_V6_ILP32_OFFBIG_LIBS = @as(c_int, 7);
pub const _CS_POSIX_V6_LP64_OFF64_CFLAGS = @as(c_int, 8);
pub const _CS_POSIX_V6_LP64_OFF64_LDFLAGS = @as(c_int, 9);
pub const _CS_POSIX_V6_LP64_OFF64_LIBS = @as(c_int, 10);
pub const _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS = @as(c_int, 11);
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS = @as(c_int, 12);
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LIBS = @as(c_int, 13);
pub const _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS = @as(c_int, 14);
pub const _CS_XBS5_ILP32_OFF32_CFLAGS = @as(c_int, 20);
pub const _CS_XBS5_ILP32_OFF32_LDFLAGS = @as(c_int, 21);
pub const _CS_XBS5_ILP32_OFF32_LIBS = @as(c_int, 22);
pub const _CS_XBS5_ILP32_OFF32_LINTFLAGS = @as(c_int, 23);
pub const _CS_XBS5_ILP32_OFFBIG_CFLAGS = @as(c_int, 24);
pub const _CS_XBS5_ILP32_OFFBIG_LDFLAGS = @as(c_int, 25);
pub const _CS_XBS5_ILP32_OFFBIG_LIBS = @as(c_int, 26);
pub const _CS_XBS5_ILP32_OFFBIG_LINTFLAGS = @as(c_int, 27);
pub const _CS_XBS5_LP64_OFF64_CFLAGS = @as(c_int, 28);
pub const _CS_XBS5_LP64_OFF64_LDFLAGS = @as(c_int, 29);
pub const _CS_XBS5_LP64_OFF64_LIBS = @as(c_int, 30);
pub const _CS_XBS5_LP64_OFF64_LINTFLAGS = @as(c_int, 31);
pub const _CS_XBS5_LPBIG_OFFBIG_CFLAGS = @as(c_int, 32);
pub const _CS_XBS5_LPBIG_OFFBIG_LDFLAGS = @as(c_int, 33);
pub const _CS_XBS5_LPBIG_OFFBIG_LIBS = @as(c_int, 34);
pub const _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS = @as(c_int, 35);
pub const _CS_DARWIN_USER_DIR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub const _CS_DARWIN_USER_TEMP_DIR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65537, .decimal);
pub const _CS_DARWIN_USER_CACHE_DIR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65538, .decimal);
pub const F_ULOCK = @as(c_int, 0);
pub const F_LOCK = @as(c_int, 1);
pub const F_TLOCK = @as(c_int, 2);
pub const F_TEST = @as(c_int, 3);
pub const _SYS_SELECT_H_ = "";
pub const _STRUCT_TIMESPEC = struct_timespec;
pub const _SYS__SELECT_H_ = "";
pub const _UUID_T = "";
pub const __GETHOSTUUID_H = "";
pub const SYNC_VOLUME_FULLSYNC = @as(c_int, 0x01);
pub const SYNC_VOLUME_WAIT = @as(c_int, 0x02);
pub const _ARPA_INET_H_ = "";
pub const _SYS_ERRNO_H_ = "";
pub const errno = __error().*;
pub const EPERM = @as(c_int, 1);
pub const ENOENT = @as(c_int, 2);
pub const ESRCH = @as(c_int, 3);
pub const EINTR = @as(c_int, 4);
pub const EIO = @as(c_int, 5);
pub const ENXIO = @as(c_int, 6);
pub const E2BIG = @as(c_int, 7);
pub const ENOEXEC = @as(c_int, 8);
pub const EBADF = @as(c_int, 9);
pub const ECHILD = @as(c_int, 10);
pub const EDEADLK = @as(c_int, 11);
pub const ENOMEM = @as(c_int, 12);
pub const EACCES = @as(c_int, 13);
pub const EFAULT = @as(c_int, 14);
pub const ENOTBLK = @as(c_int, 15);
pub const EBUSY = @as(c_int, 16);
pub const EEXIST = @as(c_int, 17);
pub const EXDEV = @as(c_int, 18);
pub const ENODEV = @as(c_int, 19);
pub const ENOTDIR = @as(c_int, 20);
pub const EISDIR = @as(c_int, 21);
pub const EINVAL = @as(c_int, 22);
pub const ENFILE = @as(c_int, 23);
pub const EMFILE = @as(c_int, 24);
pub const ENOTTY = @as(c_int, 25);
pub const ETXTBSY = @as(c_int, 26);
pub const EFBIG = @as(c_int, 27);
pub const ENOSPC = @as(c_int, 28);
pub const ESPIPE = @as(c_int, 29);
pub const EROFS = @as(c_int, 30);
pub const EMLINK = @as(c_int, 31);
pub const EPIPE = @as(c_int, 32);
pub const EDOM = @as(c_int, 33);
pub const ERANGE = @as(c_int, 34);
pub const EAGAIN = @as(c_int, 35);
pub const EWOULDBLOCK = EAGAIN;
pub const EINPROGRESS = @as(c_int, 36);
pub const EALREADY = @as(c_int, 37);
pub const ENOTSOCK = @as(c_int, 38);
pub const EDESTADDRREQ = @as(c_int, 39);
pub const EMSGSIZE = @as(c_int, 40);
pub const EPROTOTYPE = @as(c_int, 41);
pub const ENOPROTOOPT = @as(c_int, 42);
pub const EPROTONOSUPPORT = @as(c_int, 43);
pub const ESOCKTNOSUPPORT = @as(c_int, 44);
pub const ENOTSUP = @as(c_int, 45);
pub const EPFNOSUPPORT = @as(c_int, 46);
pub const EAFNOSUPPORT = @as(c_int, 47);
pub const EADDRINUSE = @as(c_int, 48);
pub const EADDRNOTAVAIL = @as(c_int, 49);
pub const ENETDOWN = @as(c_int, 50);
pub const ENETUNREACH = @as(c_int, 51);
pub const ENETRESET = @as(c_int, 52);
pub const ECONNABORTED = @as(c_int, 53);
pub const ECONNRESET = @as(c_int, 54);
pub const ENOBUFS = @as(c_int, 55);
pub const EISCONN = @as(c_int, 56);
pub const ENOTCONN = @as(c_int, 57);
pub const ESHUTDOWN = @as(c_int, 58);
pub const ETOOMANYREFS = @as(c_int, 59);
pub const ETIMEDOUT = @as(c_int, 60);
pub const ECONNREFUSED = @as(c_int, 61);
pub const ELOOP = @as(c_int, 62);
pub const ENAMETOOLONG = @as(c_int, 63);
pub const EHOSTDOWN = @as(c_int, 64);
pub const EHOSTUNREACH = @as(c_int, 65);
pub const ENOTEMPTY = @as(c_int, 66);
pub const EPROCLIM = @as(c_int, 67);
pub const EUSERS = @as(c_int, 68);
pub const EDQUOT = @as(c_int, 69);
pub const ESTALE = @as(c_int, 70);
pub const EREMOTE = @as(c_int, 71);
pub const EBADRPC = @as(c_int, 72);
pub const ERPCMISMATCH = @as(c_int, 73);
pub const EPROGUNAVAIL = @as(c_int, 74);
pub const EPROGMISMATCH = @as(c_int, 75);
pub const EPROCUNAVAIL = @as(c_int, 76);
pub const ENOLCK = @as(c_int, 77);
pub const ENOSYS = @as(c_int, 78);
pub const EFTYPE = @as(c_int, 79);
pub const EAUTH = @as(c_int, 80);
pub const ENEEDAUTH = @as(c_int, 81);
pub const EPWROFF = @as(c_int, 82);
pub const EDEVERR = @as(c_int, 83);
pub const EOVERFLOW = @as(c_int, 84);
pub const EBADEXEC = @as(c_int, 85);
pub const EBADARCH = @as(c_int, 86);
pub const ESHLIBVERS = @as(c_int, 87);
pub const EBADMACHO = @as(c_int, 88);
pub const ECANCELED = @as(c_int, 89);
pub const EIDRM = @as(c_int, 90);
pub const ENOMSG = @as(c_int, 91);
pub const EILSEQ = @as(c_int, 92);
pub const ENOATTR = @as(c_int, 93);
pub const EBADMSG = @as(c_int, 94);
pub const EMULTIHOP = @as(c_int, 95);
pub const ENODATA = @as(c_int, 96);
pub const ENOLINK = @as(c_int, 97);
pub const ENOSR = @as(c_int, 98);
pub const ENOSTR = @as(c_int, 99);
pub const EPROTO = @as(c_int, 100);
pub const ETIME = @as(c_int, 101);
pub const EOPNOTSUPP = @as(c_int, 102);
pub const ENOPOLICY = @as(c_int, 103);
pub const ENOTRECOVERABLE = @as(c_int, 104);
pub const EOWNERDEAD = @as(c_int, 105);
pub const EQFULL = @as(c_int, 106);
pub const ELAST = @as(c_int, 106);
pub const _SAL_STUB_H = "";
pub const _Must_inspect_result_ = "";
pub const _Pre_defensive_ = "";
pub const _Ret_notnull_ = "";
pub const _In_ = "";
pub const _In_opt_ = "";
pub const _In_opt_z_ = "";
pub const _Inout_ = "";
pub const _Inout_opt_ = "";
pub const _In_z_ = "";
pub const _Out_ = "";
pub const _Null_terminated_ = "";
pub const _NullNull_terminated_ = "";
pub const _Out_opt_ = "";
pub const _Outptr_ = "";
pub const _Ret_maybenull_ = "";
pub const _Post_invalid_ = "";
pub const __drv_aliasesMem = "";
pub const _Frees_ptr_ = "";
pub const _Frees_ptr_opt_ = "";
pub const _Field_z_ = "";
pub const _Printf_format_string_ = "";
pub const _Interlocked_operand_ = "";
pub const _Check_return_ = "";
pub const QUIC_API = "";
pub const QUIC_MAIN_EXPORT = "";
pub const QUIC_STATUS = c_uint;
pub inline fn QUIC_FAILED(X: anytype) @TypeOf(@import("std").zig.c_translation.cast(c_int, X) > @as(c_int, 0)) {
    return @import("std").zig.c_translation.cast(c_int, X) > @as(c_int, 0);
}
pub inline fn QUIC_SUCCEEDED(X: anytype) @TypeOf(@import("std").zig.c_translation.cast(c_int, X) <= @as(c_int, 0)) {
    return @import("std").zig.c_translation.cast(c_int, X) <= @as(c_int, 0);
}
pub const ESTRPIPE = @as(c_int, 86);
pub const ENOKEY = @as(c_int, 126);
pub const ERROR_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 200000000, .decimal);
pub const TLS_ERROR_BASE = @as(c_int, 256) + ERROR_BASE;
pub const CERT_ERROR_BASE = @as(c_int, 512) + ERROR_BASE;
pub const QUIC_STATUS_PENDING = QUIC_STATUS - @as(c_int, 2);
pub const QUIC_STATUS_CONTINUE = QUIC_STATUS - @as(c_int, 1);
pub const QUIC_STATUS_OUT_OF_MEMORY = QUIC_STATUS ++ ENOMEM;
pub const QUIC_STATUS_INVALID_PARAMETER = QUIC_STATUS ++ EINVAL;
pub const QUIC_STATUS_INVALID_STATE = QUIC_STATUS ++ EPERM;
pub const QUIC_STATUS_NOT_SUPPORTED = QUIC_STATUS ++ EOPNOTSUPP;
pub const QUIC_STATUS_NOT_FOUND = QUIC_STATUS ++ ENOENT;
pub const QUIC_STATUS_BUFFER_TOO_SMALL = QUIC_STATUS ++ EOVERFLOW;
pub const QUIC_STATUS_HANDSHAKE_FAILURE = QUIC_STATUS ++ ECONNABORTED;
pub const QUIC_STATUS_ABORTED = QUIC_STATUS ++ ECANCELED;
pub const QUIC_STATUS_ADDRESS_IN_USE = QUIC_STATUS ++ EADDRINUSE;
pub const QUIC_STATUS_INVALID_ADDRESS = QUIC_STATUS ++ EAFNOSUPPORT;
pub const QUIC_STATUS_CONNECTION_TIMEOUT = QUIC_STATUS ++ ETIMEDOUT;
pub const QUIC_STATUS_CONNECTION_IDLE = QUIC_STATUS ++ ETIME;
pub const QUIC_STATUS_INTERNAL_ERROR = QUIC_STATUS ++ EIO;
pub const QUIC_STATUS_CONNECTION_REFUSED = QUIC_STATUS ++ ECONNREFUSED;
pub const QUIC_STATUS_PROTOCOL_ERROR = QUIC_STATUS ++ EPROTO;
pub const QUIC_STATUS_VER_NEG_ERROR = QUIC_STATUS ++ EPROTONOSUPPORT;
pub const QUIC_STATUS_UNREACHABLE = QUIC_STATUS ++ EHOSTUNREACH;
pub const QUIC_STATUS_TLS_ERROR = QUIC_STATUS ++ ENOKEY;
pub const QUIC_STATUS_USER_CANCELED = QUIC_STATUS ++ EOWNERDEAD;
pub const QUIC_STATUS_ALPN_NEG_FAILURE = QUIC_STATUS ++ ENOPROTOOPT;
pub const QUIC_STATUS_STREAM_LIMIT_REACHED = QUIC_STATUS ++ ESTRPIPE;
pub inline fn QUIC_STATUS_TLS_ALERT(Alert: anytype) @TypeOf(QUIC_STATUS(@as(c_int, 0xff) & Alert) + TLS_ERROR_BASE) {
    return QUIC_STATUS(@as(c_int, 0xff) & Alert) + TLS_ERROR_BASE;
}
pub const QUIC_STATUS_CLOSE_NOTIFY = QUIC_STATUS_TLS_ALERT(@as(c_int, 0));
pub const QUIC_STATUS_BAD_CERTIFICATE = QUIC_STATUS_TLS_ALERT(@as(c_int, 42));
pub const QUIC_STATUS_UNSUPPORTED_CERTIFICATE = QUIC_STATUS_TLS_ALERT(@as(c_int, 43));
pub const QUIC_STATUS_REVOKED_CERTIFICATE = QUIC_STATUS_TLS_ALERT(@as(c_int, 44));
pub const QUIC_STATUS_EXPIRED_CERTIFICATE = QUIC_STATUS_TLS_ALERT(@as(c_int, 45));
pub const QUIC_STATUS_UNKNOWN_CERTIFICATE = QUIC_STATUS_TLS_ALERT(@as(c_int, 46));
pub const QUIC_STATUS_REQUIRED_CERTIFICATE = QUIC_STATUS_TLS_ALERT(@as(c_int, 116));
pub inline fn QUIC_STATUS_CERT_ERROR(Val: anytype) @TypeOf((QUIC_STATUS ++ Val) + CERT_ERROR_BASE) {
    return (QUIC_STATUS ++ Val) + CERT_ERROR_BASE;
}
pub const QUIC_STATUS_CERT_EXPIRED = QUIC_STATUS_CERT_ERROR(@as(c_int, 1));
pub const QUIC_STATUS_CERT_UNTRUSTED_ROOT = QUIC_STATUS_CERT_ERROR(@as(c_int, 2));
pub const QUIC_ADDRESS_FAMILY_UNSPEC = AF_UNSPEC;
pub const QUIC_ADDRESS_FAMILY_INET = AF_INET;
pub const QUIC_ADDRESS_FAMILY_INET6 = AF_INET6;
pub inline fn FIELD_OFFSET(@"type": anytype, field: anytype) @TypeOf(offsetof(@"type", field)) {
    return offsetof(@"type", field);
}
pub const FALSE = @as(c_int, 0);
pub const TRUE = @as(c_int, 1);
pub const INITCODE = "";
pub const PAGEDX = "";
pub const QUIC_CACHEALIGN = "";
pub inline fn QUIC_LOCALHOST_FOR_AF(Af: anytype) @TypeOf(if (Af == QUIC_ADDRESS_FAMILY_INET) "localhost" else "ip6-localhost") {
    return if (Af == QUIC_ADDRESS_FAMILY_INET) "localhost" else "ip6-localhost";
}
pub const QUIC_CERTIFICATE_FLAG_IGNORE_REVOCATION = @as(c_int, 0x00000080);
pub const QUIC_CERTIFICATE_FLAG_IGNORE_UNKNOWN_CA = @as(c_int, 0x00000100);
pub const QUIC_CERTIFICATE_FLAG_IGNORE_WRONG_USAGE = @as(c_int, 0x00000200);
pub const QUIC_CERTIFICATE_FLAG_IGNORE_CERTIFICATE_CN_INVALID = @as(c_int, 0x00001000);
pub const QUIC_CERTIFICATE_FLAG_IGNORE_CERTIFICATE_DATE_INVALID = @as(c_int, 0x00002000);
pub const QUIC_CERTIFICATE_FLAG_IGNORE_WEAK_SIGNATURE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hexadecimal);
pub const _strnicmp = strncasecmp;
pub const QUIC_UINT62_MAX = (@as(c_ulonglong, 1) << @as(c_uint, 62)) - @as(c_int, 1);
pub const QUIC_MAX_ALPN_LENGTH = @as(c_int, 255);
pub const QUIC_MAX_SNI_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const QUIC_MAX_RESUMPTION_APP_DATA_LENGTH = @as(c_int, 1000);
pub inline fn QUIC_DATAGRAM_SEND_STATE_IS_FINAL(State: anytype) @TypeOf(State >= QUIC_DATAGRAM_SEND_LOST_DISCARDED) {
    return State >= QUIC_DATAGRAM_SEND_LOST_DISCARDED;
}
pub const QUIC_MAX_TICKET_KEY_COUNT = @as(c_int, 16);
pub const QUIC_TLS_SECRETS_MAX_SECRET_LEN = @as(c_int, 64);
pub const QUIC_PARAM_PREFIX_GLOBAL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hexadecimal);
pub const QUIC_PARAM_PREFIX_REGISTRATION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hexadecimal);
pub const QUIC_PARAM_PREFIX_CONFIGURATION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x03000000, .hexadecimal);
pub const QUIC_PARAM_PREFIX_LISTENER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hexadecimal);
pub const QUIC_PARAM_PREFIX_CONNECTION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000000, .hexadecimal);
pub const QUIC_PARAM_PREFIX_TLS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x06000000, .hexadecimal);
pub const QUIC_PARAM_PREFIX_TLS_SCHANNEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x07000000, .hexadecimal);
pub const QUIC_PARAM_PREFIX_STREAM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hexadecimal);
pub inline fn QUIC_PARAM_IS_GLOBAL(Param: anytype) @TypeOf((Param & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7F000000, .hexadecimal)) == QUIC_PARAM_PREFIX_GLOBAL) {
    return (Param & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7F000000, .hexadecimal)) == QUIC_PARAM_PREFIX_GLOBAL;
}
pub const QUIC_PARAM_GLOBAL_RETRY_MEMORY_PERCENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hexadecimal);
pub const QUIC_PARAM_GLOBAL_SUPPORTED_VERSIONS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000001, .hexadecimal);
pub const QUIC_PARAM_GLOBAL_LOAD_BALACING_MODE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000002, .hexadecimal);
pub const QUIC_PARAM_GLOBAL_PERF_COUNTERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000003, .hexadecimal);
pub const QUIC_PARAM_GLOBAL_LIBRARY_VERSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000004, .hexadecimal);
pub const QUIC_PARAM_GLOBAL_SETTINGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000005, .hexadecimal);
pub const QUIC_PARAM_GLOBAL_GLOBAL_SETTINGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000006, .hexadecimal);
pub const QUIC_PARAM_GLOBAL_LIBRARY_GIT_HASH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000008, .hexadecimal);
pub const QUIC_PARAM_GLOBAL_DATAPATH_PROCESSORS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000009, .hexadecimal);
pub const QUIC_PARAM_CONFIGURATION_SETTINGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x03000000, .hexadecimal);
pub const QUIC_PARAM_CONFIGURATION_TICKET_KEYS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x03000001, .hexadecimal);
pub const QUIC_PARAM_LISTENER_LOCAL_ADDRESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hexadecimal);
pub const QUIC_PARAM_LISTENER_STATS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000001, .hexadecimal);
pub const QUIC_PARAM_CONN_QUIC_VERSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000000, .hexadecimal);
pub const QUIC_PARAM_CONN_LOCAL_ADDRESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000001, .hexadecimal);
pub const QUIC_PARAM_CONN_REMOTE_ADDRESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000002, .hexadecimal);
pub const QUIC_PARAM_CONN_IDEAL_PROCESSOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000003, .hexadecimal);
pub const QUIC_PARAM_CONN_SETTINGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000004, .hexadecimal);
pub const QUIC_PARAM_CONN_STATISTICS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000005, .hexadecimal);
pub const QUIC_PARAM_CONN_STATISTICS_PLAT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000006, .hexadecimal);
pub const QUIC_PARAM_CONN_SHARE_UDP_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000007, .hexadecimal);
pub const QUIC_PARAM_CONN_LOCAL_BIDI_STREAM_COUNT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000008, .hexadecimal);
pub const QUIC_PARAM_CONN_LOCAL_UNIDI_STREAM_COUNT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000009, .hexadecimal);
pub const QUIC_PARAM_CONN_MAX_STREAM_IDS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0500000A, .hexadecimal);
pub const QUIC_PARAM_CONN_CLOSE_REASON_PHRASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0500000B, .hexadecimal);
pub const QUIC_PARAM_CONN_STREAM_SCHEDULING_SCHEME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0500000C, .hexadecimal);
pub const QUIC_PARAM_CONN_DATAGRAM_RECEIVE_ENABLED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0500000D, .hexadecimal);
pub const QUIC_PARAM_CONN_DATAGRAM_SEND_ENABLED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0500000E, .hexadecimal);
pub const QUIC_PARAM_CONN_RESUMPTION_TICKET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000010, .hexadecimal);
pub const QUIC_PARAM_CONN_PEER_CERTIFICATE_VALID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000011, .hexadecimal);
pub const QUIC_PARAM_CONN_LOCAL_INTERFACE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000012, .hexadecimal);
pub const QUIC_PARAM_CONN_TLS_SECRETS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000013, .hexadecimal);
pub const QUIC_PARAM_CONN_STATISTICS_V2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000016, .hexadecimal);
pub const QUIC_PARAM_CONN_STATISTICS_V2_PLAT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x05000017, .hexadecimal);
pub const QUIC_PARAM_TLS_HANDSHAKE_INFO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x06000000, .hexadecimal);
pub const QUIC_PARAM_TLS_NEGOTIATED_ALPN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x06000001, .hexadecimal);
pub const QUIC_PARAM_STREAM_ID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hexadecimal);
pub const QUIC_PARAM_STREAM_0RTT_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000001, .hexadecimal);
pub const QUIC_PARAM_STREAM_IDEAL_SEND_BUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000002, .hexadecimal);
pub const QUIC_PARAM_STREAM_PRIORITY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000003, .hexadecimal);
pub const QUIC_API_VERSION_1 = @as(c_int, 1);
pub const QUIC_API_VERSION_2 = @as(c_int, 2);
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
pub const __darwin_arm_exception_state = struct___darwin_arm_exception_state;
pub const __darwin_arm_exception_state64 = struct___darwin_arm_exception_state64;
pub const __darwin_arm_thread_state = struct___darwin_arm_thread_state;
pub const __darwin_arm_thread_state64 = struct___darwin_arm_thread_state64;
pub const __darwin_arm_vfp_state = struct___darwin_arm_vfp_state;
pub const __darwin_arm_neon_state64 = struct___darwin_arm_neon_state64;
pub const __darwin_arm_neon_state = struct___darwin_arm_neon_state;
pub const __darwin_arm_amx_state_v1 = struct___darwin_arm_amx_state_v1;
pub const __arm_pagein_state = struct___arm_pagein_state;
pub const __arm_legacy_debug_state = struct___arm_legacy_debug_state;
pub const __darwin_arm_debug_state32 = struct___darwin_arm_debug_state32;
pub const __darwin_arm_debug_state64 = struct___darwin_arm_debug_state64;
pub const __darwin_arm_cpmu_state64 = struct___darwin_arm_cpmu_state64;
pub const __darwin_mcontext32 = struct___darwin_mcontext32;
pub const __darwin_mcontext64 = struct___darwin_mcontext64;
pub const __darwin_sigaltstack = struct___darwin_sigaltstack;
pub const __darwin_ucontext = struct___darwin_ucontext;
pub const sigval = union_sigval;
pub const sigevent = struct_sigevent;
pub const __siginfo = struct___siginfo;
pub const __sigaction_u = union___sigaction_u;
pub const __sigaction = struct___sigaction;
pub const sigaction = struct_sigaction;
pub const sigvec = struct_sigvec;
pub const sigstack = struct_sigstack;
pub const timeval = struct_timeval;
pub const rusage = struct_rusage;
pub const rusage_info_v0 = struct_rusage_info_v0;
pub const rusage_info_v1 = struct_rusage_info_v1;
pub const rusage_info_v2 = struct_rusage_info_v2;
pub const rusage_info_v3 = struct_rusage_info_v3;
pub const rusage_info_v4 = struct_rusage_info_v4;
pub const rusage_info_v5 = struct_rusage_info_v5;
pub const rlimit = struct_rlimit;
pub const proc_rlimit_control_wakeupmon = struct_proc_rlimit_control_wakeupmon;
pub const _OSUnalignedU16 = struct__OSUnalignedU16;
pub const _OSUnalignedU32 = struct__OSUnalignedU32;
pub const _OSUnalignedU64 = struct__OSUnalignedU64;
pub const __sbuf = struct___sbuf;
pub const __sFILEX = struct___sFILEX;
pub const __sFILE = struct___sFILE;
pub const iovec = struct_iovec;
pub const sockaddr = struct_sockaddr;
pub const sa_endpoints = struct_sa_endpoints;
pub const linger = struct_linger;
pub const so_np_extensions = struct_so_np_extensions;
pub const sockproto = struct_sockproto;
pub const sockaddr_storage = struct_sockaddr_storage;
pub const msghdr = struct_msghdr;
pub const cmsghdr = struct_cmsghdr;
pub const sf_hdtr = struct_sf_hdtr;
pub const in_addr = struct_in_addr;
pub const sockaddr_in = struct_sockaddr_in;
pub const ip_opts = struct_ip_opts;
pub const ip_mreq = struct_ip_mreq;
pub const ip_mreqn = struct_ip_mreqn;
pub const ip_mreq_source = struct_ip_mreq_source;
pub const group_req = struct_group_req;
pub const group_source_req = struct_group_source_req;
pub const __msfilterreq = struct___msfilterreq;
pub const in_pktinfo = struct_in_pktinfo;
pub const in6_addr = struct_in6_addr;
pub const sockaddr_in6 = struct_sockaddr_in6;
pub const ipv6_mreq = struct_ipv6_mreq;
pub const in6_pktinfo = struct_in6_pktinfo;
pub const ip6_mtuinfo = struct_ip6_mtuinfo;
pub const hostent = struct_hostent;
pub const netent = struct_netent;
pub const servent = struct_servent;
pub const protoent = struct_protoent;
pub const addrinfo = struct_addrinfo;
pub const rpcent = struct_rpcent;
pub const ip = struct_ip;
pub const ip_timestamp = struct_ip_timestamp;
pub const accessx_descriptor = struct_accessx_descriptor;
pub const timespec = struct_timespec;
pub const fssearchblock = struct_fssearchblock;
pub const searchstate = struct_searchstate;
pub const QUIC_HANDLE = struct_QUIC_HANDLE;

pub const QuicStatus = @import("quic_status.zig");

pub const LISTENER_NEW_CONNECTION_WRAPPER = extern struct {
    Info: [*c]const QUIC_NEW_CONNECTION_INFO,
    Connection: HQUIC,
};
pub const LISTENER_STOP_COMPLETE_WRAPPER = packed struct { AppCloseInProgress: bool, reserved: u7 };

const SHUTDOWN_INITIATED_BY_PEER = extern struct {
    ErrorCode: QUIC_UINT62,
}; // /Users/marco/code/zig-libp2p/msquic/src/inc/msquic.h:1029:21: warning: struct demoted to opaque type - has bitfield
const CONN_SHUTDOWN_COMPLETE = packed struct {
    HandshakeCompleted: bool,
    PeerAcknowledgedShutdown: bool,
    AppCloseInProgress: bool,
    // To be ABI sized
    reserved: u5,
};

const STREAM_START_COMPLETE = extern struct {
    Status: QUIC_STATUS,
    ID: QUIC_UINT62,
    // Bitfields are tricky since they are ABI defined (not defined by the C spec)
    bitfields: packed struct {
        PeerAccepted: bool,
        RESERVED: u7,
    },
};

const STREAM_SHUTDOWN_COMPLETE = extern struct {
    ConnectionShutdown: u8,
    bitfields: packed struct {
        AppCloseInProgress: bool,
        RESERVED: u7,
    },
};

pub const QuicSettings = extern struct {
    IsSet: extern union {
        IsSetFlags: u64,
        flags: packed struct {
            MaxBytesPerKey: bool,
            HandshakeIdleTimeoutMs: bool,
            IdleTimeoutMs: bool,
            MtuDiscoverySearchCompleteTimeoutUs: bool,
            TlsClientMaxSendBuffer: bool,
            TlsServerMaxSendBuffer: bool,
            StreamRecvWindowDefault: bool,
            StreamRecvBufferDefault: bool,
            ConnFlowControlWindow: bool,
            MaxWorkerQueueDelayUs: bool,
            MaxStatelessOperations: bool,
            InitialWindowPackets: bool,
            SendIdleTimeoutMs: bool,
            InitialRttMs: bool,
            MaxAckDelayMs: bool,
            DisconnectTimeoutMs: bool,
            KeepAliveIntervalMs: bool,
            CongestionControlAlgorithm: bool,
            PeerBidiStreamCount: bool,
            PeerUnidiStreamCount: bool,
            MaxBindingStatelessOperations: bool,
            StatelessOperationExpirationMs: bool,
            MinimumMtu: bool,
            MaximumMtu: bool,
            SendBufferingEnabled: bool,
            PacingEnabled: bool,
            MigrationEnabled: bool,
            DatagramReceiveEnabled: bool,
            ServerResumptionLevel: bool,
            MaxOperationsPerDrain: bool,
            MtuDiscoveryMissingProbeCount: bool,
            RESERVED: u33,
        },
    },

    MaxBytesPerKey: u64,
    HandshakeIdleTimeoutMs: u64,
    IdleTimeoutMs: u64,
    MtuDiscoverySearchCompleteTimeoutUs: u64,
    TlsClientMaxSendBuffer: u32,
    TlsServerMaxSendBuffer: u32,
    StreamRecvWindowDefault: u32,
    StreamRecvBufferDefault: u32,
    ConnFlowControlWindow: u32,
    MaxWorkerQueueDelayUs: u32,
    MaxStatelessOperations: u32,
    InitialWindowPackets: u32,
    SendIdleTimeoutMs: u32,
    InitialRttMs: u32,
    MaxAckDelayMs: u32,
    DisconnectTimeoutMs: u32,
    KeepAliveIntervalMs: u32,
    CongestionControlAlgorithm: u16, // QUIC_CONGESTION_CONTROL_ALGORITHM
    PeerBidiStreamCount: u16,
    PeerUnidiStreamCount: u16,
    MaxBindingStatelessOperations: u16,
    StatelessOperationExpirationMs: u16,
    MinimumMtu: u16,
    MaximumMtu: u16,
    bitfields: packed struct {
        SendBufferingEnabled: bool,
        PacingEnabled: bool,
        MigrationEnabled: bool,
        DatagramReceiveEnabled: bool,
        ServerResumptionLevel: u2, // QUIC_SERVER_RESUMPTION_LEVEL
        RESERVED: u2,
    },
    MaxOperationsPerDrain: u8,
    MtuDiscoveryMissingProbeCount: u8,
};

pub const QUIC_SETTINGS = QuicSettings; // /nix/store/0if5sla12cr69c4b806czi5h12sa400l-libmsquic-4326e6bac26d880fa833a7edcf39fcc27f1996f9/src/inc/msquic.h:630:17: warning: struct demoted to opaque type - has bitfield
