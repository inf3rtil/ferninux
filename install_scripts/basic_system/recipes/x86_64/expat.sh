#!/bin/bash

SRC_COMPRESSED_FILE=expat-2.5.0.tar.xz
SRC_FOLDER=expat-2.5.0

build_source_package(){
    ./configure --prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/expat-2.5.0
    make $MAKEFLAGS
    make install
    install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.5.0
}

