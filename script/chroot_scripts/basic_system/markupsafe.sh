#!/bin/bash

SRC_COMPRESSED_FILE=MarkupSafe-2.1.2.tar.gz 
SRC_FOLDER=MarkupSafe-2.1.2

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --no-user --find-links dist Markupsafe
}

