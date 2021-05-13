#!/bin/sh

# Check for OpenSSL Source files
echo "Checking for OpenSSL Source Files..."
if ! [ -d "dist/openssl-src" ]; then
    # Download The OpenSSL Sources
    echo "OpenSSL Sources Do Not Exist. Downloading OpenSSL Sources Now..."
    # Make sources dist directory
    mkdir -p "dist/openssl-src"
    # Enter the sources directory, download a fresh copy, and back out of the sources directory
    cd "sources" && . "./openssl-src.sh" && cd ..
    # Move the sources to the dist directory
    cp -R sources/openssl-src/openssl/* dist/openssl-src/
fi
