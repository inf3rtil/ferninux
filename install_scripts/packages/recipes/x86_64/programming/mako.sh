#!/bin/bash

PACKAGE_NAME=Mako
VERSION=1.2.4
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.4.tar.gz
MD5_SUM=651f365616611fcd4f2702a9002e2195
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user Mako
}

