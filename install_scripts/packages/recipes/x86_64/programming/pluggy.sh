#!/bin/bash

PACKAGE_NAME=pluggy
VERSION=1.0.0
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/p/pluggy/pluggy-1.0.0.tar.gz
MD5_SUM=daa6fddfb6cd364f3c82e52098911e4b
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user pluggy
}

