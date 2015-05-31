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
export PATH=$PATH:/usr/local/bin
git clone https://gitlab.lrde.epita.fr/spot/spot.git -b "$br" --single-branch
cd spot
autoreconf -vfi
./configure PYTHON=/usr/bin/python3 --disable-static
make "$@"
make deb "$@" DEBUILDFLAGS="$*"

test -d ../result &&
    mv -f *.deb ../result &&
    mv -f spot_* ../result
