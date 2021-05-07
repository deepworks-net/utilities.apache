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
if test -z "$OPENSSLSRC"; then OPENSSLSRC="openssl-1.1.1k"; fi

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
mkdir "zip" && mkdir "src" && mkdir "openssl"

# Get OpenSSL sha256
echo "892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5 *${_OPENSSLSRC}" >"${_OPENSSLSRC}.sha256" 

# Get OpenSSL Source Files!
wget "https://www.openssl.org/source/${_OPENSSLSRC}"

# Check SHA256!
# Test OpenSSL
sha256sum "${_OPENSSLSRC}"
if ! sha256sum -c -s "${_OPENSSLSRC}.sha256"; then
    echo "sha256 Checksum failed for openssl" >&2
    exit 1
fi

# unpack
tar -xzvf "${_OPENSSLSRC}" && mv "${OPENSSLSRC}" "src/openssl" && cp -R src/openssl/* openssl/ && mv "${_OPENSSLSRC}" "zip/${_OPENSSLSRC}"

# Clean Up
rm -f "${_OPENSSLSRC}.sha256"

# Back up out of the OUT directory
cd ..

# Set permissions
chmod 777 -R "${OUT}"