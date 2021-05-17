#!/bin/sh
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

if test -z "$IMAGE_BASE"; then 
    echo "ERROR NO IMAGE BASE FOUND!" && exit 1
fi

if test "$IMAGE_BASE" = "CENTOS8"; then
    # Install wget tar
    dnf -y remove wget
    # clean up after ourselves
    dnf clean all;
fi
if test "$IMAGE_BASE" = "CENTOS7"; then
    # Install wget tar
    yum -y remove wget
    # clean up after ourselves
    yum clean all;
fi
if test "$IMAGE_BASE" = "ALPINE"; then
    # Install wget tar
    apk del wget tar --no-cache
    # Delete Cache
    rm -rf /var/cache/apk/*
fi