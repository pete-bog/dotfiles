tolink=(".vimrc .tmux.conf .bash_custom .gitignore")
for f in $tolink; do
    ln -sf "$PWD/$f" "$HOME/$f"
    echo "Linked $f to $HOME/$f"
done

tocopy=(".gitconfig")
for f in $tocopy; do
    # only copy if doesn'y already exist
    cp --no-clobber "$PWD/$f" "$HOME/$f"
    echo "Copied $f to $HOME/$f"
done

if [[ -z "$(grep "~/.bash_custom" ~/.bashrc)" ]]; then
    echo ". ~/.bash_custom" >> ~/.bashrc
    echo "Sourced $HOME/.bash_custom in $HOME/.bashrc"
fi

echo "Done"
