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

# if nvim is installed, then prefer it over vim
if [[ ! -z "$(which nvim)" ]]; then
    alias vim="nvim"
fi
