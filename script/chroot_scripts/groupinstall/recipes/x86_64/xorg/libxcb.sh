#!/bin/bash

PACKAGE_NAME=libxcb
VERSION=1.16
DOWNLOAD_URL=https://xorg.freedesktop.org/archive/individual/lib/libxcb-1.16.tar.xz
SRC_COMPRESSED_FILE=$(echo $url | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG      \
            --without-doxygen \
            --docdir='${datadir}'/doc/libxcb-$VERSION &&
	make $MAKEFLAGS
}

