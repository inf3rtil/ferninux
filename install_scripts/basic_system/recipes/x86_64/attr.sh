#!/bin/bash

SRC_COMPRESSED_FILE=attr-2.5.1.tar.gz
SRC_FOLDER=attr-2.5.1

build_source_package(){
    ./configure --prefix=/usr \
		--disable-static \
		--sysconfdir=/etc \
		--docdir=/usr/share/doc/attr-2.5.1
    make $MAKEFLAGS
    make install
}

