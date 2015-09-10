#!/bin/sh


if test $# -lt 1; then
    echo "usage: build-spot.sh branch [-jN]"
    exit 2
fi

set -e
set -x
br=$1
shift
rm -rf spot
git clone https://gitlab.lrde.epita.fr/spot/spot.git -b "$br" --single-branch

export LANG=en_US.UTF-8

cd spot
autoreconf -vfi
./configure PYTHON=/usr/bin/python3 --disable-static
make "$@"
if ! make deb "$@" DEBUILDFLAGS="$*"; then
    if test -d ../result; then
	find -name '*.log'  -print0 | tar zcf ../result/logs-i386.tar.gz --null -T-
    fi
    exit 1
fi

test -d ../result &&
    mv -f *.deb ../result &&
    mv -f spot_* ../result
