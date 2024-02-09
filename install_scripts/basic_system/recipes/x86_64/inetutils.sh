#!/bin/bash

SRC_COMPRESSED_FILE=inetutils-2.4.tar.xz
SRC_FOLDER=inetutils-2.4

build_source_package(){
    ./configure --prefix=/usr \
		--bindir=/usr/bin \
		--localstatedir=/var \
		--disable-logger \
		--disable-whois \
		--disable-rcp \
		--disable-rexec \
		--disable-rlogin \
		--disable-rsh \
		--disable-servers
    make $MAKEFLAGS
    make install
    mv -v /usr/{,s}bin/ifconfig
}

