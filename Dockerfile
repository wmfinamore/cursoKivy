# Pull base image
FROM ubuntu:20.04

#Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#Set work dir
RUN mkdir /code
WORKDIR /code

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


#Install dependencies
# COPY Pipfile Pipfile.lock /code/
# RUN pip install pipenv && pipenv install --system && pipenv install --upgrade Cython==0.29.19 wheel
RUN pip3 install --user --upgrade Cython==0.29.19 wheel

#Copy project
COPY . /code/

RUN git clone https://github.com/kivy/buildozer.git && cd buildozer 
# RUN sudo python3 setup.py install