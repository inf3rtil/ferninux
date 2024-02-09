#!/bin/bash

SRC_COMPRESSED_FILE=autoconf-2.71.tar.xz
SRC_FOLDER=autoconf-2.71

build_source_package(){
    sed -e 's/SECONDS|/&SHLVL|/' \
	-e '/BASH_ARGV=/a\ /^SHLVL=/ d' \
	-i.orig tests/local.at
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

