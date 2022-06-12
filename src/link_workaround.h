#include <stdint.h>

// Workaround a bug in the zig compiler. It loses this symbol. Why?
uint64_t CGroupGetMemoryLimit();