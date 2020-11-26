#!/bin/bash
VIM_PLUG="$HOME/.vim/autoload/plug.vim"
if [[ ! -f "$VIM_PLUG" ]]; then
    echo "Installing vim-plug..."
    curl -fLo $VIM_PLUG --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Installing vim plugins..."
    vim +PlugInstall +qall
else
    echo "vim-plug already installed"
fi

NVIM_CONFIG=$HOME/.config/nvim/init.vim
if [[ ! -f "$NVIM_CONFIG" ]]; then
    echo "Writing nvim config stub to $NVIM_CONFIG"
    mkdir -p $(dirname $NVIM_CONFIG)
    cat << EOF > $NVIM_CONFIG
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF
else
    echo "nvim already configured"
fi

