#!/bin/bash

SRC_COMPRESSED_FILE=ninja-1.11.1.tar.gz
SRC_FOLDER=ninja-1.11.1

build_source_package(){
    export NINJAJOBS=4
    sed -i '/int Guess/a \
    int j = 0;\
    char* jobs = getenv( "NINJAJOBS" );\
    if ( jobs != NULL ) j = atoi( jobs );\
    if ( j > 0 ) return j;\
' src/ninja.cc
    python3 configure.py --bootstrap
    install -vm755 ninja /usr/bin/
    install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
    install -vDm644 misc/zsh-completion /usr/share/zsh/site-functions/_ninja
}

