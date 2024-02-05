#!/bin/bash

SRC_COMPRESSED_FILE=grub-2.06.tar.xz
SRC_FOLDER=grub-2.06

build_source_package(){
    mkdir -pv /usr/share/fonts/unifont &&
	gunzip -c ../unifont-15.0.06.pcf.gz > /usr/share/fonts/unifont/unifont.pcf
    unset {C,CPP,CXX,LD}FLAGS
    patch -Np1 -i ../grub-2.06-upstream_fixes-1.patch

    ./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --disable-efiemu     \
            --enable-grub-mkfont \
            --with-platform=efi  \
            --target=x86_64      \
            --disable-werror     &&
	unset TARGET_CC &&
	make $MAKEFLAGS
    make install &&
	mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
}
