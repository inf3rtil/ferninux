#!/bin/bash

SRC_COMPRESSED_FILE=mpc-1.3.1.tar.gz
SRC_FOLDER=mpc-1.3.1

build_source_package(){
    ./configure --prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/mpc-1.3.1
    make $MAKEFLAGS
    make install
    make installl-html
}

