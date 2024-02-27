#!/bin/bash

PACKAGE_NAME=ModemManager
VERSION=1.18.12
DOWNLOAD_URL=https://www.freedesktop.org/software/ModemManager/ModemManager-1.18.12.tar.xz
MD5_SUM=9f014dfc59f1bd8bc230bb2c2974d104
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr                 \
            --sysconfdir=/etc             \
            --localstatedir=/var          \
            --disable-static              \
            --disable-maintainer-mode     \
            --with-systemd-journal        \
	    --without-mbim                \
	    --without-qmi
            --with-systemd-suspend-resume &&
	make $MAKEFLAGS
    make install
}

