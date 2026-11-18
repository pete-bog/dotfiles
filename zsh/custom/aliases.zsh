# Zsh
alias src="source $HOME/.zshrc"

# ls
alias ll="ls -l"
alias l="ls -lA"
alias lla="ls -lA"

# Git: the oh-my-zsh git plugin provides the standard aliases (including
# main/master detection). Only personal additions and overrides go here.
alias gs="git status"
alias gaa="git add --all && git status"
alias gbl="git blame -b -w"
alias gclean="git clean -fd"
alias gcps="git cherry-pick -s"
alias gmt="git mergetool --no-prompt"
alias gmtvim="git mergetool --no-prompt --tool=vimdiff"
alias gup="git pull --rebase"
alias gupv="git pull --rebase -v"

# other
alias grep="grep --color=auto"
alias less="less -R"

# tmux
alias t="tmux"

# grep, excluding dotfiles and __pycache__
alias grp="grep --exclude-dir '**/__pycache__' --exclude-dir '**/.*' --exclude-dir '.*'"

# if nvim is installed, then prefer it over vim
if command -v nvim >/dev/null; then
    alias vim="nvim"
fi

# virtualenv: find an activate script near the current directory and source it
activate_virtual_env() {
    local venv="$(find . -maxdepth 3 -type f -name "activate" | head -n 1)"
    if [[ -z "$venv" ]]; then
        printf "No virtualenv found in current directory\n"
    else
        source "$venv"
    fi
}
alias activate="activate_virtual_env"

# Docker
if command -v docker >/dev/null; then
    alias d="docker"
    alias dr="docker run -it --rm"
    alias di="docker images"
    alias dps="docker ps -a"
    alias dl="docker load"

    # Loppers are like big pruners - remove everything that has a <none> in it
    docker_images_lop() {
        local to_rm="$(docker images | grep '<none>' | grep -oE '[a-f0-9]{12}' | tr '\n' ' ')"
        if [[ -n "$to_rm" ]]; then
            docker rmi ${=to_rm}
        else
            echo "Found no <none> images to delete" >&2
        fi
    }
fi
