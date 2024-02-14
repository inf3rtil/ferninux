#!/bin/bash

PACKAGE_NAME=setuptools_scm
VERSION=7.1.0
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-7.1.0.tar.gz
MD5_SUM=158dc741637fb4fa4b955c62bd2c08be
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user setuptools_scm
}

