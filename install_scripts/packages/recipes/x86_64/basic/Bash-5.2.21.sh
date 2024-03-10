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
PACKAGE_NAME=bash
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="ad5b38410e3bf0e9bcc20e2765f5e3f9"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/bash/bash-5.2.21.tar.gz"
DOWNLOAD_URLS["2d1691a629c558e894dbb78ee6bf34ef"]="https://www.linuxfromscratch.org/patches/lfs/12.1/bash-5.2.21-upstream_fixes-1.patch"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    patch -Np1 -i ../bash-5.2.21-upstream_fixes-1.patch
    ./configure --prefix=/usr             \
		--without-bash-malloc     \
		--with-installed-readline \
		--docdir=/usr/share/doc/bash-5.2.21
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    chown -R tester .
    su -s /usr/bin/expect tester << "EOF"
set timeout -1
spawn make tests
expect eof
lassign [wait] _ _ _ value
exit $value
EOF
}

install_source_package(){
    make install
}
