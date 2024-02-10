#!/bin/bash

PACKAGE_NAME="libFS"
VERSION="1.0.9"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libFS-1.0.9.tar.xz"
MD5_SUM="742863a552ecd53cdb957b7b276213cc"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
