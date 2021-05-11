#!/bin/sh

# Default Layout in case it does not exist
if test -z "$SSL_LAYOUT"; then SSL_LAYOUT="OpenSSL"; fi

# Read In Our Configurations
"./layout.sh" -l "$SSL_LAYOUT"

# Read in what we parsed from the configuration to make them env vars
. "/etc/profile"

# Start configure/install
echo "Configuring/Installing OpenSSL: Prefix: $ssl_prefix, OpenSSLDir: $ssl_dir"

# Configure the Install
"./config" --prefix=$ssl_prefix --openssldir=$ssl_dir
# Make
make 
# Make Install
make install

# Finished!
echo "OpenSSL is now compiled and installed!"