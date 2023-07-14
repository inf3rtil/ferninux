#!/bin/bash

SRC_COMPRESSED_FILE=wheel-0.38.4.tar.gz
SRC_FOLDER=wheel-0.38.4

build_source_package(){
    PYTHONPATH=src pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links=dist wheel
}

