#!/bin/bash

SRC_COMPRESSED_FILE=efibootmgr-18.tar.gz
SRC_FOLDER=efibootmgr-18

build_source_package(){
    make EFIDIR=LFS EFI_LOADER=grubx64.efi
    make install EFIDIR=LFS
}
