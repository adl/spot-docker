FROM debian:sid
MAINTAINER Alexandre Duret-Lutz <adl@lrde.epita.fr>
RUN apt-get update && \
    RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    wget git \
    emacs-nox emacs-goodies-el org-mode \
    make gcc-4.9 g++-4.9 \
    swig3.0 \
    autoconf automake libtool \
    flex bison \
    graphviz imagemagick \
    doxygen \
    help2man \
    python3-dev \
    latexmk texlive-latex-extra texlive-fonts-extra \
    texlive-math-extra \
    texlive-latex-extra-doc- texlive-fonts-extra-doc- \
    texlive-latex-base-doc- texlive-latex-recommended-doc- \
    texlive-pictures-doc- texlive-pstricks-doc- \
    texlive-fonts-recommended-doc- \
    devscripts \
    && \
    apt-get clean && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 20 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 20

WORKDIR /build
COPY build-spot.sh /build/build-spot.sh
