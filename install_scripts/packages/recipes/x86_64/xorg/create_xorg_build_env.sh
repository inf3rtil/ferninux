#!/bin/bash

PACKAGE_NAME=xorg_build_env
VERSION=
DOWNLOAD_URL=
MD5_SUM=
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_sourc(){

}

