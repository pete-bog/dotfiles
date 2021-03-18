if [[ "$PLATFORM" == "Linux" ]]; then
    alias ls="ls --color=auto"

    # copy and paste aliases
    alias copy="xclip -i -selection clipboard"
    alias paste="xclip -o -selection clipboard"

    # distro specific
    if [ "$DISTRO" == "Ubuntu" ]; then
        alias pkg="apt show"
        alias pkginstall="sudo apt install"
        alias pkgi="sudo apt install"
        alias pkgremove="sudo apt remove"
        alias pkgr="sudo apt remove"
        alias pkgsearch="apt search"
        alias pkgs="apt search"
        alias pkgupdate="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
        alias pkgu="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
        # Emulate macos 'open' behaviour
        alias open="xdg-open"
    fi
fi
