#!/bin/bash

PACKAGE_NAME=XML-Simple
VERSION=2.25
DOWNLOAD_URL=https://www.cpan.org/authors/id/G/GR/GRANTM/XML-Simple-2.25.tar.gz
MD5_SUM=bb841dce889a26c89a1c2739970e9fbc
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    perl Makefile.PL &&
	make             &&
	make install
}

