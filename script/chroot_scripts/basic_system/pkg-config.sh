#!/bin/bash

SRC_COMPRESSED_FILE=pkg-config-0.29.2.tar.gz
SRC_FOLDER=pkg-config-0.29.2

build_source_package(){
    sed -i 's:\\\${:\\\$\\{:' intltool-update.in
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
    install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
}

