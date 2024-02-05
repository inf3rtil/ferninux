#!/bin/bash

set -e

declare recipes=()
recipes+=(gettext.sh)
recipes+=(bison.sh)
recipes+=(perl.sh)
recipes+=(python.sh)
recipes+=(texinfo.sh)
recipes+=(util-linux.sh)

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

RECIPES_DIR=$SCRIPT_PATH/additional_temp_tools
SOURCES_ROOT_DIR=/sources

cd $RECIPES_DIR

for file in "${recipes[@]}"
do
    if [ -x "$file" ]; then
        . ./"$file"
	echo "extracting files from $SRC_COMPRESSED_FILE"
	tar xvf $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
	cd $SOURCES_ROOT_DIR/$SRC_FOLDER
	build_source_package
	rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
	cd $RECIPES_DIR
    else
        echo "File $file is not executable."
    fi
done

echo "cleaning up"
rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete
rm -rf /tools
