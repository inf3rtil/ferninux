#!/bin/bash

SRC_COMPRESSED_FILE=perl-5.38.0.tar.xz
SRC_FOLDER=perl-5.38.0

build_source_package(){
    export BUILD_ZLIB=False
    export BUILD_BZIP2=0
    sh Configure -des                                         \
       -Dprefix=/usr                                \
       -Dvendorprefix=/usr                          \
       -Dprivlib=/usr/lib/perl5/5.38/core_perl      \
       -Darchlib=/usr/lib/perl5/5.38/core_perl      \
       -Dsitelib=/usr/lib/perl5/5.38/site_perl      \
       -Dsitearch=/usr/lib/perl5/5.38/site_perl     \
       -Dvendorlib=/usr/lib/perl5/5.38/vendor_perl  \
       -Dvendorarch=/usr/lib/perl5/5.38/vendor_perl \
       -Dman1dir=/usr/share/man/man1                \
       -Dman3dir=/usr/share/man/man3                \
       -Dpager="/usr/bin/less -isR"                 \
       -Duseshrplib                                 \
       -Dusethreads
    make $MAKEFLAGS
    make install
    unset BUILD_ZLIB BUILD_BZIP2
}

