#!/bin/bash

PACKAGE_NAME="xcmsdb"
VERSION="1.0.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xcmsdb-1.0.6.tar.xz"
MD5_SUM="82a90e2feaeab5c5e7610420930cc0f4"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
