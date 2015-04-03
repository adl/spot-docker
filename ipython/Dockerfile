FROM debian:sid
MAINTAINER Alexandre Duret-Lutz <adl@lrde.epita.fr>
RUN echo 'deb http://www.lrde.epita.fr/repo/debian/ unstable/' >> /etc/apt/sources.list && \
    apt-get update && \
    RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive \
      apt-get install -y --force-yes --no-install-recommends \
      spot python3-spot python3-pip python3-dev build-essential git graphviz \
      pdf2svg dot2tex texlive-pictures texlive-latex-extra wget sudo \
      imagemagick libmagickcore-extra ghostscript libbdd0c2 libbdd-dev && \
    pip3 install "ipython[notebook]"

RUN mkdir -p /home/docker && \
    groupadd -g 999 -r docker && \
    useradd -u 999 -r -g docker docker && \
    chown docker:docker /home/docker

COPY run-nb /usr/local/bin/run-nb
COPY install-ext.py /home/docker/install-ext.py
COPY install.sh /tmp/install.sh

RUN cd /tmp && ./install.sh && rm -f install.sh

WORKDIR /home/docker
USER docker

RUN umask 0002 && \
    ipython profile create rise && \
    git clone --single-branch --depth=1 https://github.com/adl/RISE.git && \
    cd RISE && \
    python3 setup.py install --profile rise && cd .. && rm -rf RISE && \
    cd `ipython3 locate`/nbextensions && \
    git clone --single-branch --depth=1  https://github.com/ipython-contrib/IPython-notebook-extensions.git && \
    python3 /home/docker/install-ext.py && rm -f /home/docker/install-ext.py && \
    python3 -m IPython.external.mathjax && \
    cd `ipython3 locate`/extensions && \
    wget https://gist.github.com/adl/098f5cf7e372720db687/download -O- | \
    tar zxv --strip-components=1 && \
    echo "c.InteractiveShellApp.extensions.append('tikzmagic')" >> `ipython3 locate profile rise`/ipython_config.py && \
    cd ~ && \
    mkdir examples && \
    cp /usr/share/doc/python3-spot/examples/*.ipynb.gz examples && \
    cd examples && gunzip *.gz && \
    for i in *.ipynb; do mv $i tmp-$i; ipython3 nbconvert --to notebook tmp-$i --stdout > $i; rm -f tmp-$1; done

USER root
