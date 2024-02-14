#!/bin/bash

PACKAGE_NAME=URI
VERSION=5.17
DOWNLOAD_URL=https://www.cpan.org/authors/id/O/OA/OALDERS/URI-5.17.tar.gz
MD5_SUM=63675c429cfb1df73d7d21a9302e1000
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    perl Makefile.PL &&
	make             &&
	make install
}

