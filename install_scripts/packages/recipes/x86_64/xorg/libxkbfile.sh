#!/bin/bash

PACKAGE_NAME="libxkbfile"
VERSION="1.1.2"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libxkbfile-1.1.2.tar.xz"
MD5_SUM="8af2275955d40166bb647b14e4896ab1"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
