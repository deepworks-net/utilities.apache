#!/bin/sh

# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Check for parameters
while getopts "l:f:" opt; do
	case "${opt}" in
		l  ) SSL_LAYOUT="${OPTARG}";;
		f  ) SSL_LAYOUT_FILE="${OPTARG}";;
		\? ) echo "Usage: cmd [-o]";;
	esac
done

# Check for options and set the defaults if not passed
if test -z "$SSL_LAYOUT"; then
  SSL_LAYOUT="OpenSSL"
fi

# Default config file location
if test -z "$SSL_LAYOUT_FILE"; then 
    SSL_LAYOUT_FILE="/etc/profile.d/openssl-layout.sh"; 
fi

# Include shared libs
. "./parse.sh"

# Include Layout defaults
. "./layout_defaults.sh"

# Parse the file!
Parse_File "config.layout" "$SSL_LAYOUT" "$LAYOUT_LIST" "$SSL_LAYOUT_FILE" "[lL]ayout"

# Read in what we parsed from the configuration to make them env vars
. "$SSL_LAYOUT_FILE"
