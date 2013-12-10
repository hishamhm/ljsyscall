-- NetBSD syscall numbers

local nr = {
  SYS = {
  syscall = 0,
  exit = 1,
  fork = 2,
  read = 3,
  write = 4,
  open = 5,
  close = 6,
  compat_50_wait4 = 7,
  compat_43_ocreat = 8,
  link = 9,
  unlink = 10,
  chdir = 12,
  fchdir = 13,
  compat_50_mknod = 14,
  chmod = 15,
  chown = 16,
  ["break"] = 17,
  compat_20_getfsstat = 18,
  compat_43_olseek = 19,
  getpid = 20,
  compat_40_mount = 21,
  unmount = 22,
  setuid = 23,
  getuid = 24,
  geteuid = 25,
  ptrace = 26,
  recvmsg = 27,
  sendmsg = 28,
  recvfrom = 29,
  accept = 30,
  getpeername = 31,
  getsockname = 32,
  access = 33,
  chflags = 34,
  fchflags = 35,
  sync = 36,
  kill = 37,
  compat_43_stat43 = 38,
  getppid = 39,
  compat_43_lstat43 = 40,
  dup = 41,
  pipe = 42,
  getegid = 43,
  profil = 44,
  ktrace = 45,
  compat_13_sigaction13 = 46,
  getgid = 47,
  compat_13_sigprocmask13 = 48,
  __getlogin = 49,
  __setlogin = 50,
  acct = 51,
  compat_13_sigpending13 = 52,
  compat_13_sigaltstack13 = 53,
  ioctl = 54,
  compat_12_oreboot = 55,
  revoke = 56,
  symlink = 57,
  readlink = 58,
  execve = 59,
  umask = 60,
  chroot = 61,
  compat_43_fstat43 = 62,
  compat_43_ogetkerninfo = 63,
  compat_43_ogetpagesize = 64,
  compat_12_msync = 65,
  vfork = 66,
  }
}

return nr
