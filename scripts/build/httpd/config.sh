#!/bin/sh

# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Check for parameters
while getopts "o:f:" opt; do
	case "${opt}" in
		o  ) HTTPD_CONFIG="${OPTARG}";;
		f  ) HTTPD_CONFIG_FILE="${OPTARG}";;
		\? ) echo "Usage: cmd [-o]";;
	esac
done

if test -z "$HTTPD_CONFIG"; then
  HTTPD_CONFIG="Default"
fi

# Default config file location
if test -z "$HTTPD_CONFIG_FILE"; then 
    HTTPD_CONFIG_FILE="/etc/profile.d/apache-config.sh"; 
fi

# Add the config defaults
. "./config_defaults.sh"

# Add the parse functions
. "./parse.sh"

# Parse the file!
Parse_File "config.httpd" "$HTTPD_CONFIG" "$CONFIG_LIST" "$HTTPD_CONFIG_FILE" "[cC]onfiguration"

# Read in what we parsed from the configuration to make them env vars
. "$HTTPD_CONFIG_FILE"
