#!/bin/bash
set -e
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Force link the .zshrc file as oh-my-zsh overrites it
ln -sfv $PWD/.zshrc $HOME/.zshrc

for f in custom/*.zsh; do
    ln -sfv $PWD/$f $HOME/.oh-my-zsh/$f
done

for f in custom/themes/*; do
    ln -sfv $PWD/$f $HOME/.oh-my-zsh/$f
done
