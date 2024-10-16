FROM ubuntu:18.04

MAINTAINER Hoang Bui <hoang.bui.morning@gmail.com>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install --assume-yes apt-utils
RUN apt-get install -y man
#RUN apt-get install -y openjdk-7-jdk
#RUN apt-get install -y libxml2:i386 libstdc++6:i386
RUN apt-get install -y libtinfo-dev libncurses5-dev
#RUN apt-get install -y git-lfs
RUN \
  apt-get update && \
  apt-get install -y sudo curl git repo && \
  curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash && \
  sudo apt-get install git-lfs
  
RUN \
  apt-get update && \
  apt-get install -y libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc-8 && \
  cd /tmp && \
  curl -o git.tar.gz https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.17.2.tar.gz && \
  tar -zxf git.tar.gz && \
  cd git-* && \
  make prefix=/usr/local all && \
  sudo make prefix=/usr/local install && \
  exec bash
  
RUN apt-get install -y screen
RUN apt-get install -y libssl-dev
RUN apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev liblz4-tool


RUN apt-get install -y gawk
RUN apt-get install -y wget
RUN apt-get install -y gcc-multilib
RUN apt-get install -y  git-core diffstat unzip texinfo gcc-multilib
RUN apt-get install -y build-essential chrpath socat cpio python python3.8 python3-pip python3-pexpect
RUN apt-get install -y xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa
RUN apt-get install -y libsdl1.2-dev xterm
RUN apt-get install -y libgegl-dev python3.8
RUN apt-get autoremove -y automake
RUN apt-get install -y automake
RUN sudo ln -sf /usr/bin/python3.8 /usr/bin/python3

RUN sudo ln -sf /usr/bin/gcc-8 /usr/bin/gcc && sudo ln -sf /usr/bin/gcc-ar-8 /usr/bin/gcc-ar && sudo ln -sf /usr/bin/gcc-nm-8 /usr/bin/gcc-nm && sudo ln -sf /usr/bin/gcc-ranlib-8 /usr/bin/gcc-ranlib
RUN apt-get update && \
    apt-get install -y g++-8
RUN sudo ln -sf /usr/bin/g++-8 /usr/bin/g++
RUN apt-get install -y vim
RUN apt-get install -y zstd

RUN apt-get -y install locales sudo && dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.utf8

RUN useradd -u 1000 -p nothing -Umd /code -s /bin/bash hoang
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN adduser hoang sudo
USER hoang

RUN git config --global user.email hoang.bui@windriver.com
RUN git config --global user.name hbui
RUN git config --global http.sslverify false

RUN mkdir -p /code/my-project
WORKDIR /code
VOLUME /code/my-project
