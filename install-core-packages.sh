#!/bin/bash
distro=$(cat /etc/os-release | grep ^NAME=)
distro=${distro:5}
distro=$(echo $distro | sed 's/"//g')

if [[ "$distro" == "Ubuntu" ]]; then
    sudo apt install -y vim git tmux konsole openssh-server curl
elif [[ "$distro" == "debian" ]]; then
    apt install -y sudo vim git tmux konsole openssh-server curl wget
elif [[ "$distro" == "centos" ]]; then
    sudo yum install -y sudo vim git tmux konsole openssh-server curl wget
else
    echo "No options set for '$distro'!"
fi
