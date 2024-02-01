#!/bin/bash

echo "<ferninux>" > /etc/hostname

cat > /etc/hosts << "EOF"
# Begin /etc/hosts
127.0.0.1 localhost.localdomain localhost
127.0.1.1 ferninux.localdomain ferninux
::1
 localhost ip6-localhost ip6-loopback
ff02::1
 ip6-allnodes
ff02::2
 ip6-allrouters
# End /etc/hosts
EOF
