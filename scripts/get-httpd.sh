#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Check for Httpd Source files
echo "Checking for Httpd Source Files..."
if ! [ -d "dist/httpd-src" ]; then
    # Download The OpenSSL Sources
    echo "Httpd Sources Do Not Exist. Downloading Httpd Sources Now..."
    # Make sources dist directory
    mkdir -p "dist/httpd-src"
    # Enter the sources directory, download a fresh copy, and back out of the sources directory
    cd "sources" && . "./httpd-src.sh" && cd ..
    # Move the sources to the dist directory
    cp -R sources/httpd-src/httpd/* dist/httpd-src/
fi
