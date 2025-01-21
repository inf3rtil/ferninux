#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg].sh
# arrays for download and build
unset DOWNLOAD_URLS
unset BUILD_DEPS
unset RUNTIME_DEPS
declare -A DOWNLOAD_URLS
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

src_file=$BASH_SOURCE

# package details
PACKAGE_NAME=systemd
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="521cda27409a9edf0370c128fae3e690"
DOWNLOAD_URLS[$MD5_SUM]="https://github.com/systemd/systemd/archive/v255/systemd-255.tar.gz"
DOWNLOAD_URLS["8d9c1014445c463cf7c24c162b1e0686"]="https://www.linuxfromscratch.org/patches/lfs/12.1/systemd-255-upstream_fixes-1.patch"
DOWNLOAD_URLS["1ebe54d7a80f9abf8f2d14ddfeb2432d"]="https://anduin.linuxfromscratch.org/LFS/systemd-man-pages-255.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    sed -i -e 's/GROUP="render"/GROUP="video"/' \
	-e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in
    patch -Np1 -i ../systemd-255-upstream_fixes-1.patch
    mkdir -p build
    cd       build

    meson setup \
	  --prefix=/usr                 \
	  --buildtype=release           \
	  -Ddefault-dnssec=no           \
	  -Dfirstboot=false             \
	  -Dinstall-tests=false         \
	  -Dldconfig=false              \
	  -Dsysusers=false              \
	  -Drpmmacrosdir=no             \
	  -Dhomed=disabled              \
	  -Duserdb=false                \
	  -Dman=disabled                \
	  -Dmode=release                \
	  -Dpamconfdir=no               \
	  -Ddev-kvm-mode=0660           \
	  -Dnobody-group=nogroup        \
	  -Dsysupdate=disabled          \
	  -Dukify=disabled              \
	  -Ddocdir=/usr/share/doc/systemd-255 \
	  ..
}

build_source_package(){
    ninja
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    ninja install
    tar -xf ../../systemd-man-pages-255.tar.xz \
	--no-same-owner --strip-components=1   \
	-C /usr/share/man
    systemd-machine-id-setup
    systemctl preset-all
}
