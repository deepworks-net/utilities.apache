# Include shared libs
. "./funcs.sh"

# Function to add a Flag beforehand. IE Environment Variables
Add_Flag() { echo "$1=\"$2\" \\" >>$OUT_FILE; }

# Function to add an option '--$var1'
Add_Option() { echo "--$1 \\" >>$OUT_FILE; }

# Function to add an option with a value '--$var1=$var2'
Add_Option_Val() { echo "--$1=$2 \\" >>$OUT_FILE; }

# Function to add the '--with-$var1=$var2' option to the configure command line.
With_Pack() { echo "--with-$1=$2 \\" >>$OUT_FILE; }

# Function to add the '--without-$var1' option to the configure command line.
Without_Pack() { echo "--without-$1 \\" >>$OUT_FILE; }

# Function to add the '--enable-$var1=$var2' option to the configure command line.
Enable_Mod() { echo "--enable-$1=$2 \\" >>$OUT_FILE; }

# Function to add the '--disable-$var1' option to the configure command line.
Disable_Mod() { echo "--disable-$1 \\" >>$OUT_FILE; }

# Function to check if a mod should be enabled/disabled
Check_Pack() { 
  eval "WPACK=\$WPACK_$1" && eval "WOPACK=\$WOPACK_$1"
  if test -n "$WPACK"; then With_Pack $2 $WPACK; fi
  if test -n "$WOPACK"; then Without_Pack $2 $WOPACK; fi
}

# Function to check if a mod should be enabled/disabled
Check_Mod() { 
  eval "EMOD=\$EMOD_$1" && eval "DMOD=\$DMOD_$1"
  if test -n "$EMOD"; then Enable_Mod $2 $EMOD; fi
  if test -n "$DMOD"; then Disable_Mod $2 $DMOD; fi
}