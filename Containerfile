FROM ubuntu:22.04

RUN apt update && apt upgrade
RUN apt install dialog parted udev wget dosfstools sudo xz-utils  -y
