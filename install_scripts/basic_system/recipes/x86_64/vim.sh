#!/bin/bash

SRC_COMPRESSED_FILE=vim-9.0.1677.tar.gz
SRC_FOLDER=vim-9.0.1677

build_source_package(){
    echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
    ln -sv vim /usr/bin/vi
    for L in /usr/share/man/{,*/}man1/vim.1; do
	ln -sv vim.1 $(dirname $L)/vi.1
    done
    ln -sv ../vim/vim90/doc /usr/share/doc/vim-9.0.1677
    cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc
" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1
set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
set background=dark
endif
" End /etc/vimrc
EOF
    
}

