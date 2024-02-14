#!/bin/bash

PACKAGE_NAME=charset-normalizer
VERSION=3.0.1
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/c/charset-normalizer/charset-normalizer-3.0.1.tar.gz
MD5_SUM=12ee1c8bedbfba84e99db46d5d94f411
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user charset-normalizer
}

