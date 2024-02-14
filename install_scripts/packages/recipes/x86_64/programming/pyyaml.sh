#!/bin/bash

PACKAGE_NAME=PyYAML
VERSION=6.0.1
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/P/PyYAML/PyYAML-6.0.1.tar.gz
MD5_SUM=c9246277af2d9a13b7018af267a0831a
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user PyYAML
}

