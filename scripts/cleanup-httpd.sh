#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Run Cleanup
cd "dist/httpd-build" && "./cleanup.sh" && cd "../.."
