# Include shared libs
. "./funcs.sh"

# Function to enable a Component
Enable_Component() { echo "enable-$1 \\" >>$OUT_FILE; }

# Function to disable a component
Disable_Component() { echo "no-$1 \\" >>$OUT_FILE; }

# Check to see if a component should be enabled or not
Check_Component() { 
    eval "ECOMP=\$E_$1" && eval "DCOMP=\$D_$1"
    if test -n "$ECOMP"; then 
        if test "yes" = "$ECOMP"; then Enable_Component $2; fi
        if test "no" = "$ECOMP"; then Disable_Component $2; fi
    fi
    if test -n "$DCOMP"; then 
        if test "yes" = "$DCOMP"; then Disable_Component $2; fi
        if test "no" = "$DCOMP"; then Enable_Component $2; fi
    fi
}

# Check to see if a protocol should be enabled or not
Check_Protocol() { Check_Component "$1" "$2"; }

# Check to see if a protocol should be enabled or not (depreciated)
Check_Protocol_Alt(){ Check_Component "$1-method" "$2"; }

# Check to see if an algorithm should be enabled or not
Check_Algorithm(){ Check_Component "$1" "$2"; }

# Function to enable a Component (alt)
Enable_Component_Alt() { echo "$1 \\" >>$OUT_FILE; }

# Check to see if a component should be enabled or not (alt)
Check_Component_Alt() { 
    eval "ECOMP=\$E_$1" && eval "DCOMP=\$D_$1"
    if test -n "$ECOMP"; then 
        if test "yes" = "$ECOMP"; then Enable_Component_Alt $2; fi
        if test "no" = "$ECOMP"; then Disable_Component $2; fi
    fi
    if test -n "$DCOMP"; then 
        if test "yes" = "$DCOMP"; then Disable_Component $2; fi
        if test "no" = "$DCOMP"; then Enable_Component_Alt $2; fi
    fi
}

# Add Compiler Option
Add_Compiler_Option(){ echo "-$1 \\" >>$OUT_FILE; }

# Check to see if a compiler option should be added
Check_Compiler_Option(){
    eval "_OPT=\$W$1"
    if test -n "$_OPT"; then Add_Compiler_Option "$2"; fi
}
