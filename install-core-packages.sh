#!/bin/bash
distro=$(cat /etc/os-release | grep ^NAME=)
distro=${distro:5}
distro=$(echo $distro | sed 's/"//g')

GENERIC="vim git tmux openssh-server curl wget xclip unar python3 python3-pip exuberant-ctags"
UBUNTU="net-tools"
DEBIAN=""
CENTOS=""

if [[ "$distro" == "Ubuntu" ]]; then
    sudo apt install -y $GENERIC $UBUNTU
elif [[ "$distro" == "debian" ]]; then
    apt install -y $GENERIC $DEBIAN
elif [[ "$distro" == "centos" ]]; then
    sudo yum install -y $GENERIC $CENTOS
else
    echo "No options set for '$distro'!"
fi
