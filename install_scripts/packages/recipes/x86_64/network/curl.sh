#!/bin/bash

PACKAGE_NAME=curl
VERSION=8.2.1
DOWNLOAD_URL=https://curl.se/download/curl-8.2.1.tar.xz
MD5_SUM=556576a795bdd2c7d10de6886480065f
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr                           \
		--disable-static                        \
		--with-openssl                          \
		--enable-threaded-resolver              \
		--with-ca-path=/etc/ssl/certs &&
	make $MAKEFLAGS
    make install &&

	rm -rf docs/examples/.deps &&

	find docs \( -name Makefile\* -o  \
             -name \*.1       -o  \
             -name \*.3       -o  \
             -name CMakeLists.txt \) -delete &&

	cp -v -R docs -T /usr/share/doc/curl-$VERSION
}

