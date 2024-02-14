#!/bin/bash

PACKAGE_NAME=urllib3
VERSION=2.0.2
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.0.2.tar.gz
MD5_SUM=92d23af401c19da3daec9934f60c8575
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user urllib3
}

