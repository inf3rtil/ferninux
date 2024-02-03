#!/bin/bash

SRC_COMPRESSED_FILE=util-linux-2.39.1.tar.xz
SRC_FOLDER=util-linux-2.39.1

build_source_package(){
    mkdir -pv /var/lib/hwclock
    ./configure ADJTIME_PATH=/var/lib/hwclock/adjtime \
		--libdir=/usr/lib \
		--docdir=/usr/share/doc/util-linux-2.39.1 \
		--disable-chfn-chsh \
		--disable-login \
		--disable-nologin \
		--disable-su \
		--disable-setpriv \
		--disable-runuser \
		--disable-pylibmount \
		--disable-static \
		--without-python \
		--runstatedir=/run
    make $MAKEFLAGS
    make install
}

