#!/bin/bash

SRC_DIR=$LFS/sources

for entry in "$SRC_DIR"/*
do
    filename=${entry##*/}
    echo "$filename"
    
done
