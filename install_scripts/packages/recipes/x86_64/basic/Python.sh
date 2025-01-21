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
MD5_SUM="e7c178b97bf8f7ccd677b94d614f7b3c"
DOWNLOAD_URLS[$MD5_SUM]="https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tar.xz"
DOWNLOAD_URLS["8a6310f6288e7f60c3565277ec3b5279"]="https://www.python.org/ftp/python/doc/3.12.2/python-3.12.2-docs-html.tar.bz2"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr        \
		--enable-shared      \
		--with-system-expat  \
		--enable-optimizations
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make install
    cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF
    install -v -dm755 /usr/share/doc/python-3.12.2/html

    tar --no-same-owner \
	-xvf ../python-3.12.2-docs-html.tar.bz2
    cp -R --no-preserve=mode python-3.12.2-docs-html/* \
       /usr/share/doc/python-3.12.2/html
}
