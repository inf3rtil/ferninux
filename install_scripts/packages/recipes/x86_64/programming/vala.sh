#!/bin/bash

PACKAGE_NAME=vala
VERSION=0.56.11
DOWNLOAD_URL=https://download.gnome.org/sources/vala/0.56/vala-0.56.11.tar.xz
MD5_SUM=7b4481fb52bbf73fcfedacbdab616eeb
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --disable-valadoc &&
	make $MAKEFLAGS
    make install
}

