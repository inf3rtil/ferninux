#!/bin/bash

PACKAGE_NAME=gnome-icon-theme
VERSION=3.12.0
DOWNLOAD_URL=https://download.gnome.org/sources/gnome-icon-theme/3.12/gnome-icon-theme-3.12.0.tar.xz
MD5_SUM=
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

