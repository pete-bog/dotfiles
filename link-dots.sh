tolink=(".vimrc .tmux.conf .bash_custom .gitconfig .gitignore")
for f in $tolink; do
    ln -sf "$PWD/$f" "$HOME/$f"
    echo "linked $f to $HOME/$f"
done

echo ". ~/.bash_custom" >> ~/.bashrc
echo "Sourced $HOME/.bash_custom in $HOME/.bashrc"

echo "Done"
