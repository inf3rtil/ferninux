#!/bin/bash

set -e

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

RECIPES_DIR=$SCRIPT_PATH/recipes/$FERNINUX_TARGET_ARCH
SOURCES_ROOT_DIR=/sources

mkdir -p /build_log

cd $RECIPES_DIR

declare -a recipes=()
recipes+=(Man-pages-6.06)
recipes+=(Iana-Etc-20240125)
recipes+=(Glibc-2.39)
recipes+=(Zlib-1.3.1)
recipes+=(Bzip2-1.0.8)
recipes+=(Xz-5.4.6)
recipes+=(Zstd-1.5.5)
recipes+=(File-5.45)
recipes+=(Readline-8.2)
recipes+=(M4-1.4.19)
recipes+=(Bc-6.7.5)
recipes+=(Flex-2.6.4)
recipes+=(Tcl-8.6.13)
recipes+=(Expect-5.45.4)
recipes+=(DejaGNU-1.6.3)
recipes+=(Pkgconf-2.1.1)
recipes+=(Binutils-2.42)
recipes+=(GMP-6.3.0)
recipes+=(MPFR-4.2.1)
recipes+=(MPC-1.3.1)
recipes+=(Attr-2.5.2)
recipes+=(Acl-2.3.2)
recipes+=(Libcap-2.69)
recipes+=(Libxcrypt-4.4.36)
recipes+=(Shadow-4.14.5)
recipes+=(GCC-13.2.0)
recipes+=(Ncurses-6.4-20230520)
recipes+=(Sed-4.9)
recipes+=(Psmisc-23.6)
recipes+=(Gettext-0.22.4)
recipes+=(Bison-3.8.2)
recipes+=(Grep-3.11)
recipes+=(Bash-5.2.21)
recipes+=(Libtool-2.4.7)
recipes+=(GDBM-1.23)
recipes+=(Gperf-3.1)
recipes+=(Expat-2.6.0)
recipes+=(Inetutils-2.5)
recipes+=(Less-643)
recipes+=(Perl-5.38.2)
recipes+=(XML::Parser-2.47)
recipes+=(Intltool-0.51.0)
recipes+=(Autoconf-2.72)
recipes+=(Automake-1.16.5)
recipes+=(OpenSSL-3.2.1)
recipes+=(Kmod-31)
recipes+=(Elfutils-0.190)
recipes+=(Libffi-3.4.4)
recipes+=(Python-3.12.2)
recipes+=(Flit-Core-3.9.0)
recipes+=(Wheel-0.42.0)
recipes+=(Setuptools-69.1.0)
recipes+=(Ninja-1.11.1)
recipes+=(Meson-1.3.2)
recipes+=(Coreutils-9.4)
recipes+=(Check-0.15.2)
recipes+=(Diffutils-3.10)
recipes+=(Gawk-5.3.0)
recipes+=(Findutils-4.9.0)
recipes+=(Groff-1.23.0)
if test $USE_UEFI -eq 1; then
    recipes+=(mandoc-1.14.6)
    recipes+=(efivar-39)
    recipes+=(popt-1.19)
    recipes+=(efibootmgr-18)
    recipes+=(freetype-2.13.2)
    recipes+=(grub-efi-2.12)
else
recipes+=(GRUB-2.12)
fi
recipes+=(Gzip-1.13)
recipes+=(IPRoute2-6.7.0)
recipes+=(Kbd-2.6.4)
recipes+=(Libpipeline-1.5.7)
recipes+=(Make-4.4.1)
recipes+=(Patch-2.7.6)#TODO
recipes+=(Tar-1.35)
recipes+=(Texinfo-7.1)
recipes+=(Vim-9.1.0041)
recipes+=(MarkupSafe-2.1.5)
recipes+=(Jinja2-3.1.3)
recipes+=(Systemd-255)
recipes+=(D-Bus-1.14.10)
recipes+=(Man-DB-2.12.0)
recipes+=(Procps-ng-4.0.4)
recipes+=(Util-linux-2.39.3)
recipes+=(E2fsprogs-1.47.0)

for file in "${recipes[@]}"
do
    if [ -x "$file.sh" ]; then
        . ./"$file.sh"
	echo "extracting files from $SRC_COMPRESSED_FILE"
	rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
	tar xvf $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
	cd $SOURCES_ROOT_DIR/$SRC_FOLDER
	config_source_package
	build_source_package
	install_source_package
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
