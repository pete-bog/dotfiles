#!/bin/bash
alias d="docker"
alias dr="docker run -it --rm"
alias di="docker images"
alias dps="docker ps -a"
alias dl="docker load"

# Loppers are like big pruners - remove everythig that has a <none> in it
docker_images_lop() {
    to_rm=$(docker images | grep -P '<none>' | grep -oP '[a-f0-9]{12}' | tr '\n' ' ')
    if [[ -n "$to_rm" ]]; then
        docker rmi $to_rm
    else
        echo "Found no <none> images to delete" >> /dev/stderr
    fi
}

