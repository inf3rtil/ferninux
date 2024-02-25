#!/bin/bash

PACKAGE_NAME=nettle
VERSION=3.9.1
DOWNLOAD_URL=https://ftp.gnu.org/gnu/nettle/nettle-3.9.1.tar.gz
MD5_SUM=29fcd2dec6bf5b48e5e3ffb3cbc4779e
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install &&
	chmod   -v   755 /usr/lib/lib{hogweed,nettle}.so &&
	install -v -m755 -d /usr/share/doc/nettle-3.9.1 &&
	install -v -m644 nettle.{html,pdf} /usr/share/doc/nettle-3.9.1
}

