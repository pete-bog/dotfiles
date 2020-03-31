#!/bin/bash
echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Installing vim plugins..."
vim +PlugInstall +qall

NVIM_CONFIG=~/.config/nvim/init.vim
echo "Writing nvim config stub to $NVIM_CONFIG"
mkdir -p $(dirname $NVIM_CONFIG)
cat << EOF > $NVIM_CONFIG
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF

