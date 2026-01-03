#!/bin/bash

podman build --tag ferninux:latest ./

podman run --privileged --tty --hostname ferninux-build --interactive --volume $(pwd):/ferninux --workdir /ferninux ferninux:latest /bin/bash

