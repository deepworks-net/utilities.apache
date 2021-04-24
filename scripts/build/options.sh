#!/bin/sh

# Default Out Locations in case it does not exist
if test -z "$OUT"; then OUT="/hank"; fi

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
source "$OUT/options_list.sh"

# Add the parse functions
source "$OUT/parse.sh"

# Parse the file!
Parse_File "config.options" "$OPTIONS" "$OPTOMUNDO"