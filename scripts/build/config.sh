#!/bin/sh

# Default Out Locations in case it does not exist
if test -z "$OUT"; then OUT="/hank"; fi

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
source "$OUT/config_list.sh"

# Add the parse functions
source "$OUT/parse.sh"

# Parse the file!
Parse_File "config.httpd" "$CONFIG" "$OPTOMUNDO"
