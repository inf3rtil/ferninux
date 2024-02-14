#!/bin/bash

PACKAGE_NAME=requests
VERSION=2.31.0
DOWNLOAD_URL=https://files.pythonhosted.org/packages/source/r/requests/requests-2.31.0.tar.gz
DOWNLOAD_URL_1=https://www.linuxfromscratch.org/patches/blfs/12.0/requests-2.31.0-use_system_certs-1.patch
MD5_SUM=941e175c276cd7d39d098092c56679a4
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    patch -Np1 -i ../requests-2.31.0-use_system_certs-1.patch
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user requests
    
}

