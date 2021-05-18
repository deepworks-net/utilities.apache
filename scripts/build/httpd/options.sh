#!/bin/sh

# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Check for parameters
while getopts "o:f:" opt; do
	case "${opt}" in
		o  ) HTTPD_OPTIONS="${OPTARG}";;
		f  ) HTTPD_OPTIONS_FILE="${OPTARG}";;
		\? ) echo "Usage: cmd [-o]";;
	esac
done

# Check for options and set the defaults if not passed
if test -z "$HTTPD_OPTIONS"; then
  HTTPD_OPTIONS="Apache"
fi

# Default config file location
if test -z "$HTTPD_OPTIONS_FILE"; then 
    HTTPD_OPTIONS_FILE="/etc/profile.d/apache-options.sh"; 
fi

# Add the options list
. "./options_list.sh"

# Add the parse functions
. "./parse.sh"

# Parse the file!
Parse_File "config.options" "$HTTPD_OPTIONS" "$OPTOMUNDO" "$HTTPD_OPTIONS_FILE" "[cC]onfiguration"

# Read in what we parsed from the configuration to make them env vars
. "$HTTPD_OPTIONS_FILE"