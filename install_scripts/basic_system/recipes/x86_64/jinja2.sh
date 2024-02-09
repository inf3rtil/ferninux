#!/bin/bash

SRC_COMPRESSED_FILE=Jinja2-3.1.2.tar.gz
SRC_FOLDER=Jinja2-3.1.2

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --no-user --find-links dist Jinja2
}

