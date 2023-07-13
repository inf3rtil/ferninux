#!/bin/bash

SRC_COMPRESSED_FILE=iana-etc-20230202.tar.gz
SRC_FOLDER=iana-etc-20230202

build_source_package(){
    cp services protocols /etc
}

