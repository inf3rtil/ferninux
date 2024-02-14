#!/bin/bash

PACKAGE_NAME=glib
VERSION=2.76.4
DOWNLOAD_URL=https://download.gnome.org/sources/glib/2.76/glib-2.76.4.tar.xz
MD5_SUM=b0df5864ec08248e79c13f71a717aa03
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup ..            \
	      --prefix=/usr       \
	      --buildtype=release \
	      -Dman=false          &&
	ninja
    ninja install &&
	mkdir -p /usr/share/doc/glib-2.76.4 &&
	cp -r ../docs/reference/{gio,glib,gobject} /usr/share/doc/glib-2.76.4
}

