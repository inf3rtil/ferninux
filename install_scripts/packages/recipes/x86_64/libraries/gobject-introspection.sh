#!/bin/bash

PACKAGE_NAME=gobject-introspection
VERSION=1.76.1
DOWNLOAD_URL=https://download.gnome.org/sources/gobject-introspection/1.76/gobject-introspection-1.76.1.tar.xz
MD5_SUM=5cb554fdd139db79f9b1be13892fddac
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr --buildtype=release .. &&
	ninja
    ninja install
}

