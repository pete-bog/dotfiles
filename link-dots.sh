#!/bin/bash
set -e

echo "Linking files..."
tolink=(".vimrc .tmux.conf .bash_custom .gitignore")
for f in $tolink; do
    ln -svf "$PWD/$f" "$HOME/$f"
done

echo "Copying files..."
tocopy=(".gitconfig")
for f in $tocopy; do
    # only copy if doesn't already exist
    if [[ ! -f "$HOME/$f" ]]; then
        cp -v "$PWD/$f" "$HOME/$f"
    fi
done

if [[ -z "$(grep "~/.bash_custom" ~/.bashrc)" ]]; then
    echo ". ~/.bash_custom" >> ~/.bashrc
    echo "Sourced $HOME/.bash_custom in $HOME/.bashrc"
fi

echo "Done"
