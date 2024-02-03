#!/bin/bash

SRC_COMPRESSED_FILE=pkgconf-2.0.1.tar.xz
SRC_FOLDER=pkgconf-2.0.1

build_source_package(){
    ./configure --prefix=/usr              \
            --disable-static           \
            --docdir=/usr/share/doc/pkgconf-2.0.1
    make $MAKEFLAGS
    make install

    ln -sv pkgconf   /usr/bin/pkg-config
    ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1
    
}

