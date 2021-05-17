#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Set the current build config file location
if test -z "$OUT_FILE"; then OUT_FILE="build-config.sh"; fi

# Default Layout in case it does not exist
if test -z "$SSL_LAYOUT"; then SSL_LAYOUT="OpenSSL"; fi

# Default Options in case it does not exist
if test -z "$SSL_OPTIONS"; then SSL_OPTIONS="Minimal"; fi

# Default config file location
if test -z "$SSL_CONFIG_FILE"; then SSL_CONFIG_FILE="/etc/profile.d/openssl-config.sh"; fi

# Default options file location
if test -z "$SSL_OPTIONS_FILE"; then SSL_OPTIONS_FILE="/etc/profile.d/openssl-options.sh"; fi

# Include shared libs
. "./install_funcs.sh"

# Read In Our Configurations
"./layout.sh" -l "$LAYOUT" -f "$SSL_CONFIG_FILE"
"./options.sh" -o "$OPTIONS" -f "$SSL_OPTIONS_FILE"

# Remove the file if it already exists (just in case!)
rm -f $OUT_FILE

# Create first line and set permissions for the outfile
echo "#!/bin/sh" >>$OUT_FILE && chmod 777 $OUT_FILE

# Check for flags
Check_Flag AR
Check_Flag ARFLAGS
Check_Flag AS
Check_Flag ASFLAGS
Check_Flag CC
Check_Flag CFLAGS
Check_Flag CXX
Check_Flag CXXFLAGS
Check_Flag CPP
Check_Flag CPPFLAGS
Check_Flag CPPDEFINES
Check_Flag CPPINCLUDES
Check_Flag HASHBANGPERL
Check_Flag LD
Check_Flag LDFLAGS
Check_Flag LDLIBS
Check_Flag RANLIBS
Check_Flag RC
Check_Flag RCFLAGS

echo "\"./config\" \\" >>$OUT_FILE

if test -n "$ssl_prefix"; then Add_Option_Val prefix $ssl_prefix; fi
if test -n "$ssl_dir"; then Add_Option_Val openssldir $ssl_dir; fi
if test -n "$ssl_libdir"; then Add_Option_Val libdir $ssl_libdir; fi

# Check to manually enable/disable components
Check_Component AFALGENG "afalgeng"
Check_Component ASAN "asan"
Check_Component ACVP_TESTS "acvp-tests"
Check_Component ASM "asm"
Check_Component ASYNC "async"
Check_Component AUTOALGINIT "autoalginit"
Check_Component AUTOERRINIT "autoerrinit"
Check_Component AUTOLOAD_CONFIG "autoload-config"

Check_Component BUILDTEST_CPLUSPLUS "buildtest-c++"
Check_Component BULK "bulk"

Check_Component CACHED_FETCH "cached-fetch"
Check_Component CAPIENG "capieng"
Check_Component CMP "cmp"
Check_Component CMS "cms"
Check_Component COMP "comp"
Check_Component CRYPTO_MDEBUG "crypto-mdebug"
Check_Component CRYPTO_MDEBUG_BACKTRACE "crypto-mdebug-backtrace"
Check_Component CT "ct"

Check_Component DEPRECATED "deprecated"
Check_Component DGRAM "dgram"
Check_Component DSO "dso"
Check_Component DEVCRYPTOENG "devcryptoeng"
Check_Component DYNAMIC_ENGINE "dynamic-engine"

Check_Component EC "ec"
Check_Component EC2M "ec2m"
Check_Component EC_NISTP_64_GCC_128 "ec_nistp_64_gcc_128"
Check_Component EGD "egd"
Check_Component ENGINE "engine"
Check_Component ERR "err"
Check_Component EXTERNAL_TESTS "external-tests"

Check_Component FILENAMES "filenames"
Check_Component FIPS "fips"
Check_Component FIPS_SECURITYCHECKS "fips-securitychecks"
Check_Component FUZZ_LIBFUZZER "fuzz-libfuzzer"
Check_Component FUZZ_AFL "fuzz-afl"

Check_Component GOST "gost"
Check_Component HW_PADLOCKENG "hw-padlockeng"
Check_Component KTLS "ktls"
Check_Component LEGACY "legacy"

Check_Component MAKEDEPEND "makedepend"
Check_Component MODULE "module"
Check_Component MULTIBLOCK "multiblock"

Check_Component NEXTPROTONEG "nextprotoneg"
Check_Component OCSP "ocsp"

Check_Component PADLOCKENG "padlockeng"
Check_Component PIE "pic"
Check_Component PINSHARED "pinshared" #****!!!! NOT FULLY SUPPORTED
Check_Component POSIX_IO "posix-io"
Check_Component PSK "psk"

Check_Component RDRAND "rdrand"
Check_Component RFC3779 "rfc3779"

Check_Component SOCK "sock"
Check_Component SRP "srp"
Check_Component SRTP "srtp"
Check_Component SSE2 "sse2"
Check_Component SSL_TRACE "ssl-trace"
Check_Component STATIC_ENGINE "static-engine"
Check_Component STDIO "stdio"

Check_Component TESTS "tests"
Check_Component TRACE "trace"
Check_Component TS "ts"

Check_Component UBSAN "ubsan"
Check_Component UI_CONSOLE "ui-console"
Check_Component UNIT_TEST "unit-test"
Check_Component UPLINK "uplink"

Check_Component WEAK_SSL_CIPHERS "weak-ssl-ciphers"

Check_Component_Alt SCTP "sctp"
Check_Component_Alt SHARED "shared"
Check_Component_Alt THREADS "threads"
Check_Component_Alt ZLIB "zlib"
Check_Component_Alt ZLIB_DYNAMIC "zlib-dynamic"
Check_Component_Alt 386 "386"

# Check Protocols
Check_Protocol SSL "ssl"
Check_Protocol SSL2 "ssl2"
Check_Protocol SSL3 "ssl3"
Check_Protocol TLS "tls"
Check_Protocol TLS1 "tls1"
Check_Protocol TLS1_1 "tls1_1"
Check_Protocol TLS1_2 "tls1_2"
Check_Protocol TLS1_3 "tls1_3"
Check_Protocol DTLS "dtls"
Check_Protocol DTLS1 "dtls1"
Check_Protocol DTLS1_2 "dtls1_2"

# Check Algorithms
Check_Algorithm ARIA "aria"
Check_Algorithm BF "bf"
Check_Algorithm BLAKE2 "blake2"
Check_Algorithm CAMELLIA "camellia"
Check_Algorithm CAST "cast"
Check_Algorithm CHACHA "chacha"
Check_Algorithm CMAC "cmac"
Check_Algorithm DES "des"
Check_Algorithm DH "dh"
Check_Algorithm DSA "dsa"
Check_Algorithm ECDH "ecdh"
Check_Algorithm ECDSA "ecdsa"
Check_Algorithm IDEA "idea"
Check_Algorithm MD2 "md2"
Check_Algorithm MD4 "md4"
Check_Algorithm MDC2 "mdc2"
Check_Algorithm OCB "ocb"
Check_Algorithm POLY1305 "poly1305"
Check_Algorithm RC2 "rc2"
Check_Algorithm RC4 "rc4"
Check_Algorithm RC5 "rc5"
Check_Algorithm RIPEMD "ripemd" # deprecated and if used is synonymous with ripemd
Check_Algorithm RMD160 "rmd160"
Check_Algorithm SCRYPT "scrypt"
Check_Algorithm SEED "seed"
Check_Algorithm SIPHASH "siphash"
Check_Algorithm SIV "siv"
Check_Algorithm SM2 "sm2"
Check_Algorithm SM3 "sm3"
Check_Algorithm SM4 "sm4"
Check_Algorithm WHIRLPOOL "whirlpool"

Check_Compiler_Option RPATH "rpath"
Check_Compiler_Option WL "Wl"
Check_Compiler_Option WP "Wp"
Check_Compiler_Option R "R"
Check_Compiler_Option FRAMEWORK "framework"
Check_Compiler_Option STATIC "static"

# Add the make and make install commands
# Make Install - https://github.com/openssl/openssl/issues/8170 for no docs!
echo "&& make && make install_sw install_ssldirs" >>$OUT_FILE

# Start configure/install
echo "Configuring/Installing OpenSSL..."
cat "$OUT_FILE"
# Run the file which executes the Configure, Make, and Install
"./$OUT_FILE"

# Configure the Install
# Modified from: https://git.alpinelinux.org/aports/tree/main/openssl/APKBUILD
#CFLAGS="-s -O3" CXXFLAGS="-s -O3" "./config" --prefix=$ssl_prefix --openssldir=$ssl_dir --libdir=$ssl_libdir enable-pic \
 #           shared no-ct no-sm2 no-dtls no-afalgeng no-capieng no-hw-padlock no-dgram no-gost no-comp \
 #           no-devcryptoeng no-zlib no-async no-idea no-mdc2 no-rc5 no-ec2m no-sm4 no-ssl2 no-ssl3 no-seed no-weak-ssl-ciphers \
 #           -Wa,--noexecstack
            
            # \
            #no-filenames no-multiblock no-posix-io no-psk no-rdrand no-rfc3779 \
            #no-sock no-srtp no-sse2 no-tests no-threads no-ts no-ui-console \
            # no-stdio 
        
            # Required - (IE do no compile with these options as it breaks!)
            # no-ocsp no-autoload-config no-deprecated no-autoalginit 
            # Required for MSSQL Driver
            # no-srp no-nextprotoneg 
            # Optional - (IE Not needed for this purpose)
            # no-pinshared
            # Unknown If Needed or not
            # 
            #              no-engine no-dynamic-engine no-dgram no-dso no-err no-makedepend \
           # no-asm no-autoerrinit no-cms no-ec \

# Add the Prefix path to the LD_LIBRARY_VAR
echo "export LD_LIBRARY_PATH=\"$LD_LIBRARY_PATH:$ssl_libdir\"" >> "$SSL_CONFIG_FILE" && export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$ssl_libdir"
# Add the Executible path to the Path Variable
echo "export PATH=\"$ssl_prefix/bin:$PATH\"" >> "$SSL_CONFIG_FILE" && export PATH="$ssl_prefix/bin:$PATH"

# Finished!
echo "OpenSSL is now compiled and installed!"