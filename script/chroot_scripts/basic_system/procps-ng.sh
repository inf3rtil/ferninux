#!/bin/bash

SRC_COMPRESSED_FILE=procps-ng-4.0.2.tar.xz
SRC_FOLDER=procps-ng-4.0.2

build_source_package(){
    ./configure --prefix=/usr \
		--docdir=/usr/share/doc/procps-ng-4.0.2 \
		--disable-static \
		--disable-kill \
		--with-systemd
    make $MAKEFLAGS
    make install
}

