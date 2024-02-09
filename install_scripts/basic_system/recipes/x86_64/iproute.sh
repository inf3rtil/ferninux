#!/bin/bash

SRC_COMPRESSED_FILE=iproute2-6.4.0.tar.xz
SRC_FOLDER=iproute2-6.4.0

build_source_package(){
    sed -i /ARPD/d Makefile
    rm -fv man/man8/arpd.8
    make $MAKEFLAGS NETNS_RUN_DIR=/run/netns
    make SBINDIR=/usr/sbin install
    mkdir -pv /usr/share/doc/iproute2-6.4.0
    cp -v COPYING README* /usr/share/doc/iproute2-6.4.0
}

