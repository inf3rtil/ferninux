#!/bin/bash

SRC_COMPRESSED_FILE=kmod-30.tar.xz
SRC_FOLDER=kmod-30

build_source_package(){
    ./configure --prefix=/usr \
		--sysconfdir=/etc \
		--with-openssl \
		--with-xz \
		--with-zstd \
		--with-zlib
    make $MAKEFLAGS
    make install
    for target in depmod insmod modinfo modprobe rmmod; do
	ln -sfv ../bin/kmod /usr/sbin/$target
    done
    ln -sfv kmod /usr/bin/lsmod
}

