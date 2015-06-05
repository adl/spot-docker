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
    error=$?
    find -name '*.log'  -print0 | tar cf result/logs-i386.gz --null -T-
    exit $error
fi

cd ..
mv -f *.deb *.changes *.build result

