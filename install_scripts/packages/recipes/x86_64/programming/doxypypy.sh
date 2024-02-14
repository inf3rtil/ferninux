#!/bin/bash

PACKAGE_NAME=doxypypy
VERSION=0.8.8.7
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/d/doxypypy/doxypypy-0.8.8.7.tar.gz
MD5_SUM=5773d0a7882df900cbda8ee5107e1ced
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user doxypypy
}

