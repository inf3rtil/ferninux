#!/bin/bash

SRC_COMPRESSED_FILE=mandoc-1.14.6.tar.gz
SRC_FOLDER=mandoc-1.14.6

build_source_package(){
    ./configure &&
	make $MAKEFLAGS mandoc
    install -vm755 mandoc   /usr/bin &&
	install -vm644 mandoc.1 /usr/share/man/man1
}
