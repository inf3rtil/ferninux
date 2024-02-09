#!/bin/bash

PACKAGE_NAME="libXpm"
VERSION="3.5.16"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXpm-3.5.16.tar.xz"
MD5_SUM="5073cf59174a2cadde220187759b2e7c"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION --disable-open-zfile
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
