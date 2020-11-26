#!/bin/bash
set -e

if [[ "$SHELL" == "/bin/bash" ]]; then
    echo "Setting up bash"
    ln -svf "$PWD/bash/.bashrc" "$HOME/.bashrc"
elif [[ "$SHELL" == "/bin/zsh" ]]; then
    echo "Setting up zsh"
    cd zsh
    bash setup-oh-my-zsh.sh
    cd ..
else
    echo "No setup-steps for $SHELL."
fi

echo "Linking files..."
tolink=(".vimrc .tmux.conf .gitignore")
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

echo "Done"
