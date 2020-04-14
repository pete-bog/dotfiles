#!/bin/bash
distro=$(cat /etc/os-release | grep ^NAME=)
distro=${distro:5}
distro=$(echo $distro | sed 's/"//g')

# alternative to materia is arc-theme
GENERIC="xfce4-terminal"
UBUNTU="arc-theme materia-gtk-theme papirus-icon-theme"
DEBIAN=""
CENTOS=""

if [[ "$distro" == "Ubuntu" ]]; then
    read -p "Install mate or gnome?" choice
    if [[ $choice == "mate" ]]; then
        sudo apt install -y ubuntu-mate-desktop
    elif [[ $choice == "gnome" ]]; then
        sudo apt install -y ubuntu-gnome-desktop
    else
        echo "'$choice' is not 'mate' or 'gnome' exiting."
        exit 1
    fi
    sudo apt install -y $GENERIC $UBUNTU
    sed -i "s/^XSession=.*$/XSession=$choice/g" /var/lib/AccountsService/users/$(whoami)
    echo "Default session set to '$choice'. Please log out and in."
elif [[ "$distro" == "debian" ]]; then
    apt install -y $GENERIC $DEBIAN
elif [[ "$distro" == "centos" ]]; then
    sudo yum install -y $GENERIC $CENTOS
else
    echo "No options set for '$distro'!"
fi
