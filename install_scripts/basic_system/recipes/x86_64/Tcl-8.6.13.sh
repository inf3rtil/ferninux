#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg]-version.sh
# arrays for download and build
unset DOWNLOAD_URLS
unset BUILD_DEPS
unset RUNTIME_DEPS
declare -A DOWNLOAD_URLS
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

src_file=$BASH_SOURCE

# package details
PACKAGE_NAME=tcl
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="0e4358aade2f5db8a8b6f2f6d9481ec2"
DOWNLOAD_URLS[$MD5_SUM]="https://downloads.sourceforge.net/tcl/tcl8.6.13-src.tar.gz"
DOWNLOAD_URLS["4452f2f6d557f5598cca17b786d6eb68"]="https://downloads.sourceforge.net/tcl/tcl8.6.13-html.tar.gz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME$VERSION

config_source_package(){
    SRCDIR=$(pwd)
    cd unix
    ./configure --prefix=/usr           \
		--mandir=/usr/share/man
}

build_source_package(){
    make $MAKEFLAGS
    sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh

    sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.5|/usr/lib/tdbc1.1.5|" \
	-e "s|$SRCDIR/pkgs/tdbc1.1.5/generic|/usr/include|"    \
	-e "s|$SRCDIR/pkgs/tdbc1.1.5/library|/usr/lib/tcl8.6|" \
	-e "s|$SRCDIR/pkgs/tdbc1.1.5|/usr/include|"            \
	-i pkgs/tdbc1.1.5/tdbcConfig.sh

    sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.3|/usr/lib/itcl4.2.3|" \
	-e "s|$SRCDIR/pkgs/itcl4.2.3/generic|/usr/include|"    \
	-e "s|$SRCDIR/pkgs/itcl4.2.3|/usr/include|"            \
	-i pkgs/itcl4.2.3/itclConfig.sh

    unset SRCDIR
}

test_source_package(){
    make test
}

install_source_package(){
    make install
    chmod -v u+w /usr/lib/libtcl8.6.so
    make install-private-headers
    ln -sfv tclsh8.6 /usr/bin/tclsh
    mv /usr/share/man/man3/{Thread,Tcl_Thread}.3
    cd ..
    tar -xf ../tcl8.6.13-html.tar.gz --strip-components=1
    mkdir -v -p /usr/share/doc/tcl-8.6.13
    cp -v -r  ./html/* /usr/share/doc/tcl-8.6.13
}
