# Bash
alias src="source $HOME/.bashrc"

# ls
alias ll="ls -l"
alias l="ls -lA"
alias lla="ls -lA"

# Git
alias gac="git add --all && git status && git commit -m"

# less
alias less="less -R"

# tmux
alias t="tmux"

# grep, excluding dotfiles and __pycache__
alias grp="grep --exclude-dir '**/__pycache__' --exclude-dir '**/.*' --exclude-dir '.*'"

# if nvim is installed, then prefer it over vim
if [[ ! -z "$(which nvim)" ]]; then
    alias vim="nvim"
fi

# Docker aliases
if [[ ! -z "$(which docker)" ]]; then
    alias di="docker image"
    alias dc="docker container"
    alias dps="docker ps -a"
fi
