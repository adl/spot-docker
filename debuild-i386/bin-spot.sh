#!/bin/sh

set -e
set -x

if ! test -f result/spot_*.dsc; then
   echo No dsc file, or multiple dsc files.
   exit 2
fi

export LANG=en_US.UTF-8

dpkg-source -x result/spot_*.dsc
cd spot-*

if ! debuild "$@" -B -us -uc; then
    find -name '*.log'  -print0 | tar zcf ../result/logs-i386.tar.gz --null -T-
    exit 1
fi

cd ..
test -d result &&
    mv -f *.deb result &&
    mv -f spot_* result
