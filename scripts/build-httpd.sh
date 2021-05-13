#!/bin/sh

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
