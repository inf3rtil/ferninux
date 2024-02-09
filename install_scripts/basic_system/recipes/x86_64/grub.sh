#!/bin/bash

SRC_COMPRESSED_FILE=grub-2.06.tar.xz
SRC_FOLDER=grub-2.06

build_source_package(){
    unset {C,CPP,CXX,LD}FLAGS
    patch -Np1 -i ../grub-2.06-upstream_fixes-1.patch
    ./configure --prefix=/usr \
		--sysconfdir=/etc \
		--disable-efiemu \
		--disable-werror
    make
    make install
    mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
}

