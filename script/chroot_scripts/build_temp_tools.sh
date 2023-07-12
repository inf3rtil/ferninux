#!/bin/bash

set -e

recipes=(
    gettext.sh
    bison.sh
    perl.sh
    python.sh
    texinfo.sh
    util-linux.sh
)

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
