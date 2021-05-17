#!/bin/sh

# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Check for parameters
while getopts "o:" opt; do
	case "${opt}" in
		o  ) SSL_OPTIONS="${OPTARG}";;
		\? ) echo "Usage: cmd [-o]";;
	esac
done

# Check for options and set the defaults if not passed
if test -z "$SSL_OPTIONS"; then
  SSL_OPTIONS="Minimal"
fi

# Default config file location
if test -z "$SSL_OPTIONS_FILE"; then 
    SSL_OPTIONS_FILE="/etc/profile.d/openssl-options.sh"; 
fi

# Add the parse functions
. "./parse.sh"

# Add the options list
. "./options_defaults.sh"

# Parse the file!
C_NAME="[cC]onfiguration"; Parse_File "config.options" "$SSL_OPTIONS" "$OPTOMUNDO" "$SSL_OPTIONS_FILE"

# Read in what we parsed from the configuration to make them env vars
. "$SSL_CONFIG_FILE"
