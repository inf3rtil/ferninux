#!/bin/bash

SRC_COMPRESSED_FILE=util-linux-2.39.1.tar.xz
SRC_FOLDER=util-linux-2.39.1

build_source_package(){
    sed -i '/test_mkfds/s/^/#/' tests/helpers/Makemodule.am
    ./configure ADJTIME_PATH=/var/lib/hwclock/adjtime \
		--bindir=/usr/bin    \
		--libdir=/usr/lib    \
		--runstatedir=/run   \
		--sbindir=/usr/sbin  \
		--disable-chfn-chsh  \
		--disable-login      \
		--disable-nologin    \
		--disable-su         \
		--disable-setpriv    \
		--disable-runuser    \
		--disable-pylibmount \
		--disable-static     \
		--without-python     \
		--docdir=/usr/share/doc/util-linux-2.39.1
    make $MAKEFLAGS
    make install
}
