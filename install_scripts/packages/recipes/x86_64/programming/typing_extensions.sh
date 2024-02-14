#!/bin/bash

PACKAGE_NAME=typing_extensions
VERSION=4.4.0
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.4.0.tar.gz
MD5_SUM=5cfcb56ea6fc4972c3600c0030f4d136
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user typing_extensions
}

