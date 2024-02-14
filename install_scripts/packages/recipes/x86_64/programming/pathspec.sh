#!/bin/bash

PACKAGE_NAME=pathspec
VERSION=0.10.3
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.10.3.tar.gz
MD5_SUM=d89408b52aff020ac768a14c0ef1c7de
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user pathspec
}

