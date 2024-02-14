#!/bin/bash

PACKAGE_NAME=chardet
VERSION=5.1.0
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/c/chardet/chardet-5.1.0.tar.gz
MD5_SUM=394bd03d7a258d2771040bfbd5a7bf66
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user chardet
}

