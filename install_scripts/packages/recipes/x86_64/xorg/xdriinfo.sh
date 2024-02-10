#!/bin/bash

PACKAGE_NAME="xdriinfo"
VERSION="1.0.7"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xdriinfo-1.0.7.tar.xz"
MD5_SUM="34aff1f93fa54d6a64cbe4fee079e077"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
