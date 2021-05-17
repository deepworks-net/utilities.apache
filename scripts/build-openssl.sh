#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Build OpenSSL
echo "Building OpenSSL..."
# Make openssl-build directory
mkdir -p "dist/openssl-build"
# Move source files
cp -R dist/openssl-src/* dist/openssl-build/
# Move Config files
cp -R configs/openssl/* dist/openssl-build/
# Move build and configure scripts
cp -R build/openssl/* dist/openssl-build/
# Move shared files
cp -R build/shared/* dist/openssl-build/
# Run install
cd "dist/openssl-build" && "./install.sh" && cd "../.."
