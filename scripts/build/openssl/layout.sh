#!/bin/sh
while getopts "l:" opt; do
	case "${opt}" in
		l  ) SSL_LAYOUT="${OPTARG}";;
		\? ) echo "Usage: cmd [-l]";;
	esac
done

if test -z "$SSL_LAYOUT"; then
  SSL_LAYOUT="OpenSSL"
fi

  if test ! -f config.layout; then
    echo "** Error: Layout file config.layout not found"
    echo "** Error: Cannot use undefined layout '$SSL_LAYOUT'"
    exit 1
  fi
  # Catch layout names including a slash which will otherwise
  # confuse the heck out of the sed script.
  case $SSL_LAYOUT in
  */*)
    echo "** Error: $SSL_LAYOUT is not a valid layout name"
    exit 1 ;;
  esac
  pldconf=./config.pld

  sed -e "1s/[ 	]*<[lL]ayout[ 	]*$SSL_LAYOUT[ 	]*>[ 	]*//;1t" \
      -e "1,/[ 	]*<[lL]ayout[ 	]*$SSL_LAYOUT[ 	]*>[ 	]*/d" \
      -e '/[ 	]*<\/Layout>[ 	]*/,$d' \
      -e "s/^[ 	]*//g" \
      -e "s/:[ 	]*/=\'/g" \
      -e "s/[ 	]*$/'/g" \
      config.layout > $pldconf
  layout_name=$SSL_LAYOUT
  if test ! -s $pldconf; then
    echo "** Error: unable to find layout $layout_name"
    exit 1
  fi
  . $pldconf
  rm $pldconf
  rm -f "/etc/profile.d/openssl.sh"
  for var in ssl_prefix ssl_dir; do
    eval "val=\"\$$var\""
    case $val in
      *+)
        val=`echo $val | sed -e 's;\+$;;'`
        eval "$var=\"\$val\""
        autosuffix=yes
        ;;
      *)
        autosuffix=no
        ;;
    esac
	  val=`echo $val | sed -e 's:\(.\)/*$:\1:'`
    val=`echo $val | sed -e 's:[\$]\([a-z_]*\):$\1:g'`
    if test -n "$val"; then
      echo "export $var=\"$val\"" >> "/etc/profile.d/openssl.sh"
    fi

  done