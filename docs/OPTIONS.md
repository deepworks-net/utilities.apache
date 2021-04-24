# Available Installation Options for Apache
The config.options file provides many different ways to configure which apache modules to build and install. Please consult the configuration file [docs](https://httpd.apache.org/docs/2.4/programs/configure.html) for general options. Consult the configuration file in the httpd sources for all possible options.

## Current supported options
QUIET - translates to --quiet<br/>
SILENT - translates to --silent (same as --quiet)<br/>

WBUILD - translates to --build=(BUILD)<br/>
WHOST - translates to --host=(HOST)<br/>
WTARGET - translates to --target=(TARGET)<br/>

EDTRACE - translates to --enable-dtrace<br/>
EHOOK_PROBES - translates to --enable-hook-probes<br/>
EEXCEPTION_HOOK - translates to --enable-exception-hook<br/>

ELOAD_ALL_MODULES - translates to --enable-load-all-modules<br/>
EMAINTAINER_MODE - translates to --enable-maintainer-mode<br/>
EDEBUGGER_MODE - translates to --enable-debugger-mode<br/>

EPIE - translates to --enable-pie (position independent executable)<br/>

EMODS - translates to --enable-modules=(most|few|none|reallyall|'A list')<br/>
EMODS_SHARED - translates to --enable-mods-shared=(all|most|few|reallyall|'A list')<br/>
EMODS_STATIC - translates to --enable-mods-static=(all|most|few|reallyall|'A list')<br/>
EMPMS_SHARED - translates to --enable-mpms-shared=(all|{event|worker|prefork|winnt})<br/>

EOPTION_CHECKING - translates to --enable-option-checking<br/>
DOPTION_CHECKING - translates to --disable-option-checking<br/>

WMPM - translates to --with-mpm=({event|worker|prefork|winnt})<br/>

WMODULE - translates to --with-module=(module-type:module-file)<br/>

WINCLUDED_APR - translates to --with-included-apr<br/>

WPORT - translates to --with-port=(80)<br/>
WSSLPORT - translates to --with-sslport=(443)<br/>

WPROGRAM_NAME - translates to --with-program-name<br/>
WSUEXEC_BIN - translates to --with-suexec-bin<br/>
WSUEXEC_CALLER - translates to --with-suexec-caller<br/>
WSUEXEC_USERDIR - translates to --with-suexec-userdir<br/>
WSUEXEC_DOCROOT - translates to --with-suexec-docroot<br/>
WSUEXEC_UIDMIN - translates to --with-suexec-uidmin<br/>
WSUEXEC_GIDMIN - translates to --with-suexec-gidmin<br/>
WSUEXEC_LOGFILE - translates to --with-suexec-logfile<br/>
WSUEXEC_SYSLOG - translates to --with-suexec-syslog<br/>
WSUEXEC_SAFEPATH - translates to --with-suexec-safepath<br/>
WSUEXEC_UMASK - translates to --with-suexec-umask<br/>

### Variables
Set environmental variables for compiling.<br/>
WCC - translates to CC="VALUE"<br/>
WCFLAGS - translates to CFLAGS="VALUE"<br/>
WCXXFLAGS - translates to CXXFLAGS="VALUE"<br/>
WLDFLAGS - translates to LDFLAGS="VALUE"<br/>
WLIBS - translates to LIBS="VALUE"<br/>
WCPPFLAGS - translates to CPPFLAGS="VALUE"<br/>
WCPP - translates to CPP="VALUE"<br/>

### Directories
These will override any settings defined in the [layout](config/layout.options) file.<br/>

WPREFIX - translates to --prefix=(DIR)<br/>
WEXEC_PREFIX - translates to --exec-prefix=(DIR)<br/>
WBINDIR - translates to --bindir=(DIR)<br/>
WSBINDIR - translates to --sbindir=(DIR)<br/>
WLIBEXECDIR - translates to --libexecdir=(DIR)<br/>
WSYSCONFDIR - translates to --sysconfdir=(DIR)<br/>
WSHAREDSTATEDIR - translates to --sharedstatedir=(DIR)<br/>
WLOCALSTATEDIR - translates to --localstatedir=(DIR)<br/>
WRUNSTATEDIR - translates to --runstatedir=(DIR)<br/>
WLIBDIR - translates to --libdir=(DIR)<br/>
WINCLUDEDIR - translates to --includedir=(DIR)<br/>
WOLDINCLUDEDIR - translates to --oldincludedir=(DIR)<br/>
WDATAROOTDIR - translates to --datarootdir=(DIR)<br/>
WDATADIR - translates to --datadir=(DIR)<br/>
WINFODIR - translates to --infodir=(DIR)<br/>
WLOCALEDIR - translates to --localedir=(DIR)<br/>
WMANDIR - translates to --mandir=(DIR)<br/>
WDOCDIR - translates to --docdir=(DIR)<br/>
WHTMLDIR - translates to --htmldir=(DIR)<br/>
WDVIDIR - translates to --dvidir=(DIR)<br/>
WPDFDIR - translates to --pdfdir=(DIR)<br/>
WPSDIR - translates to --psdir=(DIR)<br/>

### Packages
Options that start with 'WPACK' will use the package. If no value is passed (you still need the ':' in the config!) it will default to 'yes'. 'no' is the equivalent to any option that starts with 'WOPACK', which will not use the package. 'WOPACK' options do not recognize any value- so it will be ignored if supplied. Possible values for 'WPACK' are: yes|no|'path/to/package'.<br/>

WPACK_APR - translates to --with-apr<br/>
WOPACK_APR - translates to --without-apr<br/>
WPACK_APR_UTIL - translates to --with-apr-util<br/>
WOPACK_APR_UTIL - translates to --without-apr-util<br/>
WPACK_PCRE - translates to --with-pcre<br/>
WOPACK_PCRE - translates to --without-pcre<br/>
WPACK_DISTCACHE - translates to --with-distcache<br/>
WOPACK_DISTCACHE - translates to --without-distcache<br/>
WPACK_Z - translates to --with-z<br/>
WOPACK_Z - translates to --without-z<br/>
WPACK_LIBXML2 - translates to --with-libxml2<br/>
WOPACK_LIBXML2 - translates to --without-libxml2<br/>
WPACK_BROTLI - translates to --with-brotli<br/>
WOPACK_BROTLI - translates to --without-brotli<br/>
WPACK_LUA - translates to --with-lua<br/>
WOPACK_LUA - translates to --without-lua<br/>
WPACK_SSL - translates to --with-ssl<br/>
WOPACK_SSL - translates to --without-ssl<br/>
WPACK_NGHTTP2 - translates to --with-nghttp2<br/>
WOPACK_NGHTTP2 - translates to --without-nghttp2<br/>
WPACK_JANSSON - translates to --with-jansson<br/>
WOPACK_JANSSON - translates to --without-jansson<br/>
WPACK_CURL - translates to --with-curl<br/>
WOPACK_CURL - translates to --without-curl<br/>

### Modules
Options that start with 'EMOD' will enable a module. If no value is passed (you still need the ':' in the config!) it will default to 'yes'. 'no' is equivalent to any option that starts with 'DMOD', which will disable a module and prevent it from being included. 'DMOD' options do not recognize any value- so it will be ignored if supplied. Possible values for 'EMOD' are: yes|no|shared|static<br/>

EMOD_AUTHN_FILE - translates to --enable-authn-file<br/>
DMOD_AUTHN_FILE - translates to --disable-authn-file<br/>
EMOD_AUTHN_DBM - translates to --enable-authn-dbm<br/>
DMOD_AUTHN_DBM - translates to --disable-authn-dbm<br/>
EMOD_AUTHN_ANON - translates to --enable-authn-anon<br/>
DMOD_AUTHN_ANON - translates to --disable-authn-anon<br/>
EMOD_AUTHN_DBD - translates to --enable-authn-dbd<br/>
DMOD_AUTHN_DBD - translates to --disable-authn-dbd<br/>
EMOD_AUTHN_SOCACHE - translates to --enable-authn-socache<br/>
DMOD_AUTHN_SOCACHE - translates to --disable-authn-socache<br/>
EMOD_AUTHN_CORE - translates to --enable-authn-core<br/>
DMOD_AUTHN_CORE - translates to --disable-authn-core<br/>

EMOD_AUTHZ_HOST - translates to --enable-authz-host<br/>
DMOD_AUTHZ_HOST - translates to --disable-authz-host<br/>
EMOD_AUTHZ_GROUPFILE - translates to --enable-authz-groupfile<br/>
DMOD_AUTHZ_GROUPFILE - translates to --disable-authz-groupfile<br/>
EMOD_AUTHZ_USER - translates to --enable-authz-user<br/>
DMOD_AUTHZ_USER - translates to --disable-authz-user<br/>
EMOD_AUTHZ_DBM - translates to --enable-authz-dbm<br/>
DMOD_AUTHZ_DBM - translates to --disable-authz-dbm<br/>
EMOD_AUTHZ_OWNER - translates to --enable-authz-owner<br/>
DMOD_AUTHZ_OWNER - translates to --disable-authz-owner<br/>
EMOD_AUTHZ_DBD - translates to --enable-authz-dbd<br/>
DMOD_AUTHZ_DBD - translates to --disable-authz-dbd<br/>
EMOD_AUTHZ_CORE - translates to --enable-authz-core<br/>
DMOD_AUTHZ_CORE - translates to --disable-authz-core<br/>
EMOD_AUTHZ_LDAP - translates to --enable-authz-ldap<br/>
DMOD_AUTHZ_LDAP - translates to --disable-authz-ldap<br/>
EMOD_AUTHZ_FCGI - translates to --enable-authz-fcgi<br/>
DMOD_AUTHZ_FCGI - translates to --disable-authz-fcgi<br/>

EMOD_ACCESS_COMPAT - translates to --enable-access-compat<br/>
DMOD_ACCESS_COMPAT - translates to --disable-access-compat<br/>

EMOD_AUTH_BASIC - translates to --enable-auth-basic<br/>
DMOD_AUTH_BASIC - translates to --disable-auth-basic<br/>
EMOD_AUTH_FORM - translates to --enable-auth-form<br/>
DMOD_AUTH_FORM - translates to --disable-auth-form<br/>
EMOD_AUTH_DIGEST - translates to --enable-auth-digest<br/>
DMOD_AUTH_DIGEST - translates to --disable-auth-digest<br/>

EMOD_ALLOWMETHODS - translates to --enable-allowmethods<br/>
DMOD_ALLOWMETHODS - translates to --disable-allowmethods<br/>
EMOD_ISAPI - translates to --enable-isapi<br/>
DMOD_ISAPI - translates to --disable-isapi<br/>
EMOD_FILE_CACHE - translates to --enable-file-cache<br/>
DMOD_FILE_CACHE - translates to --disable-file-cache<br/>

EMOD_CACHE - translates to --enable-cache<br/>
DMOD_CACHE - translates to --disable-cache<br/>
EMOD_CACHE_DISK - translates to --enable-cache-disk<br/>
DMOD_CACHE_DISK - translates to --disable-cache-disk<br/>
EMOD_CACHE_SOCACHE - translates to --enable-cache-socache<br/>
DMOD_CACHE_SOCACHE - translates to --disable-cache-socache<br/>

EMOD_SOCACHE_SHMCB - translates to --enable-socache-shmcb<br/>
DMOD_SOCACHE_SHMCB - translates to --disable-socache-shmcb<br/>
EMOD_SOCACHE_DBM - translates to --enable-socache-dbm<br/>
DMOD_SOCACHE_DBM - translates to --disable-socache-dbm<br/>
EMOD_SOCACHE_MEMCACHE - translates to --enable-socache-memcache<br/>
DMOD_SOCACHE_MEMCACHE - translates to --disable-socache-memcache<br/>
EMOD_SOCACHE_REDIS - translates to --enable-socache-redis<br/>
DMOD_SOCACHE_REDIS - translates to --disable-socache-redis<br/>
EMOD_SOCACHE_DC - translates to --enable-socache-dc<br/>
DMOD_SOCACHE_DC - translates to --disable-socache-dc<br/>

EMOD_SO - translates to --enable-so<br/>
DMOD_SO - translates to --disable-so<br/>

EMOD_WATCHDOG - translates to --enable-watchdog<br/>
DMOD_WATCHDOG - translates to --disable-watchdog<br/>
EMOD_MACRO - translates to --enable-macro<br/>
DMOD_MACRO - translates to --disable-macro<br/>
EMOD_DBD - translates to --enable-dbd<br/>
DMOD_DBD - translates to --disable-dbd<br/>
EMOD_BUCKETEER - translates to --enable-bucketeer<br/>
DMOD_BUCKETEER - translates to --disable-bucketeer<br/>
EMOD_DUMPIO - translates to --enable-dumpio<br/>
DMOD_DUMPIO - translates to --disable-dumpio<br/>
EMOD_ECHO - translates to --enable-echo<br/>
DMOD_ECHO - translates to --disable-echo<br/>

EMOD_EXAMPLE_HOOKS - translates to --enable-example-hooks<br/>
DMOD_EXAMPLE_HOOKS - translates to --disable-example-hooks<br/>
EMOD_CASE_FILTER - translates to --enable-case-filter<br/>
DMOD_CASE_FILTER - translates to --disable-case-filter<br/>
EMOD_CASE_FILTER_IN - translates to --enable-case-filter-in<br/>
DMOD_CASE_FILTER_IN - translates to --disable-case-filter-in<br/>
EMOD_EXAMPLE_IPC - translates to --enable-example-ipc<br/>
DMOD_EXAMPLE_IPC - translates to --disable-example-ipc<br/>

EMOD_BUFFER - translates to --enable-buffer<br/>
DMOD_BUFFER - translates to --disable-buffer<br/>
EMOD_DATA - translates to --enable-data<br/>
DMOD_DATA - translates to --disable-data<br/>
EMOD_RATELIMIT - translates to --enable-ratelimit<br/>
DMOD_RATELIMIT - translates to --disable-ratelimit<br/>
EMOD_REQTIMEOUT - translates to --enable-reqtimeout<br/>
DMOD_REQTIMEOUT - translates to --disable-reqtimeout<br/>
EMOD_EXT_FILTER - translates to --enable-ext-filter<br/>
DMOD_EXT_FILTER - translates to --disable-ext-filter<br/>
EMOD_REQUEST - translates to --enable-request<br/>
DMOD_REQUEST - translates to --disable-request<br/>
EMOD_INCLUDE - translates to --enable-include<br/>
DMOD_INCLUDE - translates to --disable-include<br/>
EMOD_FILTER - translates to --enable-filter<br/>
DMOD_FILTER - translates to --disable-filter<br/>
EMOD_REFLECTOR - translates to --enable-reflector<br/>
DMOD_REFLECTOR - translates to --disable-reflector<br/>
EMOD_SUBSTITUTE - translates to --enable-substitute<br/>
DMOD_SUBSTITUTE - translates to --disable-substitute<br/>
EMOD_SED - translates to --enable-sed<br/>
DMOD_SED - translates to --disable-sed<br/>

EMOD_CHARSET_LITE - translates to --enable-charset-lite<br/>
DMOD_CHARSET_LITE - translates to --disable-charset-lite<br/>
EMOD_DEFLATE - translates to --enable-deflate<br/>
DMOD_DEFLATE - translates to --disable-deflate<br/>
EMOD_XML2ENC - translates to --enable-xml2enc<br/>
DMOD_XML2ENC - translates to --disable-xml2enc<br/>
EMOD_PROXY_HTML - translates to --enable-proxy-html<br/>
DMOD_PROXY_HTML - translates to --disable-proxy-html<br/>
EMOD_BROTLI - translates to --enable-brotli<br/>
DMOD_BROTLI - translates to --disable-brotli<br/>

EMOD_HTTP - translates to --enable-http<br/>
DMOD_HTTP - translates to --disable-http<br/>
EMOD_MIME - translates to --enable-mime<br/>
DMOD_MIME - translates to --disable-mime<br/>
EMOD_LDAP - translates to --enable-ldap<br/>
DMOD_LDAP - translates to --disable-ldap<br/>

EMOD_LOG_CONFIG - translates to --enable-log-config<br/>
DMOD_LOG_CONFIG - translates to --disable-log-config<br/>
EMOD_LOG_DEBUG - translates to --enable-log-debug<br/>
DMOD_LOG_DEBUG - translates to --disable-log-debug<br/>
EMOD_LOG_FORENSIC - translates to --enable-log-forensic<br/>
DMOD_LOG_FORENSIC - translates to --disable-log-forensic<br/>
EMOD_LOGIO - translates to --enable-logio<br/>
DMOD_LOGIO - translates to --disable-logio<br/>

EMOD_LUA - translates to --enable-lua<br/>
DMOD_LUA - translates to --disable-lua<br/>
EMOD_LUAJIT - translates to --enable-luajit<br/>
DMOD_LUAJIT - translates to --disable-luajit<br/>
EMOD_ENV - translates to --enable-env<br/>
DMOD_ENV - translates to --disable-env<br/>

EMOD_MIME_MAGIC - translates to --enable-mime-magic<br/>
DMOD_MIME_MAGIC - translates to --disable-mime-magic<br/>

EMOD_CERN_META - translates to --enable-cern-meta<br/>
DMOD_CERN_META - translates to --disable-cern-meta<br/>
EMOD_EXPIRES - translates to --enable-expires<br/>
DMOD_EXPIRES - translates to --disable-expires<br/>
EMOD_HEADERS - translates to --enable-headers<br/>
DMOD_HEADERS - translates to --disable-headers<br/>
EMOD_IDENT - translates to --enable-ident<br/>
DMOD_IDENT - translates to --disable-ident<br/>
EMOD_USERTRACK - translates to --enable-usertrack<br/>
DMOD_USERTRACK - translates to --disable-usertrack<br/>
EMOD_UNIQUE_ID - translates to --enable-unique-id<br/>
DMOD_UNIQUE_ID - translates to --disable-unique-id<br/>
EMOD_SETENVIF - translates to --enable-setenvif<br/>
DMOD_SETENVIF - translates to --disable-setenvif<br/>
EMOD_VERSION - translates to --enable-version<br/>
DMOD_VERSION - translates to --disable-version<br/>
EMOD_REMOTEIP - translates to --enable-remoteip<br/>
DMOD_REMOTEIP - translates to --disable-remoteip<br/>

EMOD_PROXY - translates to --enable-proxy<br/>
DMOD_PROXY - translates to --disable-proxy<br/>
EMOD_PROXY_CONNECT - translates to --enable-proxy-connect<br/>
DMOD_PROXY_CONNECT - translates to --disable-proxy-connect<br/>
EMOD_PROXY_FTP - translates to --enable-proxy-ftp<br/>
DMOD_PROXY_FTP - translates to --disable-proxy-ftp<br/>
EMOD_PROXY_HTTP - translates to --enable-proxy-http<br/>
DMOD_PROXY_HTTP - translates to --disable-proxy-http<br/>
EMOD_PROXY_FCGI - translates to --enable-proxy-fcgi<br/>
DMOD_PROXY_FCGI - translates to --disable-proxy-fcgi<br/>
EMOD_PROXY_SCGI - translates to --enable-proxy-scgi<br/>
DMOD_PROXY_SCGI - translates to --disable-proxy-scgi<br/>
EMOD_PROXY_UWSGI - translates to --enable-proxy-uwsgi<br/>
DMOD_PROXY_UWSGI - translates to --disable-proxy-uwsgi<br/>
EMOD_PROXY_FDPASS - translates to --enable-proxy-fdpass<br/>
DMOD_PROXY_FDPASS - translates to --disable-proxy-fdpass<br/>
EMOD_PROXY_WSTUNNEL - translates to --enable-proxy-wstunnel<br/>
DMOD_PROXY_WSTUNNEL - translates to --disable-proxy-wstunnel<br/>
EMOD_PROXY_AJP - translates to --enable-proxy-ajp<br/>
DMOD_PROXY_AJP - translates to --disable-proxy-ajp<br/>
EMOD_PROXY_BALANCER - translates to --enable-proxy-balancer<br/>
DMOD_PROXY_BALANCER - translates to --disable-proxy-balancer<br/>
EMOD_PROXY_EXPRESS - translates to --enable-proxy-express<br/>
DMOD_PROXY_EXPRESS - translates to --disable-proxy-express<br/>
EMOD_PROXY_HCHECK - translates to --enable-proxy-hcheck<br/>
DMOD_PROXY_HCHECK - translates to --disable-proxy-hcheck<br/>

EMOD_SESSION - translates to --enable-session<br/>
DMOD_SESSION - translates to --disable-session<br/>
EMOD_SESSION_COOKIE - translates to --enable-session-cookie<br/>
DMOD_SESSION_COOKIE - translates to --disable-session-cookie<br/>
EMOD_SESSION_CRYPTO - translates to --enable-session-crypto<br/>
DMOD_SESSION_CRYPTO - translates to --disable-session-crypto<br/>
EMOD_SESSION_DBD - translates to --enable-session-dbd<br/>
DMOD_SESSION_DBD - translates to --disable-session-dbd<br/>

EMOD_SLOTMEM_SHM - translates to --enable-slotmem-shm<br/>
DMOD_SLOTMEM_SHM - translates to --disable-slotmem-shm<br/>
EMOD_SLOTMEM_PLAIN - translates to --enable-slotmem-plain<br/>
DMOD_SLOTMEM_PLAIN - translates to --disable-slotmem-plain<br/>

EMOD_SSL - translates to --enable-ssl<br/>
DMOD_SSL - translates to --disable-ssl<br/>
EMOD_SSL_STATICLIB_DEPS - translates to --enable-ssl-staticlib-deps<br/>
DMOD_SSL_STATICLIB_DEPS - translates to --disable-ssl-staticlib-deps<br/>

EMOD_OPTIONAL_HOOK_EXPORT - translates to --enable-optional-hook-export<br/>
DMOD_OPTIONAL_HOOK_EXPORT - translates to --disable-optional-hook-export<br/>
EMOD_OPTIONAL_HOOK_IMPORT - translates to --enable-optional-hook-import<br/>
DMOD_OPTIONAL_HOOK_IMPORT - translates to --disable-optional-hook-import<br/>
EMOD_OPTIONAL_FN_IMPORT - translates to --enable-optional-fn-import<br/>
DMOD_OPTIONAL_FN_IMPORT - translates to --disable-optional-fn-import<br/>
EMOD_OPTIONAL_FN_EXPORT - translates to --enable-optional-fn-export<br/>
DMOD_OPTIONAL_FN_EXPORT - translates to --disable-optional-fn-export<br/>

EMOD_DIALUP - translates to --enable-dialup<br/>
DMOD_DIALUP - translates to --disable-dialup<br/>

EMOD_STATIC_SUPPORT - translates to --enable-static-support<br/>
DMOD_STATIC_SUPPORT - translates to --disable-static-support<br/>
EMOD_STATIC_HTPASSWD - translates to --enable-static-htpasswd<br/>
DMOD_STATIC_HTPASSWD - translates to --disable-static-htpasswd<br/>
EMOD_STATIC_HTDIGEST - translates to --enable-static-htdigest<br/>
DMOD_STATIC_HTDIGEST - translates to --disable-static-htdigest<br/>
EMOD_STATIC_ROTATELOGS - translates to --enable-static-rotatelogs<br/>
DMOD_STATIC_ROTATELOGS - translates to --disable-static-rotatelogs<br/>
EMOD_STATIC_LOGRESOLVE - translates to --enable-static-logresolve<br/>
DMOD_STATIC_LOGRESOLVE - translates to --disable-static-logresolve<br/>
EMOD_STATIC_HTDBM - translates to --enable-static-htdbm<br/>
DMOD_STATIC_HTDBM - translates to --disable-static-htdbm<br/>
EMOD_STATIC_AB - translates to --enable-static-ab<br/>
DMOD_STATIC_AB - translates to --disable-static-ab<br/>
EMOD_STATIC_CHECKGID - translates to --enable-static-checkgid<br/>
DMOD_STATIC_CHECKGID - translates to --disable-static-checkgid<br/>
EMOD_STATIC_HTCACHECLEAN - translates to --enable-static-htcacheclean<br/>
DMOD_STATIC_HTCACHECLEAN - translates to --disable-static-htcacheclean<br/>
EMOD_STATIC_HTTXT2DBM - translates to --enable-static-httxt2dbm<br/>
DMOD_STATIC_HTTXT2DBM - translates to --disable-static-httxt2dbm<br/>
EMOD_STATIC_FCGISTARTER - translates to --enable-static-fcgistarter<br/>
DMOD_STATIC_FCGISTARTER - translates to --disable-static-fcgistarter<br/>

EMOD_HTTP2 - translates to --enable-http2<br/>
DMOD_HTTP2 - translates to --disable-http2<br/>
EMOD_NGHTTP2_STATICLIB_DEPS - translates to --enable-nghttp2-staticlib-deps<br/>
DMOD_NGHTTP2_STATICLIB_DEPS - translates to --disable-nghttp2-staticlib-deps<br/>
EMOD_PROXY_HTTP2 - translates to --enable-proxy-http2<br/>
DMOD_PROXY_HTTP2 - translates to --disable-proxy-http2<br/>

EMOD_MD - translates to --enable-md<br/>
DMOD_MD - translates to --disable-md<br/>
EMOD_JANSSON_STATICLIB_DEPS - translates to --enable-jansson-staticlib-deps<br/>
DMOD_JANSSON_STATICLIB_DEPS - translates to --disable-jansson-staticlib-deps<br/>
EMOD_CURL_STATICLIB_DEPS - translates to --enable-curl-staticlib-deps<br/>
DMOD_CURL_STATICLIB_DEPS - translates to --disable-curl-staticlib-deps<br/>

EMOD_LBMETHOD_BYREQUESTS - translates to --enable-lbmethod-byrequests<br/>
DMOD_LBMETHOD_BYREQUESTS - translates to --disable-lbmethod-byrequests<br/>
EMOD_LBMETHOD_BYTRAFFIC - translates to --enable-lbmethod-bytraffic<br/>
DMOD_LBMETHOD_BYTRAFFIC - translates to --disable-lbmethod-bytraffic<br/>
EMOD_LBMETHOD_BYBUSYNESS - translates to --enable-lbmethod-bybusyness<br/>
DMOD_LBMETHOD_BYBUSYNESS - translates to --disable-lbmethod-bybusyness<br/>
EMOD_LBMETHOD_HEARTBEAT - translates to --enable-lbmethod-heartbeat<br/>
DMOD_LBMETHOD_HEARTBEAT - translates to --disable-lbmethod-heartbeat<br/>

EMOD_UNIXD - translates to --enable-unixd<br/>
DMOD_UNIXD - translates to --disable-unixd<br/>
EMOD_PRIVILEGES - translates to --enable-privileges<br/>
DMOD_PRIVILEGES - translates to --disable-privileges<br/>
EMOD_SYSTEMD - translates to --enable-systemd<br/>
DMOD_SYSTEMD - translates to --disable-systemd<br/>

EMOD_HEARTBEAT - translates to --enable-heartbeat<br/>
DMOD_HEARTBEAT - translates to --disable-heartbeat<br/>
EMOD_HEARTMONITOR - translates to --enable-heartmonitor<br/>
DMOD_HEARTMONITOR - translates to --disable-heartmonitor<br/>

EMOD_DAV - translates to --enable-dav<br/>
DMOD_DAV - translates to --disable-dav<br/>
EMOD_STATUS - translates to --enable-status<br/>
DMOD_STATUS - translates to --disable-status<br/>
EMOD_AUTOINDEX - translates to --enable-autoindex<br/>
DMOD_AUTOINDEX - translates to --disable-autoindex<br/>
EMOD_ASIS - translates to --enable-asis<br/>
DMOD_ASIS - translates to --disable-asis<br/>
EMOD_INFO - translates to --enable-info<br/>
DMOD_INFO - translates to --disable-info<br/>
EMOD_SUEXEC - translates to --enable-suexec<br/>
DMOD_SUEXEC - translates to --disable-suexec<br/>

EMOD_CGID - translates to --enable-cgid<br/>
DMOD_CGID - translates to --disable-cgid<br/>
EMOD_CGI - translates to --enable-cgi<br/>
DMOD_CGI - translates to --disable-cgi<br/>
EMOD_DAV_FS - translates to --enable-dav-fs<br/>
DMOD_DAV_FS - translates to --disable-dav-fs<br/>
EMOD_DAV_LOCK - translates to --enable-dav-lock<br/>
DMOD_DAV_LOCK - translates to --disable-dav-lock<br/>
EMOD_VHOST_ALIAS - translates to --enable-vhost-alias<br/>
DMOD_VHOST_ALIAS - translates to --disable-vhost-alias<br/>
EMOD_NEGOTIATION - translates to --enable-negotiation<br/>
DMOD_NEGOTIATION - translates to --disable-negotiation<br/>
EMOD_DIR - translates to --enable-dir<br/>
DMOD_DIR - translates to --disable-dir<br/>
EMOD_IMAGEMAP - translates to --enable-imagemap<br/>
DMOD_IMAGEMAP - translates to --disable-imagemap<br/>
EMOD_ACTIONS - translates to --enable-actions<br/>
DMOD_ACTIONS - translates to --disable-actions<br/>

EMOD_SPELING - translates to --enable-speling<br/>
DMOD_SPELING - translates to --disable-speling<br/>
EMOD_USERDIR - translates to --enable-userdir<br/>
DMOD_USERDIR - translates to --disable-userdir<br/>

EMOD_ALIAS - translates to --enable-alias<br/>
DMOD_ALIAS - translates to --disable-alias<br/>
EMOD_REWRITE - translates to --enable-rewrite<br/>
DMOD_REWRITE - translates to --disable-rewrite<br/>
EMOD_SUEXEC_CAPABILITIES - translates to --enable-suexec-capabilities<br/>
DMOD_SUEXEC_CAPABILITIES - translates to --disable-suexec-capabilities<br/>
EMOD_V4_MAPPED - translates to --enable-v4-mapped<br/>
DMOD_V4_MAPPED - translates to --disable-v4-mapped<br/>

EMOD_FCGID - translates to --enable-fcgid<br/>
DMOD_FCGID - translates to --disable-fcgid<br/>
EMOD_FILESYSTEM - translates to --enable-filesystem<br/>
DMOD_FILESYSTEM - translates to --disable-filesystem<br/>
