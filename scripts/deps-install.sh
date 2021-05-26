#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

if test -z "$IMAGE_BASE"; then 
    echo "ERROR NO IMAGE BASE FOUND!" && exit 1
fi

if test "$IMAGE_BASE" = "CENTOS8"; then
    # Get Essential Updates
    dnf -y upgrade-minimal
    # Install All Required Packages To make Apache and run it, then cleanup.
    # Required to make and install apache - to be uninstalled
    dnf --setopt=install_weak_deps=False -y install zlib zlib-devel grub2-common grub2-tools gcc make automake jansson libcurl dnf-plugins-core apr-devel apr-util-devel pcre-devel jansson-devel libcurl-devel --allowerasing
    # Needed for libnghttp2-devel
    dnf config-manager --set-enabled powertools;
    # Needed to build http2 module
    # https://gist.github.com/yograterol/99c8e123afecc828cb8c
    dnf --setopt=install_weak_deps=False -y install libnghttp2-devel redhat-rpm-config;
    # clean up after ourselves
    dnf clean all;
fi
if test "$IMAGE_BASE" = "CENTOS7"; then
    # Install dnf
    yum -y install dnf
    # Get Essential Updates
    dnf -y upgrade-minimal
    # Install All Required Packages To make Apache and run it, then cleanup.
    # Required to make and install apache - to be uninstalled
    dnf --setopt=install_weak_deps=False -y install zlib zlib-devel grub2-common grub2-tools gcc make automake jansson libcurl dnf-plugins-core apr-devel apr-util-devel pcre-devel jansson-devel libcurl-devel --allowerasing
    # Needed for libnghttp2-devel
    dnf --setopt=install_weak_deps=False -y install epel-release
    # Needed to build/run http2 module
    # https://gist.github.com/yograterol/99c8e123afecc828cb8c
    dnf --setopt=install_weak_deps=False -y install libnghttp2 libnghttp2-devel redhat-rpm-config
    # clean up after ourselves
    dnf clean all;
    yum clean all;
fi
if test "$IMAGE_BASE" = "ALPINE"; then
    # Get All Updates
    apk -U upgrade;
    # Install packages needed to build/compile stuff
    apk add --no-cache --virtual build-packs linux-headers m4 build-base automake autoconf 
    #apk add apache2
    # Required to run apache
    apk add --no-cache pcre libuuid expat nghttp2
    # Required to make and install apache - to be uninstalled
    apk add --no-cache --virtual httpd-build-packs apr-dev apr-util-dev curl-dev pcre-dev jansson jansson-dev nghttp2-dev
    # Delete Cache
    rm -rf /var/cache/apk/*
fi