#!/bin/bash

PACKAGE_NAME=boost
VERSION=1_83_0
DOWNLOAD_URL=https://boostorg.jfrog.io/artifactory/main/release/1.83.0/source/boost_1_83_0.tar.bz2
MD5_SUM=406f0b870182b4eb17a23a9d8fce967d
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME\_$VERSION

build_source_package(){
    sed -i '/#include.*phoenix.*tuple.hpp.*/d' \
	boost/phoenix/stl.hpp
    ./bootstrap.sh --prefix=/usr --with-python=python3 &&
	./b2 stage $MAKEFLAGS threading=multi link=shared
    ./b2 install threading=multi link=shared
}

