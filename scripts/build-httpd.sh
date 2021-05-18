#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

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
# Move shared files
cp -R build/shared/* dist/httpd-build/
# Run install & configure!
cd "dist/httpd-build" && echo "Installing Apache..." && "./install.sh" && echo "Configuring Apache..." && "./configure.sh" && cd "../.."
