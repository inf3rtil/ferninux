#!/bin/bash

PACKAGE_NAME=Xwayland
VERSION=23.2.0
DOWNLOAD_URL=https://www.x.org/pub/individual/xserver/xwayland-23.2.0.tar.xz
SRC_COMPRESSED_FILE=$(echo $url | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){

}

