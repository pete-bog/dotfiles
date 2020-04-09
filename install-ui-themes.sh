#!/bin/bash
distro=$(cat /etc/os-release | grep ^NAME=)
distro=${distro:5}
distro=$(echo $distro | sed 's/"//g')

# alternative to materia is arc-theme
GENERIC="materia-gtk-theme papirus-icon-theme"
UBUNTU="ubuntu-gnome-desktop"
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
