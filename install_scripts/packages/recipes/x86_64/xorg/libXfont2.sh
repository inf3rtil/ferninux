#!/bin/bash

PACKAGE_NAME="libXfont2"
VERSION="2.0.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXfont2-2.0.6.tar.xz"
MD5_SUM="c179daa707f5f432f1bc13977e5bb329"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION --disable-devel-docs
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
