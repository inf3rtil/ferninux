#!/bin/bash

PACKAGE_NAME=libnotify
VERSION=0.8.2
DOWNLOAD_URL=https://download.gnome.org/sources/libnotify/0.8/libnotify-0.8.2.tar.xz
MD5_SUM=ee2d2934a9dcfd5b1305188201e1cd50
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr       \
              --buildtype=release \
              -Dgtk_doc=false     \
              -Dman=false         \
              ..                  &&
	ninja
    ninja install &&
	mv -v /usr/share/doc/libnotify{,-0.8.2}
}

