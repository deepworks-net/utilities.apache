# Function to parse a file
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

  tmpconf=./config.tmp
  sed -e "1s/[ 	]*<[cC]onfiguration[ 	]*$2[ 	]*>[ 	]*//;1t" \
      -e "1,/[ 	]*<[cC]onfiguration[ 	]*$2[ 	]*>[ 	]*/d" \
      -e '/[ 	]*<\/configuration>[ 	]*/,$d' \
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
  rm -f "/etc/profile.d/apache-$1.sh"
  for var in $3; do
   eval "val=\"\$$var\""
      val=`echo $val | sed -e 's:\(.\)/*$:\1:'`
      val=`echo $val | sed -e 's:[\$]\([a-z_]*\):$\1:g'`
      if test -n "$val"; then
	      echo "export $var=\"$val\"" >> "/etc/profile.d/apache-$1.sh"
      fi
  done
}