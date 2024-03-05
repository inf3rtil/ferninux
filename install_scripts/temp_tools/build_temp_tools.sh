#!/bin/bash

set -e

declare recipes=()
#recipes+=(gettext-0.22.4)
#recipes+=(bison-3.8.2)
#recipes+=(perl-5.38.2)
recipes+=(python-3.12.2)
recipes+=(texinfo-7.1)
recipes+=(util-linux-2.39.3)

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

RECIPES_DIR=$SCRIPT_PATH/recipes/$FERNINUX_TARGET_ARCH
SOURCES_ROOT_DIR=/sources

echo $RECIPES_DIR

cd $RECIPES_DIR

for file in "${recipes[@]}"
do
    if [ -x "$file.sh" ]; then
        . ./"$file.sh"
	echo "extracting files from $SRC_COMPRESSED_FILE"
	tar xvf $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
	cd $SOURCES_ROOT_DIR/$SRC_FOLDER
	config_source_package
	build_source_package
	install_source_package
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
