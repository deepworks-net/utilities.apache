#!/bin/sh

# Start The Scripts!
echo "Installing Apache From Source..."

# Test for IMAGE_BASE
if test -z "$IMAGE_BASE"; then 
    echo "ERROR NO IMAGE BASE FOUND!" && exit 1
fi

# Do any setup
echo "Setting Up..."
# Make compile directory - this is where downloaded sources and code ready to compile/build is placed
! [ -d "dist" ] && echo "dist/ Does Not Exist!" && mkdir "dist"

# Check for Sources directories
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

# Install dependencies (that are not built from source! IE gcc, compiler stuff)
echo "Installing Dependencies..."
. "./deps-install.sh"

# Build any libraries that need to be compiled from source before compiling apache
echo "Building Dependencies..."
echo "Building OpenSSL..."
# Make openssl-build directory
mkdir -p "dist/openssl-build"
# Move source files
cp -R dist/openssl-src/* dist/openssl-build/
# Move Config files
cp -R configs/openssl/* dist/openssl-build/
# Move build and configure scripts
cp -R build/openssl/* dist/openssl-build/
# Run install
cd "dist/openssl-build" && "./install.sh" && cd "../.."

# Build and install apache
echo "Compiling Apache..."
# Make httpd-build directory
mkdir -p "dist/httpd-build"
# Move source files
cp -R dist/httpd-src/* dist/httpd-build/
# Move Config files
cp -R configs/httpd/* dist/httpd-build/
# Move build and configure scripts
cp -R build/httpd/* dist/httpd-build/
# Run install & configure!
cd "dist/httpd-build" && "./install.sh" && "./configure.sh" && cd "../.."

# Completed Compliling Apache
echo "Compiled Apache!"

# Uninstall tools required to build Apache/Dependencies and keep ones needed to run Apache.
echo "Uninstalling Dependencies..."
. "./deps-uninstall.sh"

# Completed
echo "All Done! Apache installed at: $prefix"