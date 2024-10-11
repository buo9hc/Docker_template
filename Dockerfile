FROM ubuntu:20.04

MAINTAINER Tin Nguyen <tin.nguyenminh94@gmail.com>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update --fix-missing
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install --assume-yes apt-utils
RUN apt-get install -y man
RUN apt-get install -y libtinfo-dev libncurses5-dev
RUN apt-get install -y libc6-dev

RUN apt-get install -y git-lfs
RUN apt-get install -y screen
RUN apt-get install -y libssl-dev
RUN apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev

RUN apt-get install -y gawk
RUN apt-get install -y wget
RUN apt-get install -y gcc-multilib
RUN apt-get install -y  git-core diffstat unzip texinfo gcc-multilib
RUN apt-get install -y build-essential chrpath socat cpio python python3 python3-pip python3-pexpect
RUN apt-get install -y xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa
RUN apt-get install -y libsdl1.2-dev xterm
RUN apt-get install -y libgegl-dev python3
RUN apt-get autoremove -y automake
RUN apt-get install -y automake
RUN apt-get install -y vim

RUN apt install -y zstd liblz4-tool

RUN apt-get -y install locales sudo && dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.utf8

RUN useradd -u 1000 -p nothing -Umd /code -s /bin/bash hoang
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN adduser hoang sudo
USER hoang

RUN git config --global user.email "hoang.bui@windriver.com"
RUN git config --global user.name "Hoang Bui"
  
RUN git config --global http.postBuffer 524288000
RUN git config --global http.lowSpeedLimit 0
RUN git config --global http.lowSpeedTime 999999
RUN git config --global http.sslverify false

RUN mkdir -p /code/working
WORKDIR /code
VOLUME /code/working
