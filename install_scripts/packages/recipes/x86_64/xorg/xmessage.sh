#!/bin/bash

PACKAGE_NAME="xmessage"
VERSION="1.0.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xmessage-1.0.6.tar.xz"
MD5_SUM="f33841b022db1648c891fdc094014aee"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
