#!/bin/bash

SRC_COMPRESSED_FILE=e2fsprogs-1.47.0.tar.gz
SRC_FOLDER=e2fsprogs-1.47.0

build_source_package(){
    mkdir -v build
    cd build
    ../configure --prefix=/usr \
		 --sysconfdir=/etc \
		 --enable-elf-shlibs \
		 --disable-libblkid \
		 --disable-libuuid \
		 --disable-uuidd \
		 --disable-fsck
    make $MAKEFLAGS
    make install
    rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
    gunzip -v /usr/share/info/libext2fs.info.gz
    install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info
    makeinfo -o doc/com_err.info ../lib/et/com_err.texinfo
    install -v -m644 doc/com_err.info /usr/share/info
    install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info

    sed 's/metadata_csum_seed,//' -i /etc/mke2fs.conf
}

