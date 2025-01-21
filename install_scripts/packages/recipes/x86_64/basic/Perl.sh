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

# package details
MD5_SUM="d3957d75042918a23ec0abac4a2b7e0a"
DOWNLOAD_URLS[$MD5_SUM]="https://www.cpan.org/src/5.0/perl-5.38.2.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
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
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    TEST_JOBS=$(nproc) make test_harness
}

install_source_package(){
    make install
    unset BUILD_ZLIB BUILD_BZIP2
}
