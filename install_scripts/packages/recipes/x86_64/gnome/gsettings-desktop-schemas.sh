#!/bin/bash

PACKAGE_NAME=gsettings-desktop-schemas
VERSION=44.0
DOWNLOAD_URL=https://download.gnome.org/sources/gsettings-desktop-schemas/44/gsettings-desktop-schemas-44.0.tar.xz
MD5_SUM=bfb5047307ce2cc8718ee584fd4cb2bd
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i -r 's:"(/system):"/org/gnome\1:g' schemas/*.in &&

	mkdir build &&
	cd    build &&

	meson setup --prefix=/usr --buildtype=release .. &&
	ninja
    ninja install
}

