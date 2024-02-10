#!/bin/bash

PACKAGE_NAME="libXxf86vm"
VERSION="1.1.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXxf86vm-1.1.5.tar.xz"
MD5_SUM="5b913dac587f2de17a02e17f9a44a75f"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
