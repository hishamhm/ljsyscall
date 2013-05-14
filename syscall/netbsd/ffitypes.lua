-- ffi definitions of BSD types

local abi = require "syscall.abi"

local cdef = require "ffi".cdef

cdef [[
typedef uint32_t mode_t;
typedef uint8_t sa_family_t;
typedef uint64_t dev_t;
typedef uint32_t nlink_t;
typedef uint64_t ino_t;
typedef int64_t time_t;
typedef int64_t daddr_t;
typedef uint64_t blkcnt_t;
typedef uint32_t blksize_t;
typedef int32_t clockid_t;
typedef int ssize_t;
typedef unsigned int size_t;
typedef unsigned long clock_t;

struct iovec {
  void *iov_base;
  size_t iov_len;
};
struct timespec {
  time_t tv_sec;
  long   tv_nsec;
};
typedef struct {
  uint32_t      val[4]; // note renamed to match Linux
} sigset_t;
struct sockaddr {
  uint8_t       sa_len;
  sa_family_t   sa_family;
  char          sa_data[14];
};
struct sockaddr_storage {
  uint8_t       ss_len;
  sa_family_t   ss_family;
  char          __ss_pad1[6];
  int64_t       __ss_align;
  char          __ss_pad2[128 - 2 - 8 - 6];
};
struct sockaddr_in {
  uint8_t         sin_len;
  sa_family_t     sin_family;
  in_port_t       sin_port;
  struct in_addr  sin_addr;
  int8_t          sin_zero[8];
};
struct sockaddr_in6 {
  uint8_t         sin6_len;
  sa_family_t     sin6_family;
  in_port_t       sin6_port;
  uint32_t        sin6_flowinfo;
  struct in6_addr sin6_addr;
  uint32_t        sin6_scope_id;
};
struct sockaddr_un {
  uint8_t         sun_len;
  sa_family_t     sun_family;
  char            sun_path[104];
};
struct msghdr {
  void            *msg_name;
  socklen_t       msg_namelen;
  struct iovec    *msg_iov;
  int             msg_iovlen;
  void            *msg_control;
  socklen_t       msg_controllen;
  int             msg_flags;
};
struct stat {
  dev_t     st_dev;
  mode_t    st_mode;
  ino_t     st_ino;
  nlink_t   st_nlink;
  uid_t     st_uid;
  gid_t     st_gid;
  dev_t     st_rdev;
  struct    timespec st_atimespec;
  struct    timespec st_mtimespec;
  struct    timespec st_ctimespec;
  struct    timespec st_birthtimespec;
  off_t     st_size;
  blkcnt_t  st_blocks;
  blksize_t st_blksize;
  uint32_t  st_flags;
  uint32_t  st_gen;
  uint32_t  st_spare[2];
};
typedef union sigval {
  int     sival_int;
  void    *sival_ptr;
} sigval_t;
]]

if abi.abi64 then
cdef [[
struct _ksiginfo {
  int     _signo;
  int     _code;
  int     _errno;
  int     _pad; /* only on LP64 */
  union {
    struct {
      pid_t   _pid;
      uid_t   _uid;
      sigval_t        _value;
    } _rt;
    struct {
      pid_t   _pid;
      uid_t   _uid;
      int     _status;
      clock_t _utime;
      clock_t _stime;
    } _child;
    struct {
      void   *_addr;
      int     _trap;
    } _fault;
    struct {
      long    _band;
      int     _fd;
    } _poll;
  } _reason;
};
]]
else
cdef [[
struct _ksiginfo {
  int     _signo;
  int     _code;
  int     _errno;
  union {
    struct {
      pid_t   _pid;
      uid_t   _uid;
      sigval_t        _value;
    } _rt;
    struct {
      pid_t   _pid;
      uid_t   _uid;
      int     _status;
      clock_t _utime;
      clock_t _stime;
    } _child;
    struct {
      void   *_addr;
      int     _trap;
    } _fault;
    struct {
      long    _band;
      int     _fd;
    } _poll;
  } _reason;
};
]]
end

cdef [[
typedef union siginfo {
        char    si_pad[128];    /* Total size; for future expansion */
        struct _ksiginfo _info;
} siginfo_t;
struct sigaction {
  union {
    void (*sa_handler)(int);
    void (*sa_sigaction)(int, siginfo_t *, void *);
  } sa_handler; // renamed as in Linux definition
  sigset_t sa_mask;
  int sa_flags;
};
]]

