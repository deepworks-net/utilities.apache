#!/bin/sh

# Assumes that wget and tar are installed!

# Get our passed in options and set defaults
while getopts "s:" opt; do
	case "${opt}" in
        s  ) OPENSSLSRC="${OPTARG}";;
		\? ) echo "Usage: [-s]: opensslsrc - the source package for openssl to get";;
	esac
done

# Set the default openssl source version if not defined
if test -z "$OPENSSLSRC"; then OPENSSLSRC="openssl-1.1.1n"; fi

# Set the 'OUT directory'
OUT="openssl-src";
# Set the default output directory for the source files if not defined
#if test -z "$OUT"; then OUT="openssl-src"; fi

# Default Zipped Archives
_OPENSSLSRC="$OPENSSLSRC.tar.gz"

# Make the OUT directory
mkdir -p "${OUT}"

# CD into the OUT directory
cd "${OUT}"

# Make Directories
mkdir -p "zip" && mkdir -p "src" && mkdir -p "openssl"

# Get OpenSSL Source Files!
wget "https://www.openssl.org/source/${_OPENSSLSRC}"

# Check SHA256!
# Test OpenSSL
sha256sum "${_OPENSSLSRC}"
if ! sha256sum -c "../sums/${_OPENSSLSRC}.sha256"; then
    echo "sha256 Checksum failed for openssl" >&2
    exit 1
fi

# unpack
tar -xzvf "${_OPENSSLSRC}" && mv "${OPENSSLSRC}" "src/openssl" && cp -R src/openssl/* openssl/ && mv "${_OPENSSLSRC}" "zip/${_OPENSSLSRC}"

# Back up out of the OUT directory
cd ..

# Set permissions
chmod 777 -R "${OUT}"