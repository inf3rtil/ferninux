#!/bin/bash

PACKAGE_NAME=xorgproto
VERSION=2023.2
DOWNLOAD_URL=https://xorg.freedesktop.org/archive/individual/proto/xorgproto-2023.2.tar.xz
SRC_COMPRESSED_FILE=$(echo $url | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&
	meson setup --prefix=$XORG_PREFIX .. &&
	ninja
    ninja install &&
	mv -v $XORG_PREFIX/share/doc/xorgproto{,$VERSION}
}

