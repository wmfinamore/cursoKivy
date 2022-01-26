FROM ubuntu:20.04


RUN apt update -qq > /dev/null \
    && DEBIAN_FRONTEND=noninteractive apt install -qq --yes --no-install-recommends \
    locales && \
    locale-gen en_US.UTF-8
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"


# system requirements to build most of the recipes
RUN apt update -qq > /dev/null \
    && DEBIAN_FRONTEND=noninteractive apt install -qq --yes --no-install-recommends \
    autoconf \
    automake \
    build-essential \
    ccache \
    cmake \
    gettext \
    git \
    libffi-dev \
    libltdl-dev \
    libssl-dev \
    libtool \
    openjdk-13-jdk \
    patch \
    pkg-config \
    python3-pip \
    python3-setuptools \
    sudo \
    unzip \
    zip \
    zlib1g-dev

RUN groupadd -r test && useradd -mg test test \
    && echo test ALL=NOPASSWD: ALL >> /etc/sudoers

USER test

ENV PATH=/home/test/.local/bin:/usr/lib/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN mkdir /home/test/.ccache
RUN pip3 install --user -U pip
RUN pip install --user -U pip
# RUN pip3 install --user https://github.com/kivy/buildozer/archive/master.zip
RUN git clone https://github.com/kivy/buildozer /home/test/buildozer
# RUN python3 /home/test/buildozer/setup.py build
RUN pip install --user -e /home/test/buildozer
RUN pip3 install --user --upgrade Cython==0.29.19
WORKDIR /home/test/project
CMD buildozer android debug