#!/bin/bash

PACKAGE_NAME=Cython
VERSION=0.29.36
DOWNLOAD_URL=https://github.com/cython/cython/releases/download/0.29.36/Cython-0.29.36.tar.gz
MD5_SUM=a4d0f9fbc9c137f1a88937cd40e8c5ee
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user Cython
}

