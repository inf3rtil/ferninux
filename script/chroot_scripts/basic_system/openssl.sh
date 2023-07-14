#!/bin/bash

SRC_COMPRESSED_FILE=openssl-3.0.8.tar.gz
SRC_FOLDER=openssl-3.0.8

build_source_package(){
    ./config --prefix=/usr \
	     --openssldir=/etc/ssl \
	     --libdir=lib \
	     shared \
	     zlib-dynamic
    make $MAKEFLAGS
    sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
    make MANSUFFIX=ssl install
    mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.8
    cp -vfr doc/* /usr/share/doc/openssl-3.0.8
    
}

