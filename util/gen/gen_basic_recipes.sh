#!/bin/bash

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

basic_packages="Man-pages-6.06
Iana-Etc-20240125
Glibc-2.39
Zlib-1.3.1
Bzip2-1.0.8
Xz-5.4.6
Zstd-1.5.5
File-5.45
Readline-8.2
M4-1.4.19
Bc-6.7.5
Flex-2.6.4
Tcl-8.6.13
Expect-5.45.4
DejaGNU-1.6.3
Pkgconf-2.1.1
Binutils-2.42
GMP-6.3.0
MPFR-4.2.1
MPC-1.3.1
Attr-2.5.2
Acl-2.3.2
Libcap-2.69
Libxcrypt-4.4.36
Shadow-4.14.5
GCC-13.2.0
Ncurses-6.4-20230520
Sed-4.9
Psmisc-23.6
Gettext-0.22.4
Bison-3.8.2
Grep-3.11
Bash-5.2.21
Libtool-2.4.7
GDBM-1.23
Gperf-3.1
Expat-2.6.0
Inetutils-2.5
Less-643
Perl-5.38.2
XML::Parser-2.47
Intltool-0.51.0
Autoconf-2.72
Automake-1.16.5
OpenSSL-3.2.1
Kmod-31
Elfutils-0.190
Libffi-3.4.4
Python-3.12.2
Flit-Core-3.9.0
Wheel-0.42.0
Setuptools-69.1.0
Ninja-1.11.1
Meson-1.3.2
Coreutils-9.4
Check-0.15.2
Diffutils-3.10
Gawk-5.3.0
Findutils-4.9.0
Groff-1.23.0
GRUB-2.12
Gzip-1.13
IPRoute2-6.7.0
Kbd-2.6.4
Libpipeline-1.5.7
Make-4.4.1
Patch-2.7.6
Tar-1.35
Texinfo-7.1
Vim-9.1.0041
MarkupSafe-2.1.5
Jinja2-3.1.3
Systemd-255
D-Bus-1.14.10
Man-DB-2.12.0
Procps-ng-4.0.4
Util-linux-2.39.3
E2fsprogs-1.47.0"

readarray -t packages <<<"$basic_packages"

for recipe in "${packages[@]}"
do
    cp -n $WORK_DIR/util/template_recipe.sh $WORK_DIR/install_scripts/basic_system/recipes/$FERNINUX_TARGET_ARCH/$recipe.sh
done

for recipe in "${packages[@]}"
do
    echo "recipes+=($recipe)"
done

#TODO: generate the recipes list in a separate file and source it on build_basic_system
