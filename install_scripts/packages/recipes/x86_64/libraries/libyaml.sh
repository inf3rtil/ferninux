#!/bin/bash

PACKAGE_NAME=yaml
VERSION=0.2.5
DOWNLOAD_URL=https://github.com/yaml/libyaml/releases/download/0.2.5/yaml-0.2.5.tar.gz
MD5_SUM=bb15429d8fb787e7d3f1c83ae129a999
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
}

