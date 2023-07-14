#!/bin/bash

SRC_COMPRESSED_FILE=pkg-config-0.29.2.tar.gz
SRC_FOLDER=pkg-config-0.29.2

build_source_package(){
    ./configure --prefix=/usr \
		--with-internal-glib \
		--disable-host-tool \
		--docdir=/usr/share/doc/pkg-config-0.29.2
    make $MAKEFLAGS
    make install
}

