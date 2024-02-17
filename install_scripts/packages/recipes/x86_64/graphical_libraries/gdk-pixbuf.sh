#!/bin/bash

PACKAGE_NAME=gdk-pixbuf
VERSION=2.42.10
DOWNLOAD_URL=https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.10.tar.xz
MD5_SUM=4a62f339cb1424693fba9bb7ffef8150
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup ..            \
	      --prefix=/usr       \
	      --buildtype=release \
	      -Dman=false \
	      --wrap-mode=nofallback &&
	ninja
    ninja install
}

