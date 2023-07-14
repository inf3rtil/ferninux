#!/bin/bash

SRC_COMPRESSED_FILE=coreutils-9.1.tar.xz
SRC_FOLDER=coreutils-9.1

build_source_package(){
    patch -Np1 -i ../coreutils-9.1-i18n-1.patch
    autoreconf -fiv
    FORCE_UNSAFE_CONFIGURE=1 ./configure \
			     --prefix=/usr \
			     --enable-no-install-program=kill,uptime
    make $MAKEFLAGS
    make install
}

