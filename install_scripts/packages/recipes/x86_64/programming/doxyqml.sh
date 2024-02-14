#!/bin/bash

PACKAGE_NAME=doxyqml
VERSION=0.5.2
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/d/doxyqml/doxyqml-0.5.2.tar.gz
MD5_SUM=f7b957fea48654c76837b0c5e9e3c2af
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user doxyqml
}

