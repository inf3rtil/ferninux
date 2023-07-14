#!/bin/bash

SRC_COMPRESSED_FILE=intltool-0.51.0.tar.gz
SRC_FOLDER=intltool-0.51.0

build_source_package(){
    sed -i 's:\\\${:\\\$\\{:' intltool-update.in
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
    install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
}

