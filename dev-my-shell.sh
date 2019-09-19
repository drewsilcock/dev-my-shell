# Install Linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

brew install llvm
brew install zsh

# Rust and Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Wasmer
curl https://get.wasmer.io -sSfL | sh

cp ./vimrc $HOME/.vimrc
cp ./zshrc $HOME/.zshrc

# Install all vim plugins
vim +PlugInstall +qall

# Install all zsh plugins & start up zsh session
zsh
