NVIM_CONFIG=~/.config/nvim/init.vim
echo "Writing config stub to $NVIM_CONFIG"
mkdir -p $(dirname $NVIM_CONFIG)
cat << EOF > $NVIM_CONFIG
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF

# install nvim app image
INSTALL_TO=~/.local/bin/nvim
echo "Installing nvim to $INSTALL_TO"
curl -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -o $INSTALL_TO --create-dirs && chmod u+x $INSTALL_TO

