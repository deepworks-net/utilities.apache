#!/bin/bash

if test -z "$IMAGE_BASE"; then 
    echo "ERROR NO IMAGE BASE FOUND!" && exit 1
fi

if test "$IMAGE_BASE" = "CENTOS8"; then
    # Uninstall all devel tools and such!
    dnf -y remove grub2-common grub2-tools gcc make automake jansson jansson-devel apr apr-util apr-devel apr-util-devel
    dnf -y remove dnf-plugins-core pcre-devel openssl-devel libcurl-devel libnghttp2-devel redhat-rpm-config
    # clean up after ourselves
    dnf clean all;
fi
if test "$IMAGE_BASE" = "CENTOS7"; then
    # Uninstall all devel tools and such!
    dnf -y remove grub2-common grub2-tools gcc make automake jansson jansson-devel apr apr-util apr-devel apr-util-devel
    dnf -y remove dnf-plugins-core epel-release pcre-devel openssl-devel libcurl-devel libnghttp2-devel redhat-rpm-config
    # clean up after ourselves
    dnf clean all;
fi
if test "$IMAGE_BASE" = "ALPINE"; then
    # Uninstall all tools and such!
    apk del httpd-build-packs
fi