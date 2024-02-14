#!/bin/bash

PACKAGE_NAME=hatchling
VERSION=1.12.2
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.12.2.tar.gz
MD5_SUM=5a6e2fd0c877feea7e71b9d72bbdbed9
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user hatchling
}

