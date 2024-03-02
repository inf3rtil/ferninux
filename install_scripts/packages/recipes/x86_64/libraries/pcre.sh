#!/bin/bash

PACKAGE_NAME=pcre
VERSION=8.45
DOWNLOAD_URL=https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.bz2
MD5_SUM=4452288e6a0eefb2ab11d36010a1eebb
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr                     \
            --docdir=/usr/share/doc/pcre-8.45 \
            --enable-unicode-properties       \
            --enable-pcre16                   \
            --enable-pcre32                   \
            --enable-pcregrep-libz            \
            --enable-pcregrep-libbz2          \
            --enable-pcretest-libreadline     \
            --disable-static                 &&
	make $MAKEFLAGS
    make install
}

