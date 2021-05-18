#!/bin/sh

# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

# Default Config in case it does not exist
if test -z "$CONFIG"; then CONFIG="Default"; fi

# Default config file location
if test -z "$HTTPD_CONFIG_FILE"; then HTTPD_CONFIG_FILE="/etc/profile.d/apache-config.sh"; fi

# Read In Our Configurations
"./config.sh" -o "$CONFIG" -f "$HTTPD_CONFIG_FILE" && . "$HTTPD_CONFIG_FILE"

# Function to enable a module in a file
Enable_Mod() { sed -i -e "s/#LoadModule $1/LoadModule $1/g" $2; }

# Function to disable a module in a file
Disable_Mod() { sed -i -e "s/LoadModule $1/#LoadModule $1/g" $2; }

# Function to remove a module line from a file (pull from env variables?)
Remove_Mod() {
  sed -i -e "/#LoadModule $1_module modules\/mod_$1.so/d; /LoadModule $1_module modules\/mod_$1.so/d" $2
}

# Check for sysconfdir and error if it does not exist!
if test -z "$sysconfdir"; then
  echo "ERROR: No sysconfdir found!"
  exit 1
fi

# Check for htdocsdir and error if it does not exist!
if test -z "$htdocsdir"; then
  echo "ERROR: No htdocsdir found!"
  exit 1
fi

# Check for datadir and error if it does not exist!
if test -z "$datadir"; then
  echo "ERROR: No datadir found!"
  exit 1
fi

# Check for user and group and set defaults if don't exist!
# Add this to the default configs in case it is not added!
if test -z "$WUSER"; then 
  WUSER=daemon;
  echo "export WUSER=daemon" >> "/etc/profile.d/apache-config.sh" 
fi
if test -z "$WGROUP"; then 
  WGROUP=daemon;
  echo "export WGROUP=daemon" >> "/etc/profile.d/apache-config.sh"
fi

if test -z "$WSERVERNAME"; then
  WSERVERNAME=localhost;
  echo "export WSERVERNAME=localhost" >> "/etc/profile.d/apache-config.sh"
fi

if test -z "$WSERVERADMIN"; then
  WSERVERADMIN=you@example.com;
  echo "export WSERVERADMIN=you@example.com" >> "/etc/profile.d/apache-config.sh"
fi

# Easy location to our Config File
CONF_FILE="$sysconfdir/httpd.conf"
# Easy location to the extras dir
EXTRAS_DIR="$sysconfdir/extra"
# Make our enabled dir and set as a var
ENABLE_DIR="$sysconfdir/enabled" && mkdir $ENABLE_DIR
# Make our hosts dir and set as a var
HOSTS_DIR="$sysconfdir/hosts" && mkdir $HOSTS_DIR
# Make our user_hosts dir and set as a var
UHOSTS_DIR="$sysconfdir/user_hosts" && mkdir $UHOSTS_DIR
# Make our static html dir and set as a var
HTML_DIR="$datadir/html" && mkdir $HTML_DIR

# Make Server VH file
cat >"$HOSTS_DIR/00-$WSERVERNAME.conf"<<_ACEOF
<VirtualHost *:80>

    ServerName $WSERVERNAME
    ServerAdmin $WSERVERADMIN

    DocumentRoot "$htdocsdir"

    <Directory "$htdocsdir">
        Order allow,deny
        Allow from all
    </Directory>

</VirtualHost>
_ACEOF

# Make default static index file
cat >"$HTML_DIR/index.html"<<_ACEOF
<!DOCTYPE html>
<html>
    <header>

    </header>   

    <body>
        <h1>It works, proof positive!</h1>
        <p>What information do we want here?</p>

    </body>

</html>
_ACEOF

# Update the httpd.conf file
echo "
<LocationMatch \"^/+$\">
  Options -Indexes
  ErrorDocument 403 /.noindex.html
</LocationMatch>

<Directory "$HTML_DIR">
  AllowOverride None
  Require all granted
</Directory>

Alias /.noindex.html $HTML_DIR/index.html

# Load all enabled configurations.
IncludeOptional conf/enabled/*.conf

# Load all hosts
IncludeOptional conf/hosts/*.conf

# Load all user_hosts
IncludeOptional conf/user_hosts/*.conf" >>$CONF_FILE

# Set the server admin
sed -i -e "s/ServerAdmin you@example.com/ServerAdmin $WSERVERADMIN/g" $CONF_FILE

# Set the servername - PORT SHOULD BE THE PORT OPTION VARIABLE!?
sed -i -e "s/#ServerName www.example.com:80/ServerName $WSERVERNAME/g" $CONF_FILE

# add the user and group
#groupadd "$WGROUP"
#useradd -M "$WUSER"
#usermod -L "$WUSER"
#usermod -s /etc/nologin "$WUSER"
#usermod -g "$WGROUP" "$WUSER"

# Set the user and/or group
#sed -i -e "s/User daemon/User $WUSER/g" $CONF_FILE
#sed -i -e "s/Group daemon/Group $WGROUP/g" $CONF_FILE

# Configure the file structure the way we want first!
if test -n "$EMOD_FCGID"; then
  # remove fcgid from the config file (add as extra conf)
  Remove_Mod "fcgid" $CONF_FILE
  # Check to see if FCGI is statically compiled and don't load module if it is
  if test ! "$EMOD_FCGID"="static"; then
    echo "LoadModule fcgid_module modules/mod_fcgid.so" >>"$EXTRAS_DIR/httpd-fcgid.conf"
  fi
fi

## Enable/Disable mods based on configuration
# Enable the unixd module in the configuration
if test -n "$WMOD_UNIXD"; then Enable_Mod "unixd" $CONF_FILE; fi
if test -n "$WOMOD_UNIXD"; then Disable_Mod "unixd" $CONF_FILE; fi

# Enable the speling module in the configuration
if test -n "$WMOD_SPELING"; then 
  Enable_Mod "speling" $CONF_FILE; 
  mv "$EXTRAS_DIR/httpd-speling.conf" "$ENABLE_DIR/httpd-speling.conf";
fi
if test -n "$WOMOD_SPELING"; then Disable_Mod "speling" $CONF_FILE; fi

# Enable the ssl module in the configuration
if test -n "$WMOD_SSL"; then 
  # Enable in the file (if shared module)
  Enable_Mod "ssl" $CONF_FILE;
  # Move over the default ssl configuration
  mv "$EXTRAS_DIR/httpd-ssl.conf" "$ENABLE_DIR/httpd-ssl.conf"; 
  # Make default self signed certificate
  env LD_LIBRARY_PATH="$ssl_prefix/lib" openssl req -new -newkey rsa:4096 -nodes -x509 -subj "/CN=$WSERVERNAME" -keyout $sysconfdir/$WSERVERNAME.key  -out $sysconfdir/$WSERVERNAME.crt
  # Update Server conf
  echo "<VirtualHost *:443>
    ServerName $WSERVERNAME
    ServerAdmin $WSERVERADMIN

    DocumentRoot \"$htdocsdir\"

    ErrorLog \"$logfiledir/error_log\"
    TransferLog \"$logfiledir/access_log\"    

    SSLEngine on

    SSLCertificateFile \"$sysconfdir/$WSERVERNAME.crt\"
    SSLCertificateKeyFile \"$sysconfdir/$WSERVERNAME.key\"

</VirtualHost>" >>"$HOSTS_DIR/00-$WSERVERNAME.conf";
  # Forced Redirect Check
  if test -n "$WMOD_REWRITE" && test -n "$WHTTPS_REDIRECT"; then 
    # Add forced Redirect
    sed -i '/^<VirtualHost \*:80>/a  <IfModule mod_rewrite.c>\n    RewriteEngine On\n    RewriteCond %{HTTPS} !=on\n   	RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]\n </IfModule>' "$HOSTS_DIR/00-$WSERVERNAME.conf";
  fi

  # Enable the http2 module in the configuration
  if test -n "$WMOD_HTTP2"; then 
    Enable_Mod "http2" $CONF_FILE;
    # Move over the default http2 file
    mv "$EXTRAS_DIR/httpd-http2.conf" "$ENABLE_DIR/httpd-http2.conf";
  fi
fi
if test -n "$WOMOD_SSL"; then 
  Disable_Mod "autoindex" $CONF_FILE;
  mv "$ENABLE_DIR/httpd-ssl.conf" "$EXTRAS_DIR/httpd-ssl.conf"; 
fi

# Enable the rewrite module in the configuration
if test -n "$WMOD_REWRITE"; then 
  Enable_Mod "rewrite" $CONF_FILE; 
  # Move over the default redirect configuration
  mv "$EXTRAS_DIR/httpd-rewrite.conf" "$ENABLE_DIR/httpd-rewrite.conf";
fi
if test -n "$WOMOD_REWRITE"; then 
  Disable_Mod "rewrite" $CONF_FILE; 
  # Move over the default redirect configuration
  mv "$ENABLE_DIR/httpd-rewrite.conf" "$EXTRAS_DIR/httpd-rewrite.conf";
fi

# Disable the http2 module in the configuration
if test -n "$WOMOD_HTTP2"; then 
  Disable_Mod "http2" $CONF_FILE; 
fi

if test -n "$WMOD_DEFLATE"; then 
  # Move over the default redirect configuration
  Enable_Mod "deflate" $CONF_FILE;
  mv "$EXTRAS_DIR/httpd-deflate.conf" "$ENABLE_DIR/httpd-deflate.conf";
fi
if test -n "$WOMOD_DEFLATE"; then 
  Disable_Mod "deflate" $CONF_FILE; 
fi

# Enable the autoindex module in the configuration
if test -n "$WMOD_AUTOINDEX"; then Enable_Mod "autoindex" $CONF_FILE; fi
if test -n "$WOMOD_AUTOINDEX"; then Disable_Mod "autoindex" $CONF_FILE; fi

# Enable/Disable the fcgid module in the configuration - This is done to ensure that it is loaded after unixd!
if test -n "$WMOD_FCGID"; then 
  # Move fcgid to enabled directory
  mv "$EXTRAS_DIR/httpd-fcgid.conf" "$ENABLE_DIR/httpd-fcgid.conf"; 
  # Enable unixd, as it is required for FCGID
  Enable_Mod "unixd" $CONF_FILE;
fi
if test -n "$WOMOD_FCGID"; then mv "$ENABLE_DIR/httpd-fcgid.conf" "$EXTRAS_DIR/httpd-fcgid.conf"; fi

