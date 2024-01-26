#!/bin/bash
set -e


echo "Linking dotfiles..."
find ~+ -maxdepth 2 -name '.*' -type f -not -name "*.swp" -exec bash -c 'ln -svf {} $HOME/$(basename {})' \;

if [[ "$SHELL" == "/bin/bash" || "$SHELL" == "/usr/bin/bash" ]]; then
    echo "Setting up bash"
    # Above step will have already linked the bashrc
    #ln -svf "$PWD/bash/.bashrc" "$HOME/.bashrc"
elif [[ "$SHELL" == "/bin/zsh" ]]; then
    echo "Setting up zsh"
    cd zsh
    bash setup-oh-my-zsh.sh
    cd ..
else
    echo "No setup-steps for $SHELL."
fi

echo "Done"
