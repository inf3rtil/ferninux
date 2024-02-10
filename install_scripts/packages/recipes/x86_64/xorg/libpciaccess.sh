#!/bin/bash

PACKAGE_NAME="libpciaccess"
VERSION="0.17"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libpciaccess-0.17.tar.xz"
MD5_SUM="1466cf950c914ad2db1dbb76c9a724db"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
