#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

while getopts "l:" opt; do
	case "${opt}" in
		l  ) LAYOUT="${OPTARG}";;
		\? ) echo "Usage: cmd [-l]";;
	esac
done

if test -z "$LAYOUT"; then
  LAYOUT="Apache"
fi

  if test ! -f config.layout; then
    echo "** Error: Layout file config.layout not found"
    echo "** Error: Cannot use undefined layout '$LAYOUT'"
    exit 1
  fi
  # Catch layout names including a slash which will otherwise
  # confuse the heck out of the sed script.
  case $LAYOUT in
  */*)
    echo "** Error: $LAYOUT is not a valid layout name"
    exit 1 ;;
  esac
  pldconf=./config.pld

  sed -e "1s/[ 	]*<[lL]ayout[ 	]*$LAYOUT[ 	]*>[ 	]*//;1t" \
      -e "1,/[ 	]*<[lL]ayout[ 	]*$LAYOUT[ 	]*>[ 	]*/d" \
      -e '/[ 	]*<\/Layout>[ 	]*/,$d' \
      -e "s/^[ 	]*//g" \
      -e "s/:[ 	]*/=\'/g" \
      -e "s/[ 	]*$/'/g" \
      config.layout > $pldconf
  layout_name=$LAYOUT
  if test ! -s $pldconf; then
    echo "** Error: unable to find layout $layout_name"
    exit 1
  fi
  . $pldconf
  rm $pldconf
  rm -f "/etc/profile.d/apache.sh"
  for var in prefix exec_prefix bindir sbindir libexecdir mandir proxycachedir \
             sysconfdir datadir includedir localstatedir runtimedir manualdir \
             logfiledir libdir installbuilddir libsuffix errordir iconsdir htdocsdir cgidir; do
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
    if test "$autosuffix" = "yes"; then
      if echo $val | grep apache >/dev/null; then
        addtarget=no
      else
        addtarget=yes
      fi
      if test "$addtarget" = "yes"; then
        val="$val/apache2"
      fi
    fi
	
	eval "val=\"$val\""
	eval "val=\"$val\""
	eval "echo export $var=$val" >> "/etc/profile.d/apache.sh"

  done