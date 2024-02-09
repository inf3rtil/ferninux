#!/bin/bash

SRC_COMPRESSED_FILE=perl-5.38.0.tar.xz
SRC_FOLDER=perl-5.38.0

build_source_package(){
    sh Configure -des \
       -Dprefix=/usr \
       -Dvendorprefix=/usr \
       -Dprivlib=/usr/lib/perl5/5.38/core_perl \
       -Darchlib=/usr/lib/perl5/5.38/core_perl \
       -Dsitelib=/usr/lib/perl5/5.38/site_perl \
       -Dsitearch=/usr/lib/perl5/5.38/site_perl \
       -Dvendorlib=/usr/lib/perl5/5.38/vendor_perl \
       -Dvendorarch=/usr/lib/perl5/5.38/vendor_perl
    make $MAKEFLAGS
    make install
}

