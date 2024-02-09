#!/bin/bash

set -e

declare -a recipes=()
recipes+=(man-pages.sh)
recipes+=(iana-etc.sh)
recipes+=(glibc.sh)
recipes+=(zlib.sh)
recipes+=(bzip2.sh)
recipes+=(xz.sh)
recipes+=(zstd.sh)
recipes+=(file.sh)
recipes+=(readline.sh)
recipes+=(m4.sh)
recipes+=(bc.sh)
recipes+=(flex.sh)
recipes+=(tcl.sh)
recipes+=(expect.sh)
recipes+=(dejagnu.sh)
recipes+=(binutils.sh)
recipes+=(gmp.sh)
recipes+=(mpfr.sh)
recipes+=(mpc.sh)
recipes+=(attr.sh)
recipes+=(acl.sh)
recipes+=(libcap.sh)
recipes+=(libxcrypt.sh)
recipes+=(shadow.sh)
recipes+=(gcc.sh)
recipes+=(pkgconf.sh)
recipes+=(ncurses.sh)
recipes+=(sed.sh)
recipes+=(psmisc.sh)
recipes+=(gettext.sh)
recipes+=(bison.sh)
recipes+=(grep.sh)
recipes+=(bash.sh)
recipes+=(libtool.sh)
recipes+=(gdbm.sh)
recipes+=(gperf.sh)
recipes+=(expat.sh)
recipes+=(inetutils.sh)
recipes+=(less.sh)
recipes+=(perl.sh)
recipes+=(xml-parser.sh)
recipes+=(intltool.sh)
recipes+=(autoconf.sh)
recipes+=(automake.sh)
recipes+=(openssl.sh)
recipes+=(kmod.sh)
recipes+=(libelf-elfutils.sh)
recipes+=(libffi.sh)
recipes+=(python.sh)
recipes+=(flit-core.sh)
recipes+=(wheel.sh)
recipes+=(ninja.sh)
recipes+=(meson.sh)
recipes+=(coreutils.sh)
recipes+=(check.sh)
recipes+=(diffutils.sh)
recipes+=(gawk.sh)
recipes+=(findutils.sh)
recipes+=(groff.sh)

if test $USE_UEFI -eq 1; then
    recipes+=(mandoc.sh)
    recipes+=(efivar.sh)
    recipes+=(popt.sh)
    recipes+=(efibootmgr.sh)
    recipes+=(freetype.sh)
    recipes+=(grub-efi.sh)
else
    recipes+=(grub.sh)
fi

recipes+=(gzip.sh)
recipes+=(iproute.sh)
recipes+=(kbd.sh)
recipes+=(libpipeline.sh)
recipes+=(make.sh)
recipes+=(patch.sh)
recipes+=(tar.sh)
recipes+=(texinfo.sh)
recipes+=(vim.sh)
recipes+=(markupsafe.sh)
recipes+=(jinja2.sh)
recipes+=(systemd.sh)
recipes+=(dbus.sh)
recipes+=(man-db.sh)
recipes+=(procps-ng.sh)
recipes+=(util-linux.sh)
recipes+=(e2fsprogs.sh)


SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

RECIPES_DIR=$SCRIPT_PATH/recipes/$FERNINUX_TARGET_ARCH
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
