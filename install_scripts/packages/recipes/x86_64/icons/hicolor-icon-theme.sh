#!/bin/bash

PACKAGE_NAME=hicolor-icon-theme
VERSION=0.17
DOWNLOAD_URL=https://icon-theme.freedesktop.org/releases/hicolor-icon-theme-0.17.tar.xz
MD5_SUM=84eec8d6f810240a069c731f1870b474
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr
    make install
}

