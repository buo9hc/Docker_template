FROM ubuntu:20.04

MAINTAINER Hoang Bui <hoang.bui.morning@gmail.com>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update --fix-missing && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends apt-utils
RUN apt-get install --assume-yes apt-utils
RUN apt-get install -y man
RUN apt-get install -y libtinfo-dev libncurses5-dev
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
RUN apt-get install -y libmotif-dev
RUN apt-get autoremove -y automake
RUN apt-get install -y automake
RUN apt-get autoremove -y autoconf
RUN apt-get install -y autoconf
RUN apt update && apt install -y zstd liblz4-tool
RUN apt-get install -y grub-common
RUN apt-get -y install locales sudo && dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/v/vim/xxd_8.1.2269-1ubuntu5.25_amd64.deb
RUN sudo dpkg -i xxd_8.1.2269-1ubuntu5.25_amd64.deb 
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/v/vim/vim-common_8.1.2269-1ubuntu5.25_all.deb
RUN sudo dpkg -i vim-common_8.1.2269-1ubuntu5.25_all.deb 
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/v/vim/vim-runtime_8.1.2269-1ubuntu5.25_all.deb
RUN sudo dpkg -i vim-runtime_8.1.2269-1ubuntu5.25_all.deb
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/v/vim/vim_8.1.2269-1ubuntu5.25_amd64.deb
RUN apt-get install -y libcanberra0 libgpm2 libltdl7 libtdb1 sound-theme-freedesktop
RUN sudo dpkg -i vim_8.1.2269-1ubuntu5.25_amd64.deb

ENV LANG en_US.utf8

RUN useradd -u 1001 -p nothing -Umd /code -s /bin/bash hoang
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN adduser hoang sudo
USER hoang

RUN git config --global user.email hbui9701@gmail.com
RUN git config --global user.name hbui
RUN git config --global http.sslverify false

RUN mkdir -p /code/my-project
WORKDIR /code
VOLUME /code/my-project
