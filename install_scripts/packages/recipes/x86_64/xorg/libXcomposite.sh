#!/bin/bash

PACKAGE_NAME="libXcomposite"
VERSION="0.4.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXcomposite-0.4.6.tar.xz"
MD5_SUM="af0a5f0abb5b55f8411cd738cf0e5259"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
