#!/bin/bash

PACKAGE_NAME=p11-kit
VERSION=0.25.0
DOWNLOAD_URL=https://github.com/p11-glue/p11-kit/releases/download/0.25.0/p11-kit-0.25.0.tar.xz
MD5_SUM=9fcb1ec80b5d083dd9b34122fa7c3c23
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed 's/if (gi/& \&\& gi != C_GetInterface/' \
	-i p11-kit/modules.c
    sed '20,$ d' -i trust/trust-extract-compat &&
cat >> trust/trust-extract-compat << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF
    mkdir p11-build &&
	cd    p11-build &&

	meson setup ..            \
	      --prefix=/usr       \
	      --buildtype=release \
	      -Dtrust_paths=/etc/pki/anchors &&
	ninja
    ninja install &&
	ln -sfv /usr/libexec/p11-kit/trust-extract-compat \
	   /usr/bin/update-ca-certificates
    ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
}

