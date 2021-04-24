#!/bin/sh

# Assumes that wget and tar are installed!

# Get our passed in options and set defaults
while getopts "h:m:o:f:u:a:" opt; do
	case "${opt}" in
		h  ) HTTPDSRC="${OPTARG}";;
		f  ) FCGIDSRC="${OPTARG}";;
        a  ) APRSRC="${OPTARG}";;
        u  ) APRUTILSRC="${OPTARG}";;
        s  ) OPENSSLSRC="${OPTARG}";;
        m  ) MRR="${OPTARG}";;
        o  ) OUT="${OPTARG}";;
		\? ) echo "Usage: sync [-o]: out - the root output directory
                           [-h]: httpdsrc - the source package for apache to get
                           [-f]: fcgidsrc - the source package for mod_fcgid to get
                           [-a]: aprsrc - the source package for apr to get
                           [-u]: aprutilsrc - the source package for apr-util to get
                           [-s]: opensslsrc - the source package for openssl to get
                           [-m]: mrr - the mirror to use to download apache sources";;
	esac
done

# Set the default output directory for the source files if not defined
if test -z "$OUT"; then OUT="/src"; fi

# Set the default httpd source version if not defined
if test -z "$HTTPDSRC"; then HTTPDSRC="httpd-2.4.46"; fi

# Set the default mod_fcgid source version if not defined
if test -z "$FCGIDSRC"; then FCGIDSRC="mod_fcgid-2.3.9"; fi

# Set the default apr source version if not defined
if test -z "$APRSRC"; then APRSRC="apr-1.7.0"; fi

# Set the default apr-util source version if not defined
if test -z "$APRUTILSRC"; then APRUTILSRC="apr-util-1.6.1"; fi

# Set the default openssl source version if not defined
if test -z "$OPENSSLSRC"; then OPENSSLSRC="openssl-1.1.1k"; fi

# Set the default mirror url if not defined
if test -z "$MRR"; then MRR="ftp.wayne.edu/apache"; fi

# Default Zipped Archives
_HSRC="$HTTPDSRC.tar.bz2"
_FSRC="$FCGIDSRC.tar.bz2"
_APRSRC="$APRSRC.tar.bz2"
_APRUTILSRC="$APRUTILSRC.tar.bz2"
_OPENSSLSRC="$OPENSSLSRC.tar.gz"

cd "${OUT}"

mkdir "${OUT}/zip"

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
tar -xjvf "${_HSRC}" && mv "${HTTPDSRC}" "httpd"

# Get Apache FCGID sha256
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
tar -xjvf "${_FSRC}" && mv "${FCGIDSRC}" "mod_fcgid"

echo "Getting APR Sources"
# get into srclib directory
#cd "httpd/srclib"

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

# unpack
tar -xjvf "${_APRSRC}" && mv "${APRSRC}" "apr"
tar -xjvf "${_APRUTILSRC}" && mv "${APRUTILSRC}" "apr-util"

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
tar -xzvf "${_OPENSSLSRC}" && mv "${OPENSSLSRC}" "openssl"

# Clean Up
rm -f "${_APRSRC}.sha256"
mv "${_APRSRC}" "${OUT}/zip/${_APRSRC}"
rm -f "${_APRUTILSRC}.sha256"
mv "${_APRUTILSRC}" "${OUT}/zip/${_APRUTILSRC}"

rm -f "${_OPENSSLSRC}.sha256"
mv "${_OPENSSLSRC}" "${OUT}/zip/${_OPENSSLSRC}"

cd "${OUT}"

# Clean Up
rm -f "${OUT}/${_HSRC}.sha256"
mv "${OUT}/${_HSRC}" "${OUT}/zip/${_HSRC}"
rm -f "${OUT}/${_FSRC}.sha1"
mv "${OUT}/${_FSRC}" "${OUT}/zip/${_FSRC}"

# Set permissions
chmod 777 -R "${OUT}"