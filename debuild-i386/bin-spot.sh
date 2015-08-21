#!/bin/sh

set -e
set -x

if ! test -f result/spot_*.dsc; then
   echo No dsc file, or multiple dsc files.
   exit 2
fi

dpkg-source -x result/spot_*.dsc
cd spot-*

if ! debuild "$@" -B -us -uc; then
    find -name '*.log'  -print0 | tar zcf ../result/logs-i386.tar.gz --null -T-
    exit 1
fi

cd ..
mv -f *.deb *.changes *.build result
