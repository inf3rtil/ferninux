#!/bin/bash

PACKAGE_NAME="libSM"
VERSION="1.2.4"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libSM-1.2.4.tar.xz"
MD5_SUM="ffa434ed96ccae45533b3d653300730e"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
