#!/bin/bash

PACKAGE_NAME="libXt"
VERSION="1.3.0"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXt-1.3.0.tar.xz"
MD5_SUM="4ea21d3b5a36d93a2177d9abed2e54d4"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION  \
                    --with-appdefaultdir=/etc/X11/app-defaults
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
