#!/bin/bash

PACKAGE_NAME=pcre2
VERSION=10.42
DOWNLOAD_URL=https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.bz2
MD5_SUM=a8e9ab2935d428a4807461f183034abe
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr                       \
		--docdir=/usr/share/doc/pcre2-10.42 \
		--enable-unicode                    \
		--enable-jit                        \
		--enable-pcre2-16                   \
		--enable-pcre2-32                   \
		--enable-pcre2grep-libz             \
		--enable-pcre2grep-libbz2           \
		--enable-pcre2test-libreadline      \
		--disable-static                    &&
	make $MAKEFLAGS
    make install
}

