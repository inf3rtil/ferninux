#!/bin/bash

SRC_COMPRESSED_FILE=tar-1.35.tar.xz
SRC_FOLDER=tar-1.35

build_source_package(){
    FORCE_UNSAFE_CONFIGURE=1 \
	./configure --prefix=/usr
    make $MAKEFLAGS
    make install
    make -C doc install-html docdir=/usr/share/doc/tar-1.35
}

