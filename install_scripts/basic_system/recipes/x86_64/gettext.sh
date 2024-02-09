#!/bin/bash

SRC_COMPRESSED_FILE=gettext-0.22.tar.xz
SRC_FOLDER=gettext-0.22

build_source_package(){
    ./configure --prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/gettext-0.22
    make $MAKEFLAGS
    make install
    chmod -v 0755 /usr/lib/preloadable_libintl.so
}

