#!/bin/bash

SRC_COMPRESSED_FILE=wheel-0.41.1.tar.gz
SRC_FOLDER=wheel-0.41.1

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links=dist wheel
}

