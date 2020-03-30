tolink=(".vimrc .tmux.conf .bash_custom .gitignore")
for f in $tolink; do
    ln -sf "$PWD/$f" "$HOME/$f"
    echo "Linked $f to $HOME/$f"
done

tocopy=(".gitconfig")
for f in $tocopy; do
    ln -sf "$PWD/$f" "$HOME/$f"
    echo "Copied $f to $HOME/$f"
done

echo ". ~/.bash_custom" >> ~/.bashrc
echo "Sourced $HOME/.bash_custom in $HOME/.bashrc"

echo "Done"
