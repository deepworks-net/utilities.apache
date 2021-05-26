#!/bin/bash
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

if test -z "$IMAGE_BASE"; then 
    echo "ERROR NO IMAGE BASE FOUND!" && exit 1
fi

if test "$IMAGE_BASE" = "CENTOS8"; then
    # Uninstall all devel tools and such!
    dnf -y remove grub2-common grub2-tools gcc make automake jansson jansson-devel apr-devel apr-util-devel zlib-devel
    dnf -y remove dnf-plugins-core pcre-devel libcurl-devel libnghttp2-devel redhat-rpm-config
    # clean up after ourselves
    dnf clean all;
fi
if test "$IMAGE_BASE" = "CENTOS7"; then
    # Uninstall all devel tools and such!
    dnf -y remove grub2-common grub2-tools gcc make automake jansson jansson-devel apr-devel apr-util-devel zlib-devel
    dnf -y remove dnf-plugins-core epel-release pcre-devel libcurl-devel libnghttp2-devel redhat-rpm-config
    # clean up after ourselves
    dnf clean all;
fi
if test "$IMAGE_BASE" = "ALPINE"; then
    # Uninstall all tools and such!
    apk del build-packs httpd-build-packs
    # Delete Cache
    rm -rf /var/cache/apk/*
fi