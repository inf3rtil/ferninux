#!/bin/bash

PACKAGE_NAME=editables
VERSION=0.3
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/e/editables/editables-0.3.tar.gz
MD5_SUM=e91709fbb0ef586cb7b785042068ab67
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user editables
}

