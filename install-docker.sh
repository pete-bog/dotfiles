#!/bin/bash
distro=$(cat /etc/os-release | grep ^NAME=)
distro=${distro:5}
distro=$(echo $distro | sed 's/"//g')

if [[ "$distro" == "Ubuntu" ]]; then
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    username=$(whoami)
    sudo usermod -aG docker $username
else
    echo "No options set for '$distro'!"
    exit 1
fi
echo "Done. Please log in and out/reboot to refresh your groups."
