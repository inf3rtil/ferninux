#!/bin/bash

PACKAGE_NAME=idna
VERSION=3.4
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/i/idna/idna-3.4.tar.gz
MD5_SUM=13ea24e076212b6baae1135a116d1e0e
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user idna
}

