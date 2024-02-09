#!/bin/bash

SRC_COMPRESSED_FILE=freetype-2.13.1.tar.xz
SRC_FOLDER=freetype-2.13.1

build_source_package(){
    sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg &&

	sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
	    -i include/freetype/config/ftoption.h  &&
	
	./configure --prefix=/usr --enable-freetype-config --disable-static &&
	make $MAKEFLAGS
    make install 
}
