#!/bin/bash

SRC_COMPRESSED_FILE=tcl8.6.13-src.tar.gz
SRC_FOLDER=tcl8.6.13

build_source_package(){
    SRCDIR=$(pwd)
    cd unix
    ./configure --prefix=/usr \
		--mandir=/usr/share/man
    make $MAKEFLAGS
    sed -e "s|$SRCDIR/unix|/usr/lib|" \
	-e "s|$SRCDIR|/usr/include|" \
	-i tclConfig.sh
    sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.5|/usr/lib/tdbc1.1.5|" \
	-e "s|$SRCDIR/pkgs/tdbc1.1.5/generic|/usr/include|" \
	-e "s|$SRCDIR/pkgs/tdbc1.1.5/library|/usr/lib/tcl8.6|" \
	-e "s|$SRCDIR/pkgs/tdbc1.1.5|/usr/include|" \
	-i pkgs/tdbc1.1.5/tdbcConfig.sh
    sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.3|/usr/lib/itcl4.2.3|" \
	-e "s|$SRCDIR/pkgs/itcl4.2.3/generic|/usr/include|" \
	-e "s|$SRCDIR/pkgs/itcl4.2.3|/usr/include|" \
	-i pkgs/itcl4.2.3/itclConfig.sh
    unset SRCDIR

    make install
    chmod -v u+w /usr/lib/libtcl8.6.so
    make install-private-headers
    ln -sfv tclsh8.6 /usr/bin/tclsh
    mv /usr/share/man/man3/{Thread,Tcl_Thread}.3
    cd ..
    tar -xf ../tcl8.6.13-html.tar.gz --strip-components=1
    mkdir -v -p /usr/share/doc/tcl-8.6.13
    cp -v -r ./html/* /usr/share/doc/tcl-8.6.13
    
}

