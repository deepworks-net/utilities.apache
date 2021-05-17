#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Check for parameters
while getopts "o:" opt; do
	case "${opt}" in
		o  ) CONFIG="${OPTARG}";;
		\? ) echo "Usage: cmd [-o]";;
	esac
done

if test -z "$CONFIG"; then
  CONFIG="Default"
fi

# Add the config list
. "./config_list.sh"

# Add the parse functions
. "./parse.sh"

# Parse the file!
Parse_File "config.httpd" "$CONFIG" "$OPTOMUNDO"
