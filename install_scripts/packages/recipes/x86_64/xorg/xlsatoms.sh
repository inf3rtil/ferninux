#!/bin/bash

PACKAGE_NAME="xlsatoms"
VERSION="1.1.4"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xlsatoms-1.1.4.tar.xz"
MD5_SUM="da5b7a39702841281e1d86b7349a03ba"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
