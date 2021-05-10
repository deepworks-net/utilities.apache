#!/bin/sh

# Assumes that wget and tar are installed!

# Get our passed in options and set defaults
while getopts "h:m:f:u:a:" opt; do
	case "${opt}" in
		h  ) HTTPDSRC="${OPTARG}";;
		f  ) FCGIDSRC="${OPTARG}";;
        a  ) APRSRC="${OPTARG}";;
        u  ) APRUTILSRC="${OPTARG}";;
        m  ) MRR="${OPTARG}";;
		\? ) echo "Usage: [-h]: httpdsrc - the source package for apache to get
                           [-f]: fcgidsrc - the source package for mod_fcgid to get
                           [-a]: aprsrc - the source package for apr to get
                           [-u]: aprutilsrc - the source package for apr-util to get
                           [-m]: mrr - the mirror to use to download apache sources";;
	esac
done

# Set the 'OUT directory'
OUT="httpd-src"

# Set the default output directory for the source files if not defined
#if test -z "$OUT"; then OUT="httpd-build"; fi

# Set the default httpd source version if not defined
if test -z "$HTTPDSRC"; then HTTPDSRC="httpd-2.4.46"; fi

# Set the default mod_fcgid source version if not defined
if test -z "$FCGIDSRC"; then FCGIDSRC="mod_fcgid-2.3.9"; fi

# Set the default apr source version if not defined
if test -z "$APRSRC"; then APRSRC="apr-1.7.0"; fi

# Set the default apr-util source version if not defined
if test -z "$APRUTILSRC"; then APRUTILSRC="apr-util-1.6.1"; fi

# Set the default mirror url for apache if not defined
if test -z "$MRR"; then MRR="ftp.wayne.edu/apache"; fi

# Default Zipped Archives
_HSRC="$HTTPDSRC.tar.bz2"
_FSRC="$FCGIDSRC.tar.bz2"
_APRSRC="$APRSRC.tar.bz2"
_APRUTILSRC="$APRUTILSRC.tar.bz2"

# Make the OUT directory
mkdir -p "${OUT}"

# CD into the OUT directory
cd "${OUT}"

# Make Directories
mkdir "zip" && mkdir "src" && mkdir "httpd"

# Get Apache sha256
echo "740eddf6e1c641992b22359cabc66e6325868c3c5e2e3f98faf349b61ecf41ea *${_HSRC}" >"${_HSRC}.sha256" 
# Get Apache Sources:
wget "https://${MRR}/httpd/${_HSRC}"

# Test to see if it is valid - Check SHA256
sha256sum "${_HSRC}" 
if ! sha256sum -c -s "${_HSRC}.sha256"; then
    echo "sha256 Checksum failed for httpd" >&2
    exit 1
fi

# Extract apache source files
tar -xjvf "${_HSRC}" && mv "${HTTPDSRC}" "src/httpd" && cp -R src/httpd/* httpd/ && mv "${_HSRC}" "zip/${_HSRC}"

# Get Apache FCGID sha1
echo "f0b6d87dfcfe18b318905a3f91274051f3f17945 *${_FSRC}" >"${_FSRC}.sha1"
# Get Apache FCGID source files
wget "https://${MRR}/httpd/mod_fcgid/${_FSRC}"

# Test to see if it is valid - Check SHA1
sha1sum "${_FSRC}"
if ! sha1sum -c -s "${_FSRC}.sha1"; then
    echo "sha1 Checksum failed for mod_fcgid" >&2
    exit 1
fi

# Extract apache FCGID source files
tar -xjvf "${_FSRC}" && mv "${FCGIDSRC}" "src/mod_fcgid" && cp -R src/mod_fcgid/* httpd/ && mv "${_FSRC}" "zip/${_FSRC}"

echo "Getting APR Sources"

# Save APR SHA256s!
echo "e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a952f94f5a14436f7ea *${_APRSRC}" >"${_APRSRC}.sha256"
echo "d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b *${_APRUTILSRC}" >"${_APRUTILSRC}.sha256"

# Get APR Source Files!
wget "https://${MRR}/apr/${_APRSRC}"
wget "https://${MRR}/apr/${_APRUTILSRC}"

# Check SHA256!
# Test APR
sha256sum "${_APRSRC}"
if ! sha256sum -c -s "${_APRSRC}.sha256"; then
    echo "sha256 Checksum failed for apr" >&2
    exit 1
fi

# Test APR-UTIL
sha256sum "${_APRUTILSRC}"
if ! sha256sum -c -s "${_APRUTILSRC}.sha256"; then
    echo "sha256 Checksum failed for apr-util" >&2
    exit 1
fi

mkdir "httpd/srclib/apr" && mkdir "httpd/srclib/apr-util"

# unpack
tar -xjvf "${_APRSRC}" && mv "${APRSRC}" "src/apr" && cp -R src/apr/* httpd/srclib/apr/ && mv "${_APRSRC}" "zip/${_APRSRC}"
tar -xjvf "${_APRUTILSRC}" && mv "${APRUTILSRC}" "src/apr-util" && cp -R src/apr-util/* httpd/srclib/apr-util/ && mv "${_APRUTILSRC}" "zip/${_APRUTILSRC}"

# Clean Up
rm -f "${_APRSRC}.sha256"
rm -f "${_APRUTILSRC}.sha256"
rm -f "${_HSRC}.sha256"
rm -f "${_FSRC}.sha1"

# Back up out of the OUT directory
cd ..

# Set permissions
chmod 777 -R "${OUT}"