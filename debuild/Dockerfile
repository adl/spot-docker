FROM debian:sid
MAINTAINER Alexandre Duret-Lutz <adl@lrde.epita.fr>
# We have a lot of timeout issues when fetching packages from
# http://httpredir.debian.org/debian
# Let's see if this is better when hardcoding another mirror.
RUN echo deb http://debian.mirrors.ovh.net/debian sid main > /etc/apt/sources.list && \
    apt-get update && \
    RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    wget git \
    emacs-nox emacs-goodies-el org-mode \
    make gcc g++ \
    swig3.0 \
    autoconf automake libtool \
    flex bison \
    graphviz imagemagick optipng \
    doxygen \
    help2man pandoc groff \
    python-all-dev python3-all-dev python3-pandas ipython3-notebook python3-pygments \
    r-base-core r-recommended- r-base-dev- r-base-html- \
    latexmk texlive-latex-extra texlive-fonts-extra \
    texlive-math-extra \
    texlive-latex-extra-doc- texlive-fonts-extra-doc- \
    texlive-latex-base-doc- texlive-latex-recommended-doc- \
    texlive-pictures-doc- texlive-pstricks-doc- \
    texlive-fonts-recommended-doc- \
    devscripts \
    libbdd0c2 libbdd-dev zlib1g-dev \
    locales \
    && \
    apt-get clean && \
    sed -i 's/# \+\(en_US.UTF.*\)/\1/' /etc/locale.gen && \
    locale-gen && \
    ipython3 -c 'exit;'
# Running ipython3 once, as above, avoid race conditions when multiple
# parallel versions of ipython3 are run by the test suite, and they
# all try to create the default configuration files in the .ipython
# directory.

COPY install.sh /tmp/install.sh
RUN cd /tmp && ./install.sh && rm -f install.sh

WORKDIR /build
COPY build-spot.sh /build/build-spot.sh
