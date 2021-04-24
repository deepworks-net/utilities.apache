#!/bin/sh

if test -z "$IMAGE_BASE"; then 
    echo "ERROR NO IMAGE BASE FOUND!" && exit 1
fi

if test "$IMAGE_BASE" = "CENTOS8"; then
    # Get Essential Updates
    dnf -y upgrade-minimal
    # Install All Required Packages To make Apache and run it, then cleanup.
    # Required to run apache
    dnf --setopt=install_weak_deps=False -y install openssl
    # Required to make and install apache - to be uninstalled
    dnf --setopt=install_weak_deps=False -y install grub2-common grub2-tools gcc make automake jansson libcurl dnf-plugins-core apr apr-util apr-devel apr-util-devel pcre-devel openssl-devel jansson-devel libcurl-devel --allowerasing
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
    # Required to run apache
    dnf --setopt=install_weak_deps=False -y install openssl
    # Required to make and install apache - to be uninstalled
    dnf --setopt=install_weak_deps=False -y install grub2-common grub2-tools gcc make automake jansson libcurl dnf-plugins-core apr apr-util apr-devel apr-util-devel pcre-devel openssl-devel jansson-devel libcurl-devel --allowerasing
    # Needed for libnghttp2-devel
    dnf --setopt=install_weak_deps=False -y install epel-release
    # Needed to build/run http2 module
    # https://gist.github.com/yograterol/99c8e123afecc828cb8c
    dnf --setopt=install_weak_deps=False -y install libnghttp2 libnghttp2-devel redhat-rpm-config
    # clean up after ourselves
    dnf clean all;
    yum clean all;
fi





