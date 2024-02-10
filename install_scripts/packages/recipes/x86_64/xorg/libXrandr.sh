#!/bin/bash

PACKAGE_NAME="libXrandr"
VERSION="1.5.3"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXrandr-1.5.3.tar.xz"
MD5_SUM="850cbc7c921c9d5d0135734b114ff6ac"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
