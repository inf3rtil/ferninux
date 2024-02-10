#!/bin/bash

PACKAGE_NAME="libICE"
VERSION="1.1.1"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libICE-1.1.1.tar.xz"
MD5_SUM="b444a0e4c2163d1bbc7b046c3653eb8d"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
