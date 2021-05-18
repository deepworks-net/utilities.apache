#!/bin/sh

# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Check for parameters
while getopts "l:f:" opt; do
	case "${opt}" in
		l  ) HTTPD_LAYOUT="${OPTARG}";;
		f  ) HTTPD_LAYOUT_FILE="${OPTARG}";;
		\? ) echo "Usage: cmd [-o]";;
	esac
done

# Check for options and set the defaults if not passed
if test -z "$HTTPD_LAYOUT"; then
  HTTPD_LAYOUT="Apache"
fi

# Default config file location
if test -z "$HTTPD_LAYOUT_FILE"; then 
    HTTPD_LAYOUT_FILE="/etc/profile.d/apache-layout.sh"; 
fi

# Include shared libs
. "./parse.sh"

# Include Layout defaults
. "./layout_defaults.sh"

# Parse the file!
Parse_File "config.layout" "$HTTPD_LAYOUT" "$LAYOUT_LIST" "$HTTPD_LAYOUT_FILE" "[lL]ayout"

# Read in what we parsed from the configuration to make them env vars
. "$HTTPD_LAYOUT_FILE"
