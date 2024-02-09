#!/bin/bash

SRC_COMPRESSED_FILE=acl-2.3.1.tar.xz
SRC_FOLDER=acl-2.3.1

build_source_package(){
    ./configure --prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/acl-2.3.1
    make $MAKEFLAGS
    make install
}

