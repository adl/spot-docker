#!/bin/sh

set -e  # Abort on any error
set -x  # Show each instruction at is it run

# LTL2BA
V=1.2b1
wget http://www.lsv.ens-cachan.fr/~gastin/ltl2ba/ltl2ba-$V.tar.gz
tar xvf ltl2ba-$V.tar.gz
cd ltl2ba-$V
make -j4
mv ltl2ba /usr/local/bin/
cd ..
rm -rf ltl2ba-$V ltl2ba-$V.tar.gz

# LTL3BA
V=1.1.2
wget http://sourceforge.net/projects/ltl3ba/files/ltl3ba/1.1/ltl3ba-$V.tar.gz
tar xvf ltl3ba-$V.tar.gz
cd ltl3ba-$V
make -j4
mv ltl3ba /usr/local/bin/
cd ..
rm -rf ltl3ba-$V ltl3ba-$V.tar.gz

# ltl2dstar
V=0.5.2
wget http://www.ltl2dstar.de/down/ltl2dstar-0.5.2.tar.gz
tar xvf ltl2dstar-$V.tar.gz
cd ltl2dstar-$V/src
make -j4
mv ltl2dstar /usr/local/bin/
cd ../..
rm -rf ltl2dstar-$V ltl2dstar-$V.tar.gz

# glugose 4.0
wget http://www.labri.fr/perso/lsimon/downloads/softwares/glucose-syrup.tgz
tar xvf glucose-syrup.tgz
cd glucose-syrup/simp
make -j4
mv glucose /usr/local/bin
cd ../..
rm -rf glucose-syrup

# modella 1.5.9
wget http://web.archive.org/web/20080607170403/http://www.science.unitn.it/~stonetta/modella/MoDeLLa-1.5.9.tar.gz
tar xvf MoDeLLa-1.5.9.tar.gz
cd MoDeLLa-1.5.9
make -j4
mv modella /usr/local/bin
cd ../..
rm -rf MoDeLLa-1.5.9

# lbtt 1.2.1a
wget http://spot.lip6.fr/dl/lbtt-1.2.1a.tar.gz
tar xvf lbtt-1.2.1a.tar.gz
cd lbtt-1.2.1a
./configure
make -j4
make install
cd ..
rm -rf lbtt-1.2.1a
