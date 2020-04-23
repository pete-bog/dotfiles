#!/bin/bash
USERNAME=user
PROGS="$(which apt), $(which snap)" 

if [[ "$(whoami)" != "root" ]]; then
    echo "This script must be run as root"
    exit 1
fi

usermod -aG sudo $USERNAME
groupadd installer
usermod -aG installer $USERNAME

echo "%installer ALL= NOPASSWD: $PROGS" >> /etc/sudoers

echo "Done, please log in and out/reboot for changes to take effect"

