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
. "./get-openssl.sh"

# Check for Httpd Source files
. "./get-httpd.sh"

# Install dependencies (that are not built from source! IE gcc, compiler stuff)
echo "Installing Dependencies..."
. "./deps-install.sh"

# Build any libraries that need to be compiled from source before compiling apache
echo "Building Dependencies..."
# Build OpenSSL
. "./build-openssl.sh"

# Build and install apache
. "./build-httpd.sh"

# Completed Compliling Apache
echo "Compiled and Configured Apache!"

# Uninstall tools required to build Apache/Dependencies and keep ones needed to run Apache.
echo "Uninstalling Dependencies..."
. "./deps-uninstall.sh"

# Completed
echo "All Done! Apache installed at: $prefix"