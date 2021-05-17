# Available Installation Options for OpenSSL
The config.options file provides many different ways to configure which openssl components to build and install. Please consult the install file [docs](https://github.com/openssl/openssl/blob/master/INSTALL.md) for general options. Consult the configuration file in the sources for all possible options.

## Current supported options
WRPATH - translates to -rpath<br/>
WWL - translates to -Wl<br/>
WWP - translates to -Wp<br/>
WR - translates to -R<br/>
WFRAMEWORK - translates to -framework<br/>
WSTATIC - translates to -static<br/>

### Directories
These will override any settings defined in the [layout](configs/openssl/layout.options) file.<br/>

WPREFIX - translates to --prefix=(DIR)<br/>
WSSL_DIR - translates to --openssldir=(DIR)<br/>
WLIB_DIR - translates to --libdir=(DIR)<br/>

### Variables
Set environmental variables for compiling.<br/>
WAR - translates to AR="VALUE"<br/>
WARFLAGS - translates to ARFLAGS="VALUE"<br/>
WAS - translates to AS="VALUE"<br/>
WASFLAGS - translates to ASFLAGS="VALUE"<br/>
WCC - translates to CC="VALUE"<br/>
WCFLAGS - translates to CFLAGS="VALUE"<br/>
WCXX - translates to CXX="VALUE"<br/>
WCXXFLAGS - translates to CXXFLAGS="VALUE"<br/>
WCPP - translates to CPP="VALUE"<br/>
WCPPFLAGS - translates to CPPFLAGS="VALUE"<br/>
WCPPDEFINES - translates to CPPDEFINES="VALUE"<br/>
WCPPINCLUDES - translates to CPPINCLUDES="VALUE"<br/>
WHASHBANGPERL - translates to HASHBANGPERL="VALUE"<br/>
WLD - translates to LD="VALUE"<br/>
WLDFLAGS - translates to LDFLAGS="VALUE"<br/>
WLDLIBS - translates to LDLIBS="VALUE"<br/>
WRANLIBS - translates to RANLIBS="VALUE"<br/>
WRC - translates to RC="VALUE"<br/>
WRCFLAGS - translates to RCFLAGS="VALUE"<br/>

### Components
Options that start with 'E_' will enable a component. If no value is passed (you still need the ':' in the config!) it will default to 'yes'. 'no' is equivalent to any option that starts with 'D_', which will disable a component and prevent it from being included. Possible values for 'E_/D_' are: yes|no<br/>

E_AFALGENG - translates to enable-afalgeng<br/>
D_AFALGENG - translates to no-afalgeng<br/>
E_ASAN - translates to enable-asan<br/>
D_ASAN - translates to no-asan<br/>
E_ACVP_TESTS - translates to enable-acvp-tests<br/>
D_ACVP_TESTS - translates to no-acvp-tests<br/>
E_ASM - translates to enable-asm<br/>
D_ASM - translates to no-asm<br/>
E_ASYNC - translates to enable-async<br/>
D_ASYNC - translates to no-async<br/>
E_AUTOALGINIT - translates to enable-autoalginit<br/>
D_AUTOALGINIT - translates to no-autoalginit<br/>
E_AUTOERRINIT - translates to enable-autoerrinit<br/>
D_AUTOERRINIT - translates to no-autoerrinit<br/>
E_AUTOLOAD_CONFIG - translates to enable-autoload-config<br/>
D_AUTOLOAD_CONFIG - translates to no-autoload-config<br/>

E_BUILDTEST_CPLUSPLUS - translates to enable-buildtest-c++<br/>
D_BUILDTEST_CPLUSPLUS - translates to no-buildtest-c++<br/>
E_BULK - translates to enable-bulk<br/>
D_BULK - translates to no-bulk<br/>

E_CACHED_FETCH - translates to enable-cached-fetch<br/>
D_CACHED_FETCH - translates to no-cached-fetch<br/>
E_CAPIENG - translates to enable-capieng<br/>
D_CAPIENG - translates to no-capieng<br/>
E_CMP - translates to enable-cmp<br/>
D_CMP - translates to no-cmp<br/>
E_CMS - translates to enable-cms<br/>
D_CMS - translates to no-cms<br/>
E_COMP - translates to enable-comp<br/>
D_COMP - translates to no-comp<br/>
E_CRYPTO_MDEBUG - translates to enable-crypto-mdebug<br/>
D_CRYPTO_MDEBUG - translates to no-crypto-mdebug<br/>
E_CRYPTO_MDEBUG_BACKTRACE - translates to enable-crypto-mdebug-backtrace<br/>
D_CRYPTO_MDEBUG_BACKTRACE - translates to no-crypto-mdebug-backtrace<br/>
E_CT - translates to enable-ct<br/>
D_CT - translates to no-ct<br/>

E_DEPRECATED - translates to enable-deprecated<br/>
D_DEPRECATED - translates to no-deprecated<br/>
E_DGRAM - translates to enable-dgram<br/>
D_DGRAM - translates to no-dgram<br/>
E_DSO - translates to enable-dso<br/>
D_DSO - translates to no-dso<br/>
E_DEVCRYPTOENG - translates to enable-devcryptoeng<br/>
D_DEVCRYPTOENG - translates to no-devcryptoeng<br/>
E_DYNAMIC_ENGINE - translates to enable-dynamic-engine<br/>
D_DYNAMIC_ENGINE - translates to no-dynamic-engine<br/>

E_EC - translates to enable-ec<br/>
D_EC - translates to no-ec<br/>
E_EC2M - translates to enable-ec2m<br/>
D_EC2M - translates to no-ec2m<br/>
E_EC_NISTP_64_GCC_128 - translates to enable-ec_nistp_64_gcc_128<br/>
D_EC_NISTP_64_GCC_128 - translates to no-ec_nistp_64_gcc_128<br/>
E_EGD - translates to enable-egd<br/>
D_EGD - translates to no-egd<br/>
E_ENGINE - translates to enable-engine<br/>
D_ENGINE - translates to no-engine<br/>
E_ERR - translates to enable-err<br/>
D_ERR - translates to no-err<br/>
E_EXTERNAL_TESTS - translates to enable-external-tests<br/>
D_EXTERNAL_TESTS - translates to no-external-tests<br/>

E_FILENAMES - translates to enable-filenames<br/>
D_FILENAMES - translates to no-filenames<br/>
E_FIPS - translates to enable-fips<br/>
D_FIPS - translates to no-fips<br/>
E_FIPS_SECURITYCHECKS - translates to enable-fips-securitychecks<br/>
D_FIPS_SECURITYCHECKS - translates to no-fips-securitychecks<br/>
E_FUZZ_LIBFUZZER - translates to enable-fuzz-libfuzzer<br/>
D_FUZZ_LIBFUZZER - translates to no-fuzz-libfuzzer<br/>
E_FUZZ_AFL - translates to enable-fuzz-afl<br/>
D_FUZZ_AFL - translates to no-fuzz-afl<br/>

E_GOST - translates to enable-gost<br/>
D_GOST - translates to no-gost<br/>
E_HW_PADLOCKENG - translates to enable-hw-padlockeng<br/>
D_HW_PADLOCKENG - translates to no-hw-padlockeng<br/>
E_KTLS - translates to enable-ktls<br/>
D_KTLS - translates to no-ktls<br/>
E_LEGACY - translates to enable-legacy<br/>
D_LEGACY - translates to no-legacy<br/>

E_MAKEDEPEND - translates to enable-makedepend<br/>
D_MAKEDEPEND - translates to no-makedepend<br/>
E_MODULE - translates to enable-module<br/>
D_MODULE - translates to no-module<br/>
E_MULTIBLOCK - translates to enable-multiblock<br/>
D_MULTIBLOCK - translates to no-multiblock<br/>
E_NEXTPROTONEG - translates to enable-nextprotoneg<br/>
D_NEXTPROTONEG - translates to no-nextprotoneg<br/>
E_OCSP - translates to enable-ocsp<br/>
D_OCSP - translates to no-ocsp<br/>

E_PADLOCKENG - translates to enable-padlockeng<br/>
D_PADLOCKENG - translates to no-padlockeng<br/>
E_PIE - translates to enable-pic<br/>
D_PIE - translates to no-pic<br/>
E_PINSHARED - translates to enable-pinshared<br/>
D_PINSHARED - translates to no-pinshared<br/>
E_POSIX_IO - translates to enable-posix-io<br/>
D_POSIX_IO - translates to no-posix-io<br/>
E_PSK - translates to enable-psk<br/>
D_PSK - translates to no-psk<br/>

E_RDRAND - translates to enable-rdrand<br/>
D_RDRAND - translates to no-rdrand<br/>
E_RFC3779 - translates to enable-rfc3779<br/>
D_RFC3779 - translates to no-rfc3779<br/>

E_SOCK - translates to enable-sock<br/>
D_SOCK - translates to no-sock<br/>
E_SRP - translates to enable-srp<br/>
D_SRP - translates to no-srp<br/>
E_SRTP - translates to enable-srtp<br/>
D_SRTP - translates to no-srtp<br/>
E_SSE2 - translates to enable-sse2<br/>
D_SSE2 - translates to no-sse2<br/>
E_SSL_TRACE - translates to enable-ssl-trace<br/>
D_SSL_TRACE - translates to no-ssl-trace<br/>
E_STATIC_ENGINE - translates to enable-static-engine<br/>
D_STATIC_ENGINE - translates to no-static-engine<br/>
E_STDIO - translates to enable-stdio<br/>
D_STDIO - translates to no-stdio<br/>

E_TESTS - translates to enable-tests<br/>
D_TESTS - translates to no-tests<br/>
E_TRACE - translates to enable-trace<br/>
D_TRACE - translates to no-trace<br/>
E_TS - translates to enable-ts<br/>
D_TS - translates to no-ts<br/>

E_UBSAN - translates to enable-ubsan<br/>
D_UBSAN - translates to no-ubsan<br/>
E_UI_CONSOLE - translates to enable-ui-console<br/>
D_UI_CONSOLE - translates to no-ui-console<br/>
E_UNIT_TEST - translates to enable-unit-test<br/>
D_UNIT_TEST - translates to no-unit-test<br/>
E_UPLINK - translates to enable-uplink<br/>
D_UPLINK - translates to no-uplink<br/>

E_WEAK_SSL_CIPHERS - translates to enable-weak-ssl-ciphers<br/>
D_WEAK_SSL_CIPHERS - translates to no-weak-ssl-ciphers<br/>

E_SCTP - translates to sctp<br/>
D_SCTP - translates to no-sctp<br/>
E_SHARED - translates to shared<br/>
D_SHARED - translates to no-shared<br/>
E_THREADS - translates to threads<br/>
D_THREADS - translates to no-threads<br/>
E_ZLIB - translates to zlib<br/>
D_ZLIB - translates to no-zlib<br/>
E_ZLIB_DYNAMIC - translates to zlib-dynamic<br/>
D_ZLIB_DYNAMIC - translates to no-zlib-dynamic<br/>
E_386 - translates to 386<br/>
D_386 - translates to no-386<br/>

### Protocols
Options that start with 'E_' will enable a protocol. If no value is passed (you still need the ':' in the config!) it will default to 'yes'. 'no' is equivalent to any option that starts with 'D_', which will disable a protocol and prevent it from being included. Possible values for 'E_/D_' are: yes|no<br/>

E_SSL - translates to enable-ssl<br/>
D_SSL - translates to no-ssl<br/>
E_SSL2 - translates to enable-ssl2<br/>
D_SSL2 - translates to no-ssl2<br/>
E_SSL3 - translates to enable-ssl3<br/>
D_SSL3 - translates to no-ssl3<br/>
E_TLS - translates to enable-tls<br/>
D_TLS - translates to no-tls<br/>
E_TLS1 - translates to enable-tls1<br/>
D_TLS1 - translates to no-tls1<br/>
E_TLS1_1 - translates to enable-tls1_1<br/>
D_TLS1_1 - translates to no-tls1_1<br/>
E_TLS1_2 - translates to enable-tls1_2<br/>
D_TLS1_2 - translates to no-tls1_2<br/>
E_TLS1_3 - translates to enable-tls1_3<br/>
D_TLS1_3 - translates to no-tls1_3<br/>
E_DTLS - translates to enable-dtls<br/>
D_DTLS - translates to no-dtls<br/>
E_DTLS1 - translates to enable-dtls1<br/>
D_DTLS1 - translates to no-dtls1<br/>
E_DTLS1_2 - translates to enable-dtls1_2<br/>
D_DTLS1_2 - translates to no-dtls1_2<br/>

### Algorithms
Options that start with 'E_' will enable a algorithms. If no value is passed (you still need the ':' in the config!) it will default to 'yes'. 'no' is equivalent to any option that starts with 'D_', which will disable a algorithms and prevent it from being included. Possible values for 'E_/D_' are: yes|no<br/>

E_ARIA - translates to enable-aria<br/>
D_ARIA - translates to no-aria<br/>
E_BF - translates to enable-bf<br/>
D_BF - translates to no-bf<br/>
E_BLAKE2 - translates to enable-blake2<br/>
D_BLAKE2 - translates to no-blake2<br/>
E_CAMELLIA - translates to enable-camellia<br/>
D_CAMELLIA - translates to no-camellia<br/>
E_CAST - translates to enable-cast<br/>
D_CAST - translates to no-cast<br/>
E_CHACHA - translates to enable-chacha<br/>
D_CHACHA - translates to no-chacha<br/>
E_CMAC - translates to enable-cmac<br/>
D_CMAC - translates to no-cmac<br/>
E_DES - translates to enable-des<br/>
D_DES - translates to no-des<br/>
E_DH - translates to enable-dh<br/>
D_DH - translates to no-dh<br/>
E_DSA - translates to enable-dsa<br/>
D_DSA - translates to no-dsa<br/>
E_ECDH - translates to enable-ecdh<br/>
D_ECDH - translates to no-ecdh<br/>
E_ECDSA - translates to enable-ecdsa<br/>
D_ECDSA - translates to no-ecdsa<br/>
E_IDEA - translates to enable-idea<br/>
D_IDEA - translates to no-idea<br/>
E_MD2 - translates to enable-md2<br/>
D_MD2 - translates to no-md2<br/>
E_MD4 - translates to enable-md4<br/>
D_MD4 - translates to no-md4<br/>
E_MDC2 - translates to enable-mdc2<br/>
D_MDC2 - translates to no-mdc2<br/>
E_OCB - translates to enable-ocb<br/>
D_OCB - translates to no-ocb<br/>
E_POLY1305 - translates to enable-poly1305<br/>
D_POLY1305 - translates to no-poly1305<br/>
E_RC2 - translates to enable-rc2<br/>
D_RC2 - translates to no-rc2<br/>
E_RC4 - translates to enable-rc4<br/>
D_RC4 - translates to no-rc4<br/>
E_RC5 - translates to enable-rc5<br/>
D_RC5 - translates to no-rc5<br/>
E_RIPEMD - translates to enable-ripemd<br/>
D_RIPEMD - translates to no-ripemd<br/>
E_RMD160 - translates to enable-rmd160<br/>
D_RMD160 - translates to no-rmd160<br/>
E_SCRYPT - translates to enable-scrypt<br/>
D_SCRYPT - translates to no-scrypt<br/>
E_SEED - translates to enable-seed<br/>
D_SEED - translates to no-seed<br/>
E_SIPHASH - translates to enable-siphash<br/>
D_SIPHASH - translates to no-siphash<br/>
E_SIV - translates to enable-siv<br/>
D_SIV - translates to no-siv<br/>
E_SM2 - translates to enable-sm2<br/>
D_SM2 - translates to no-sm2<br/>
E_SM3 - translates to enable-sm3<br/>
D_SM3 - translates to no-sm3<br/>
E_SM4 - translates to enable-sm4<br/>
D_SM4 - translates to no-sm4<br/>
E_WHIRLPOOL - translates to enable-whirlpool<br/>
D_WHIRLPOOL - translates to no-whirlpool<br/>
