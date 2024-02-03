#!/bin/bash

set -e


recipes=(
    man-pages.sh
    iana-etc.sh
    glibc.sh
    zlib.sh
    bzip2.sh
    xz.sh
    zstd.sh
    file.sh
    readline.sh
    m4.sh
    bc.sh
    flex.sh
    tcl.sh
    expect.sh
    dejagnu.sh
    binutils.sh
    gmp.sh
    mpfr.sh
    mpc.sh
    attr.sh
    acl.sh
    libcap.sh
    libxcrypt.sh
    shadow.sh
    gcc.sh
    pkgconf.sh
    ncurses.sh
    sed.sh
    psmisc.sh
    gettext.sh
    bison.sh
    grep.sh
    bash.sh
    libtool.sh
    gdbm.sh
    gperf.sh
    expat.sh
    inetutils.sh
    less.sh
    perl.sh
    xml-parser.sh
    intltool.sh
    autoconf.sh
    automake.sh
    openssl.sh
    kmod.sh
    libelf-elfutils.sh
    libffi.sh
    python.sh
    flit-core.sh
    wheel.sh
    ninja.sh
    meson.sh
    coreutils.sh
    check.sh
    diffutils.sh
    gawk.sh
    findutils.sh
    groff.sh
    grub.sh
    gzip.sh
    iproute.sh
    kbd.sh
    libpipeline.sh
    make.sh
    patch.sh
    tar.sh
    texinfo.sh
    vim.sh
    markupsafe.sh
    jinja2.sh
    systemd.sh
    dbus.sh
    man-db.sh
    procps-ng.sh
    util-linux.sh
    e2fsprogs.sh
)

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

RECIPES_DIR=$SCRIPT_PATH/basic_system
SOURCES_ROOT_DIR=/sources

mkdir -p /build_log

cd $RECIPES_DIR

for file in "${recipes[@]}"
do
    if [ -x "$file" ]; then
        . ./"$file"
	echo "extracting files from $SRC_COMPRESSED_FILE"
	rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
	tar xvf $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
	cd $SOURCES_ROOT_DIR/$SRC_FOLDER
	build_source_package
	rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
	cd $RECIPES_DIR
    else
        echo "File $file is not executable."
    fi
done

rm -rf /tmp/*
find /usr/lib /usr/libexec -name \*.la -delete
find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf
userdel -r tester
