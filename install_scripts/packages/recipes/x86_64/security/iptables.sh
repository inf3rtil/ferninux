#!/bin/bash

PACKAGE_NAME=iptables
VERSION=1.8.9
DOWNLOAD_URL=https://www.netfilter.org/projects/iptables/files/iptables-1.8.9.tar.xz
MD5_SUM=ffa00f68d63e723c21b8a091c5c0271b
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr      \
            --disable-nftables \
            --enable-libipq    &&
	make $MAKEFLAGS
    make install
}

