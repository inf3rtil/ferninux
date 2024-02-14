#!/bin/bash

PACKAGE_NAME=sqlite-autoconf
VERSION=3420000
DOWNLOAD_URL=https://sqlite.org/2023/sqlite-autoconf-3420000.tar.gz
MD5_SUM=0c5a92bc51cf07cae45b4a1e94653dea
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr     \
		--disable-static  \
		--enable-fts{4,5} \
		CPPFLAGS="-DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 -DSQLITE_ENABLE_DBSTAT_VTAB=1 -DSQLITE_SECURE_DELETE=1 -DSQLITE_ENABLE_FTS3_TOKENIZER=1" &&
	make $MAKEFLAGS
    make install
}

