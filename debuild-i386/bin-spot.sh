#!/bin/sh

set -e
set -x

if ! test -f result/spot_*.dsc; then
   echo No dsc file, or multiple dsc files.
   exit 2
fi

dpkg-source -x result/spot_*.dsc
cd spot-*
debuild "$*" -b -us -uc

test -d ../result &&
    mv -f *.deb ../result &&
    mv -f spot_* ../result
