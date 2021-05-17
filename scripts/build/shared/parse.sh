# Parse a configuration file and write to file to export as environmental variables
#
# $1 - The Configuration file to parse IE 'config.layout'
# $2 - Name of the configuration 'object' to parse IE 'Apache'
# $3 - Space delimited list of possible configuration options IE 'prefix exec_prefix bindir sbindir'
# $4 - The file to export the results to IE '/etc/profile.d/apache-config.sh'
#
Parse_File() {

  if test ! -f $1; then
    echo "** Error: Configuration File $1 not found"
    echo "** Error: Cannot use undefined configuration '$2'"
    exit 1
  fi
  # Catch options names including a slash which will otherwise
  # confuse the heck out of the sed script.
  case $2 in
  */*)
    echo "** Error: $2 is not a valid configuration name"
    exit 1 ;;
  esac

  # Check for C_NAME and set default if it does not exist
  if test -z "$C_NAME"; then C_NAME="[cC]onfiguration"; fi

  tmpconf=./config.tmp
  sed -e "1s/[ 	]*<$C_NAME[ 	]*$2[ 	]*>[ 	]*//;1t" \
      -e "1,/[ 	]*<$C_NAME[ 	]*$2[ 	]*>[ 	]*/d" \
      -e "/[ 	]*<\/$C_NAME>[ 	]*/,\$d" \
      -e "s/^[ 	]*//g" \
      -e "s/:[ 	]*/=\'/g" \
      -e "s/[ 	]*$/'/g" \
      $1 > $tmpconf
  config_name=$2
  if test ! -s $tmpconf; then
    echo "** Error: unable to find configuration $config_name"
    exit 1
  fi
  . $tmpconf
  rm $tmpconf
  rm -f "$4"
  for var in $3; do
   eval "val=\"\$$var\""
      val=`echo $val | sed -e 's:\(.\)/*$:\1:'`
      val=`echo $val | sed -e 's:[\$]\([a-z_]*\):$\1:g'`
      if test -n "$val"; then
	      echo "export $var=\"$val\"" >> "$4"
      fi
  done
}