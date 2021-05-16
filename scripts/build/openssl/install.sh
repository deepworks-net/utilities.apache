#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Default Layout in case it does not exist
if test -z "$SSL_LAYOUT"; then SSL_LAYOUT="OpenSSL"; fi

# Read In Our Configurations
"./layout.sh" -l "$SSL_LAYOUT"

# Read in what we parsed from the configuration to make them env vars
. "/etc/profile"

# Add the Prefix path to the LD_LIBRARY_VAR
echo "export LD_LIBRARY_PATH=\"$LD_LIBRARY_PATH:$ssl_prefix/lib\"" >> "/etc/profile.d/openssl.sh" && export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$ssl_prefix/lib"
# Add the Executible path to the Path Variable
echo "export PATH=\"$ssl_prefix/bin:$PATH\"" >> "/etc/profile.d/openssl.sh" && export PATH="$ssl_prefix/bin:$PATH"

# Start configure/install
echo "Configuring/Installing OpenSSL: Prefix: $ssl_prefix, OpenSSLDir: $ssl_dir"

# Configure the Install
# Modified from: https://git.alpinelinux.org/aports/tree/main/openssl/APKBUILD
CFLAGS="-s -O3" CXXFLAGS="-s -O3" "./config" --prefix=$ssl_prefix --openssldir=$ssl_dir --libdir=lib enable-pic \
            shared no-ct no-sm2 no-dtls no-afalgeng no-capieng no-hw-padlock no-dgram no-gost no-comp \
            no-devcryptoeng no-zlib no-async no-idea no-mdc2 no-rc5 no-ec2m no-sm4 no-ssl2 no-ssl3 no-seed no-weak-ssl-ciphers \
            -Wa,--noexecstack
            
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
           # no-asm no-autoerrinit no-cms no-ec no-ec2m \
 
# Make
make 
# Make Install - https://github.com/openssl/openssl/issues/8170 for no docs!
make install_sw install_ssldirs

rm "$ssl_prefix"/bin/c_rehash

# Finished!
echo "OpenSSL is now compiled and installed!"