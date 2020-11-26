# Git
alias gs="git status"
alias ga="git add"
alias gaa="git add --all && git status"
alias gc="git commit -m"
alias gac="git add --all && git status && git commit -m"
# other
alias grep="grep --color=auto"
alias less="less -R"
# virtualenv
alias activate="source .venv/bin/activate"
# tmux
alias t="tmux"

# if nvim is installed, then prefer it over vim
if [[ ! -z "$(which nvim)" ]]; then
    alias vim="nvim"
fi
