#include <stdint.h>
#include <openssl/pkcs12.h>

// Workaround a bug in the zig compiler. It loses this symbol. Why?
uint64_t CGroupGetMemoryLimit();

int PKCS12_parse(PKCS12 *p12, const char *pass, EVP_PKEY **pkey, X509 **cert,
                 STACK_OF(X509) * *ca);