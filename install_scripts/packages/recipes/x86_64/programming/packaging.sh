#!/bin/bash

PACKAGE_NAME=packaging
VERSION=23.1
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/p/packaging/packaging-23.1.tar.gz
MD5_SUM=f7d5c39c6f92cc2dfa1293ba8f6c097c
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user packaging
}

