FROM ubuntu:eoan

ARG CTVER=1.24.0
ARG UID=1000
ARG GID=1000
ARG USER=docker
ARG GROUP=docker

RUN apt-get update
RUN apt-get install -y gcc g++ gperf bison flex texinfo help2man make libncurses5-dev \
    python3-dev autoconf automake libtool libtool-bin gawk wget bzip2 xz-utils unzip \
    patch libstdc++6 rsync wget git expat

RUN wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-$CTVER.tar.xz && \
    tar xf crosstool-ng-$CTVER.tar.xz && \
    cd crosstool-ng-$CTVER && \
    ./configure && \
    make && make install

RUN groupadd -g $GID $GROUP
RUN useradd -ms /bin/bash -u $UID -g $GID $USER

USER $USER
RUN mkdir -p /home/$USER/rpi-toolchain
WORKDIR /home/$USER/rpi-toolchain
COPY --chown=toolchain:toolchain . .
RUN make
RUN tar -xf toolchain-raspbian-buster-0-2-g62cd2c5-x86_64-arm-linux-gnueabihf.tar.xz
CMD bash

