# install nvim app image
INSTALL_TO=~/.local/bin/nvim
echo "Installing nvim to $INSTALL_TO"
curl -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -o $INSTALL_TO --create-dirs && chmod u+x $INSTALL_TO

