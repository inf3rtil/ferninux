#!/bin/bash

PACKAGE_NAME=libpcap
VERSION=1.10.4
DOWNLOAD_URL=https://www.tcpdump.org/release/libpcap-1.10.4.tar.gz
MD5_SUM=0322e28dd76cda8066bb6d00fee5969b
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    sed -i '/INSTALL_DATA.*libpcap.a\|RANLIB.*libpcap.a/ s/^/#/' Makefile
    make install
}

