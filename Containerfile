FROM ubuntu:22.04

RUN apt update && apt upgrade -y
RUN apt install -y \
    dialog \
    parted \
    udev \
    wget \
    dosfstools \
    sudo \
    xz-utils \
    gcc \
    g++ \
    make \
    texinfo \
    build-essential \
    libc6-dev \
    python3 \
    gawk \
    bison \
    jq
