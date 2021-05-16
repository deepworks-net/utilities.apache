#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Read in vars
. "/etc/profile.d/apache.sh"

echo "Cleaning Up Apache Install (Removing development/compilation files)" 

# Remove the Apache Header Files as they are no longer needed... (Removes ~2 MB - basically httpd-dev)
rm -r "$includedir" && mkdir -p "$includedir" && rm -r "$iconsdir" && mkdir -p "$iconsdir"

# Also removing the .a files (like ~1 MB) as they are only needed during compilation (apr and apr-util)
rm -f "$prefix/lib/libapr-1.a" && rm -f "$prefix/lib/libaprutil-1.a"
