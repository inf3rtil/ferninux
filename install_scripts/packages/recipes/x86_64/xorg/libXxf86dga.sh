#!/bin/bash

PACKAGE_NAME="libXxf86dga"
VERSION="1.1.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXxf86dga-1.1.6.tar.xz"
MD5_SUM="74d1acf93b83abeb0954824da0ec400b"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
