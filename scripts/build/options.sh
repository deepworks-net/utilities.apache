#!/bin/sh

# Check for parameters
while getopts "o:" opt; do
	case "${opt}" in
		o  ) OPTIONS="${OPTARG}";;
		\? ) echo "Usage: cmd [-o]";;
	esac
done

# Check for options and set the defaults if not passed
if test -z "$OPTIONS"; then
  OPTIONS="Apache"
fi

# Add the options list
. "./options_list.sh"

# Add the parse functions
. "./parse.sh"

# Parse the file!
Parse_File "config.options" "$OPTIONS" "$OPTOMUNDO"