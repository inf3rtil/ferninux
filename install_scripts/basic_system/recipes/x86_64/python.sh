#!/bin/bash

SRC_COMPRESSED_FILE=Python-3.11.4.tar.xz
SRC_FOLDER=Python-3.11.4

build_source_package(){
    ./configure --prefix=/usr \
		--enable-shared \
		--with-system-expat \
		--with-system-ffi \
		--enable-optimizations
    make $MAKEFLAGS
    make install
    cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

    install -v -dm755 /usr/share/doc/python-3.11.4/html

    tar --strip-components=1  \
	--no-same-owner       \
	--no-same-permissions \
	-C /usr/share/doc/python-3.11.4/html \
	-xvf ../python-3.11.4-docs-html.tar.bz2
}

