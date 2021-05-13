#!/bin/sh

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
"./config" zlib --prefix=$ssl_prefix --openssldir=$ssl_dir
# Make
make 
# Make Install - https://github.com/openssl/openssl/issues/8170 for no docs!
make install_sw

# Finished!
echo "OpenSSL is now compiled and installed!"