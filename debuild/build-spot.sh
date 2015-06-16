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
cd spot
autoreconf -vfi
./configure PYTHON=/usr/bin/python3 --disable-static
make "$@"
# Add /usr/local/bin so that the test-suite uses the locally installed
# third-party tools.  The build would work even without modifying
# PATH, but in that case it would skip several tests.
if ! make deb "$@" DEBUILDFLAGS="--prepend-path=/usr/local/bin $*"; then
    if test -d ../result; then
	find -name '*.log'  -print0 | tar cf ../result/logs-amd64.gz --null -T-
    fi
    exit 1
fi

if test -d ../result; then
    mv -f *.deb ../result &&
    mv -f spot_* ../result
    (cd wrap/python/ajax &&
	    tar zcvf ../../../../results/cgi.tar.gz \
		--exclude '*spotimg*' \
		--exclude '*#*' \
		--exclude '*~' \
		--exclude '*.in' \
		--exclude 'Makefile*' \
		--exclude '*__*' \
		.)
fi
