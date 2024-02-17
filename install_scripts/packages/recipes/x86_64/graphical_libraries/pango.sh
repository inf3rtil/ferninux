#!/bin/bash

PACKAGE_NAME=pango
VERSION=1.50.14
DOWNLOAD_URL=https://download.gnome.org/sources/pango/1.50/pango-1.50.14.tar.xz
MD5_SUM=baa2a0a67c71935165a205a76da25954
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i '/array-bounds/d' meson.build
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr          \
              --buildtype=release    \
              --wrap-mode=nofallback \
              ..                     &&
	ninja
    ninja install
}

