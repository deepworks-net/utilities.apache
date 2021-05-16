#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Run Cleanup
cd "dist/openssl-build" && "./cleanup.sh" && cd "../.."
