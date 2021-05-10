#!/bin/sh

# Default Layout in case it does not exist
if test -z "$LAYOUT"; then LAYOUT="Apache"; fi

# Default Options in case it does not exist
if test -z "$OPTIONS"; then OPTIONS="All"; fi

# Set the current build config file location
OUT_FILE="build-config.sh"

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

# Read In Our Configurations
"./layout.sh" -l "$LAYOUT"
"./options.sh" -o "$OPTIONS"

# Read in what we parsed from the configuration to make them env vars
. "/etc/profile"

# Remove the file if it already exists (just in case!)
rm -f $OUT_FILE

# Create first line and set permissions for the outfile
echo "#!/bin/sh" >>$OUT_FILE && chmod 777 $OUT_FILE
# Figure out which ones are used and build call?
#cat "/tmp/apache-build-options"

# Check for flags
if test -n "$WCC"; then Add_Flag "CC" "$WCC"; fi
if test -n "$WCFLAGS"; then Add_Flag "CFLAGS" "$WCFLAGS"; fi
if test -n "$WCXXFLAGS"; then Add_Flag "CXXFLAGS" "$WCXXFLAGS"; fi
if test -n "$WLDFLAGS"; then Add_Flag "LDFLAGS" "$WLDFLAGS"; fi
if test -n "$WLIBS"; then Add_Flag "LIBS" "$WLIBS"; fi
if test -n "$WCPPFLAGS"; then Add_Flag "CPPFLAGS" "$WCPPFLAGS"; fi
if test -n "$WCPP"; then Add_Flag "CPP" "$WCPP"; fi

echo "\"./configure\" \\" >>$OUT_FILE

if test -n "$QUIET"; then Add_Option "quiet"; fi # Check for quiet flag
if test -n "$SILENT"; then Add_Option "silent"; fi # Check for silent flag

if test -n "$WBUILD"; then Add_Option_Val "build" $WBUILD; fi
if test -n "$WHOST"; then Add_Option_Val "host" $WHOST; fi
if test -n "$WTARGET"; then Add_Option_Val "target" $WTARGET; fi

if test -n "$WPREFIX"; then Add_Option_Val "prefix" $WPREFIX; fi
if test -n "$WEXEC_PREFIX"; then Add_Option_Val "exec-prefix" $WEXEC_PREFIX; fi
if test -n "$WBINDIR"; then Add_Option_Val "bindir" $WBINDIR; fi
if test -n "$WSBINDIR"; then Add_Option_Val "sbindir" $WSBINDIR; fi
if test -n "$WLIBEXECDIR"; then Add_Option_Val "libexecdir" $WLIBEXECDIR; fi
if test -n "$WSYSCONFDIR"; then Add_Option_Val "sysconfdir" $WSYSCONFDIR; fi
if test -n "$WSHAREDSTATEDIR"; then Add_Option_Val "sharedstatedir" $WSHAREDSTATEDIR; fi
if test -n "$WLOCALSTATEDIR"; then Add_Option_Val "localstatedir" $WLOCALSTATEDIR; fi
if test -n "$WRUNSTATEDIR"; then Add_Option_Val "runstatedir" $WRUNSTATEDIR; fi
if test -n "$WLIBDIR"; then Add_Option_Val "libdir" $WLIBDIR; fi
if test -n "$WINCLUDEDIR"; then Add_Option_Val "includedir" $WINCLUDEDIR; fi
if test -n "$WOLDINCLUDEDIR"; then Add_Option_Val "oldincludedir" $WOLDINCLUDEDIR; fi
if test -n "$WDATAROOTDIR"; then Add_Option_Val "datarootdir" $WDATAROOTDIR; fi
if test -n "$WDATADIR"; then Add_Option_Val "datadir" $WDATADIR; fi
if test -n "$WINFODIR"; then Add_Option_Val "infodir" $WINFODIR; fi
if test -n "$WLOCALEDIR"; then Add_Option_Val "localedir" $WLOCALEDIR; fi
if test -n "$WMANDIR"; then Add_Option_Val "mandir" $WMANDIR; fi
if test -n "$WDOCDIR"; then Add_Option_Val "docdir" $WDOCDIR; fi
if test -n "$WHTMLDIR"; then Add_Option_Val "htmldir" $WHTMLDIR; fi
if test -n "$WDVIDIR"; then Add_Option_Val "dvidir" $WDVIDIR; fi
if test -n "$WPDFDIR"; then Add_Option_Val "pdfdir" $WPDFDIR; fi
if test -n "$WPSDIR"; then Add_Option_Val "psdir" $WPSDIR; fi

if test -n "$EDTRACE"; then Add_Option "enable-dtrace"; fi # Check to enable dtrace
if test -n "$EHOOK_PROBES"; then Add_Option "enable-hook-probes"; fi # Check to enable hook probes
if test -n "$EEXCEPTION_HOOK"; then Add_Option "enable-exception-hook"; fi # Check to enable exception hook
if test -n "$ELOAD_ALL_MODULES"; then Add_Option "enable-load-all-modules"; fi # Check to enable loading of all modules
if test -n "$EMAINTAINER_MODE"; then Add_Option "enable-maintainer-mode"; fi # Check to enable maintainer mode
if test -n "$EDEBUGGER_MODE"; then Add_Option "enable-debugger-mode"; fi # Check to enable debugger mode
if test -n "$EPIE"; then Add_Option "enable-pie"; fi # Check to add enable-pie (position independent executable)
if test -n "$EMODS"; then Enable_Mod "modules" $EMODS; fi # Check to add enable-modules option
if test -n "$EMODS_SHARED"; then Enable_Mod "mods-shared" $EMODS_SHARED; fi # Check to add enable-mods-shared option
if test -n "$EMODS_STATIC"; then Enable_Mod "mods-static" $EMODS_STATIC; fi # Check to add enable-mods-static option
if test -n "$EMPMS_SHARED"; then Enable_Mod "mpms-shared" $EMPMS_SHARED; fi # Check to add enable-mpms-shared option

if test -n "$EOPTION_CHECKING"; then Add_Option "enable-option-checking"; fi # Check for enable-option-checking option
if test -n "$DOPTION_CHECKING"; then Add_Option "disable-option-checking"; fi # Check for disable-option-checking option

if test -n "$WMPM"; then Add_Option_Val "with-mpm" $WMPM; fi # Check for mpm options

if test -n "$WMODULE"; then Add_Option_Val "with-module" $WMODULE; fi # Check for module options

if test -n "$WINCLUDED_APR"; then Add_Option "with-included-apr"; fi # Check to add with included apr option

if test -n "$WPORT"; then Add_Option_Val "with-port" $WPORT; fi # Check for port option
if test -n "$WSSLPORT"; then Add_Option_Val "with-sslport" $WSSLPORT; fi # Check for ssl port option

if test -n "$WPROGRAM_NAME"; then Add_Option "with-program-name"; fi # Check to add option
if test -n "$WSUEXEC_BIN"; then Add_Option "with-suexec-bin"; fi # Check to add option
if test -n "$WSUEXEC_CALLER"; then Add_Option "with-suexec-caller"; fi # Check to add option
if test -n "$WSUEXEC_USERDIR"; then Add_Option "with-suexec-userdir"; fi # Check to add option
if test -n "$WSUEXEC_DOCROOT"; then Add_Option "with-suexec-docroot"; fi # Check to add option
if test -n "$WSUEXEC_UIDMIN"; then Add_Option "with-suexec-uidmin"; fi # Check to add option
if test -n "$WSUEXEC_GIDMIN"; then Add_Option "with-suexec-gidmin"; fi # Check to add option
if test -n "$WSUEXEC_LOGFILE"; then Add_Option "with-suexec-logfile"; fi # Check to add option
if test -n "$WSUEXEC_SYSLOG"; then Add_Option "with-suexec-syslog"; fi # Check to add option
if test -n "$WSUEXEC_SAFEPATH"; then Add_Option "with-suexec-safepath"; fi # Check to add option
if test -n "$WSUEXEC_UMASK"; then Add_Option "with-suexec-umask"; fi # Check to add option


# Check to manually add/remove options
Check_Pack APR "apr"
Check_Pack APR_UTIL "apr-util"
Check_Pack PCRE "pcre"
Check_Pack DISTCACHE "distcache"
Check_Pack Z "z"
Check_Pack LIBXML2 "libxml2"
Check_Pack BROTLI "brotli"
Check_Pack LUA "lua"
Check_Pack SSL "ssl"
Check_Pack NGHTTP2 "nghttp2"
Check_Pack JANSSON "jansson"
Check_Pack CURL "curl"

# Check to manually enable/disable options
Check_Mod AUTHN_FILE "authn-file"
Check_Mod AUTHN_DBM "authn-dbm"
Check_Mod AUTHN_ANON "authn-anon"
Check_Mod AUTHN_DBD "authn-dbd"
Check_Mod AUTHN_SOCACHE "authn-socache"
Check_Mod AUTHN_CORE "authn-core"

Check_Mod AUTHZ_HOST "authz-host"
Check_Mod AUTHZ_GROUPFILE "authz-groupfile"
Check_Mod AUTHZ_USER "authz-user"
Check_Mod AUTHZ_DBM "authz-dbm"
Check_Mod AUTHZ_OWNER "authz-owner"
Check_Mod AUTHZ_DBD "authz-dbd"
Check_Mod AUTHZ_CORE "authz-core"
Check_Mod AUTHZ_LDAP "authz-ldap"
Check_Mod AUTHZ_FCGI "authz-fcgi"

Check_Mod ACCESS_COMPAT "access-compat"

Check_Mod AUTH_BASIC "auth-basic"
Check_Mod AUTH_FORM "auth-form"
Check_Mod AUTH_DIGEST "auth-digest"

Check_Mod ALLOWMETHODS "allowmethods"
Check_Mod ISAPI "isapi"
Check_Mod FILE_CACHE "file-cache"

Check_Mod CACHE "cache"
Check_Mod CACHE_DISK "cache-disk"
Check_Mod CACHE_SOCACHE "cache-socache"

Check_Mod SOCACHE_SHMCB "socache-shmcb"
Check_Mod SOCACHE_DBM "socache-dbm"
Check_Mod SOCACHE_MEMCACHE "socache-memcache"
Check_Mod SOCACHE_REDIS "socache-redis"
Check_Mod SOCACHE_DC "socache-dc"

Check_Mod SO "so"

Check_Mod WATCHDOG "watchdog"
Check_Mod MACRO "macro"
Check_Mod DBD "dbd"
Check_Mod BUCKETEER "bucketeer"
Check_Mod DUMPIO "dumpio"
Check_Mod ECHO "echo"

Check_Mod EXAMPLE_HOOKS "example-hooks"
Check_Mod CASE_FILTER "case-filter"
Check_Mod CASE_FILTER_IN "case-filter-in"
Check_Mod EXAMPLE_IPC "example-ipc"

Check_Mod BUFFER "buffer"
Check_Mod DATA "data"
Check_Mod RATELIMIT "ratelimit"
Check_Mod REQTIMEOUT "reqtimeout"
Check_Mod EXT_FILTER "ext-filter"
Check_Mod REQUEST "request"
Check_Mod INCLUDE "include"
Check_Mod FILTER "filter"
Check_Mod REFLECTOR "reflector"
Check_Mod SUBSTITUTE "substitute"
Check_Mod SED "sed"

Check_Mod CHARSET_LITE "charset-lite"
Check_Mod DEFLATE "deflate"
Check_Mod XML2ENC "xml2enc"
Check_Mod PROXY_HTML "proxy-html"
Check_Mod BROTLI "brotli"

Check_Mod HTTP "http"
Check_Mod MIME "mime"
Check_Mod LDAP "ldap"

Check_Mod LOG_CONFIG "log-config"
Check_Mod LOG_DEBUG "log-debug"
Check_Mod LOG_FORENSIC "log-forensic"
Check_Mod LOGIO "logio"

Check_Mod LUA "lua"
Check_Mod LUAJIT "luajit"
Check_Mod ENV "env"

Check_Mod MIME_MAGIC "mime-magic"

Check_Mod CERN_META "cern-meta"
Check_Mod EXPIRES "expires"
Check_Mod HEADERS "headers"
Check_Mod IDENT "ident"
Check_Mod USERTRACK "usertrack"
Check_Mod UNIQUE_ID "unique-id"
Check_Mod SETENVIF "setenvif"
Check_Mod VERSION "version"
Check_Mod REMOTEIP "remoteip"

Check_Mod PROXY "proxy"
Check_Mod PROXY_CONNECT "proxy-connect"
Check_Mod PROXY_FTP "proxy-ftp"
Check_Mod PROXY_HTTP "proxy-http"
Check_Mod PROXY_FCGI "proxy-fcgi"
Check_Mod PROXY_SCGI "proxy-scgi"
Check_Mod PROXY_UWSGI "proxy-uwsgi"
Check_Mod PROXY_FDPASS "proxy-fdpass"
Check_Mod PROXY_WSTUNNEL "proxy-wstunnel"
Check_Mod PROXY_AJP "proxy-ajp"
Check_Mod PROXY_BALANCER "proxy-balancer"
Check_Mod PROXY_EXPRESS "proxy-express"
Check_Mod PROXY_HCHECK "proxy-hcheck"

Check_Mod SESSION "session"
Check_Mod SESSION_COOKIE "session-cookie"
Check_Mod SESSION_CRYPTO "session-crypto"
Check_Mod SESSION_DBD "session-dbd"

Check_Mod SLOTMEM_SHM "slotmem-shm"
Check_Mod SLOTMEM_PLAIN "slotmem-plain"

Check_Mod SSL "ssl"
Check_Mod SSL_STATICLIB_DEPS "ssl-staticlib-deps"

Check_Mod OPTIONAL_HOOK_EXPORT "optional-hook-export"
Check_Mod OPTIONAL_HOOK_IMPORT "optional-hook-import"
Check_Mod OPTIONAL_FN_IMPORT "optional-fn-import"
Check_Mod OPTIONAL_FN_EXPORT "optional-fn-export"

Check_Mod DIALUP "dialup"

Check_Mod STATIC_SUPPORT "static-support"
Check_Mod STATIC_HTPASSWD "static-htpasswd"
Check_Mod STATIC_HTDIGEST "static-htdigest"
Check_Mod STATIC_ROTATELOGS "static-rotatelogs"
Check_Mod STATIC_LOGRESOLVE "static-logresolve"
Check_Mod STATIC_HTDBM "static-htdbm"
Check_Mod STATIC_AB "static-ab"
Check_Mod STATIC_CHECKGID "static-checkgid"
Check_Mod STATIC_HTCACHECLEAN "static-htcacheclean"
Check_Mod STATIC_HTTXT2DBM "static-httxt2dbm"
Check_Mod STATIC_FCGISTARTER "static-fcgistarter"

Check_Mod HTTP2 "http2"
Check_Mod NGHTTP2_STATICLIB_DEPS "nghttp2-staticlib-deps"
Check_Mod PROXY_HTTP2 "proxy-http2"

Check_Mod MD "md"
Check_Mod JANSSON_STATICLIB_DEPS "jansson-staticlib-deps"
Check_Mod CURL_STATICLIB_DEPS "curl-staticlib-deps"

Check_Mod LBMETHOD_BYREQUESTS "lbmethod-byrequests"
Check_Mod LBMETHOD_BYTRAFFIC "lbmethod-bytraffic"
Check_Mod LBMETHOD_BYBUSYNESS "lbmethod-bybusyness"
Check_Mod LBMETHOD_HEARTBEAT "lbmethod-heartbeat"

Check_Mod UNIXD "unixd"
Check_Mod PRIVILEGES "privileges"
Check_Mod SYSTEMD "systemd"

Check_Mod HEARTBEAT "heartbeat"
Check_Mod HEARTMONITOR "heartmonitor"

Check_Mod DAV "dav"
Check_Mod STATUS "status"
Check_Mod AUTOINDEX "autoindex"
Check_Mod ASIS "asis"
Check_Mod INFO "info"
Check_Mod SUEXEC "suexec"

Check_Mod CGID "cgid"
Check_Mod CGI "cgi"
Check_Mod DAV_FS "dav-fs"
Check_Mod DAV_LOCK "dav-lock"
Check_Mod VHOST_ALIAS "vhost-alias"
Check_Mod NEGOTIATION "negotiation"
Check_Mod DIR "dir"
Check_Mod IMAGEMAP "imagemap"
Check_Mod ACTIONS "actions"

Check_Mod SPELING "speling"
Check_Mod USERDIR "userdir"

Check_Mod ALIAS "alias"
Check_Mod REWRITE "rewrite"
Check_Mod SUEXEC_CAPABILITIES "suexec-capabilities"
Check_Mod V4_MAPPED "v4-mapped"

Check_Mod FCGID "fcgid"
Check_Mod FILESYSTEM "filesystem"

# Add the layout command line argument
Enable_Mod "layout" $LAYOUT

# Add the make and make install commands
echo "&& make && make install" >>$OUT_FILE

# Set Default APR_PATH
APR_PATH="./srclib/apr"
# Set Default APR_UTIL_PATH
APR_UTIL_PATH="./srclib/apr-util"

# Check for alternate path for APR
if test -n "$WPACK_APR" && ! test "$WPACK_APR" = "no" && ! test "$WPACK_APR" = "yes"; then
  APR_PATH="$WPACK_APR"
fi

# Check for alternate path for APR-UTIL
if test -n "$WPACK_APR_UTIL" && ! test "$WPACK_APR_UTIL" = "no" && ! test "$WPACK_APR_UTIL" = "yes"; then
  APR_UTIL_PATH="$WPACK_APR_UTIL"
fi

"./buildconf" --with-apr=$APR_PATH --with-apr-util=$APR_UTIL_PATH

echo 'Running Configuration: '
cat "$OUT_FILE"
# Configure Reference - http://httpd.apache.org/docs/2.4/programs/configure.html
# Run the file which executes the Configure, Make, and Install
"./$OUT_FILE"

EXTRAS_DIR="$sysconfdir/extra"

# Add Default Config Files
if test -n "$EMOD_SPELING"; then
  # Make default speling config file
cat >"$EXTRAS_DIR/httpd-speling.conf"<<_ACEOF
<IfModule mod_speling.c>
  CheckSpelling On
  CheckCaseOnly On
</IfModule>
_ACEOF
fi

if test -n "$EMOD_REWRITE"; then 
    # Make default redirect config file
cat >"$EXTRAS_DIR/httpd-rewrite.conf"<<_ACEOF

_ACEOF
fi

if test -n "$EMOD_HTTP2"; then 
    # Make default http2 config file
cat >"$EXTRAS_DIR/httpd-http2.conf"<<_ACEOF
<IfModule mod_http2.c>
  Protocols h2 h2c http/1.1
</IfModule>
_ACEOF
fi

if test -n "$EMOD_DEFLATE"; then 
    # Make default deflate config file
cat >"$EXTRAS_DIR/httpd-deflate.conf"<<_ACEOF
<IfModule mod_mime.c>
    AddType application/x-javascript .js
    AddType text/css .css
    AddType application/json .json
</IfModule>

<IfModule mod_deflate.c>
  AddOutputFilterByType DEFLATE text/plain
  AddOutputFilterByType DEFLATE text/html
  AddOutputFilterByType DEFLATE text/xml
  AddOutputFilterByType DEFLATE text/css
  AddOutputFilterByType DEFLATE application/xml
  AddOutputFilterByType DEFLATE application/xhtml xml
  AddOutputFilterByType DEFLATE application/rss xml
  AddOutputFilterByType DEFLATE application/javascript
  AddOutputFilterByType DEFLATE application/x-javascript
  AddOutputFilterByType DEFLATE application/json

  <IfModule mod_setenvif.c>
      BrowserMatch ^Mozilla/4 gzip-only-text/html
      BrowserMatch ^Mozilla/4.0[678] no-gzip
      BrowserMatch bMSIE !no-gzip !gzip-only-text/html
  </IfModule>
  Header append Vary User-Agent env=!dont-vary
</IfModule>
_ACEOF
fi

if test -n "$EMOD_SSL"; then 
  # 'Fix' The SSL File
cat >"$EXTRAS_DIR/httpd-ssl.conf"<<_ACEOF
Listen 443 https

SSLHonorCipherOrder on

SSLCipherSuite HIGH:MEDIUM:!MD5:!RC4:!3DES
SSLProxyCipherSuite HIGH:MEDIUM:!MD5:!RC4:!3DES

SSLProtocol +TLSv1.2
SSLProtocol ALL -SSLv2 -SSLv3 -TLSv1 -TLSv1.1

SSLCryptoDevice builtin

SSLSessionCache         shmcb:/run/httpd/sslcache(512000)
SSLSessionCacheTimeout  300
_ACEOF

fi

# Check and create symlinks if modules is installed elsewhere (and others)?

