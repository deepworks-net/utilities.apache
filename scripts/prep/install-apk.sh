#!/bin/sh

# Get All Updates
apk -U upgrade;

#apk add apache2
# Required to run apache
apk add openssl pcre libuuid expat nghttp2
# Required to make and install apache - to be uninstalled
apk add --virtual httpd-build-packs apr apr-util apr-dev apr-util-dev m4 curl-dev build-base pcre-dev openssl-dev jansson jansson-dev nghttp2-dev automake autoconf
