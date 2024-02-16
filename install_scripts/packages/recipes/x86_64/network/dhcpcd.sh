#!/bin/bash

PACKAGE_NAME=dhcpcd
VERSION=10.0.2
DOWNLOAD_URL=https://github.com/NetworkConfiguration/dhcpcd/releases/download/v10.0.2/dhcpcd-10.0.2.tar.xz
MD5_SUM=1f266e2c32567bc778ea22c599fb06d9
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr                \
            --sysconfdir=/etc            \
            --libexecdir=/usr/lib/dhcpcd \
            --dbdir=/var/lib/dhcpcd      \
            --runstatedir=/run           \
            --disable-privsep         &&
	make $MAKEFLAGS
    make install
}

