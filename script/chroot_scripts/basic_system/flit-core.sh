#!/bin/bash

SRC_COMPRESSED_FILE=flit_core-3.9.0.tar.gz
SRC_FOLDER=flit_core-3.9.0

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --no-user --find-links dist flit_core
}

