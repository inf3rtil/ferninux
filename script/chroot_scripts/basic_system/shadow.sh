#!/bin/bash

SRC_COMPRESSED_FILE=shadow-4.13.tar.xz
SRC_FOLDER=shadow-4.13

build_source_package(){
    sed -i 's/groups$(EXEEXT) //' src/Makefile.in
    find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \;
    find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
    find man -name Makefile.in -exec sed -i 's/passwd\.5 / /' {} \;

    sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD SHA512:' \
	-e 's@#\(SHA_CRYPT_..._ROUNDS 5000\)@\100@' \
	-e 's:/var/spool/mail:/var/mail:' \
	-e '/PATH=/{s@/sbin:@@;s@/bin:@@}' \
	-i etc/login.defs

    touch /usr/bin/passwd
    ./configure --sysconfdir=/etc \
		--disable-static \
		--with-group-name-max-length=32
    make $MAKEFLAGS
    make exec_prefix=/usr install
    make -C man install-man
    pwconv
    grpconv
    mkdir -p /etc/default
    useradd -D --gid 999
    sed -i '/MAIL/s/yes/no/' /etc/default/useradd
    passwd root
}

