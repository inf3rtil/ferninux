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
PACKAGE_NAME=grub
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="60c564b1bdc39d8e43b3aab4bc0fb140"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/grub/grub-2.12.tar.xz"
DOWNLOAD_URLS["72f95e7ecb47a4c7ed610babe6959ead"]="https://unifoundry.com/pub/unifont/unifont-15.1.04/font-builds/unifont-15.1.04.pcf.gz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    mkdir -pv /usr/share/fonts/unifont &&
	gunzip -c ../unifont-15.1.04.pcf.gz > /usr/share/fonts/unifont/unifont.pcf
    unset {C,CPP,CXX,LD}FLAGS
    echo depends bli part_gpt > grub-core/extra_deps.lst
    ./configure --prefix=/usr        \
		--sysconfdir=/etc    \
		--disable-efiemu     \
		--enable-grub-mkfont \
		--with-platform=efi  \
		--target=x86_64      \
		--disable-werror     &&
	unset TARGET_CC
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make install &&
	mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
}
