FROM ubuntu:18.04

MAINTAINER Michal Kurek <oki+github@md6.org>

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    vim \
    libopencv-dev \
    libmicrohttpd-dev \
    libjsoncpp-dev \
    libcurl4-openssl-dev \
    cmake \
    git

RUN git clone https://github.com/Visu4link/pastec.git /pastec
RUN mkdir -p /pastec/build && mkdir /pastec/data
WORKDIR /pastec/build
RUN cmake ../ && make
RUN cd /pastec/data \
  && wget http://pastec.io/files/visualWordsORB.tar.gz \
  && tar zxf visualWordsORB.tar.gz

EXPOSE 4212

VOLUME /pastec/

CMD ./pastec -p 4212 /pastec/data/visualWordsORB.dat
