# Dev My Shell

Fed up of getting stuck using an ugly colour-less bash prompt without your normal vim config and environment setup? This script will automatically set your environment up with some basic defaults to get you going.

Script to automatically set up your shell with everything you need for development.

Currently implemented:

- Install Linuxbrew
- Install LLVM
- Install zsh and set up full environment with plugins
- Set up full Vim environment with plugins
- Install Cargo
- Install Wasmer

Todo:

- Set up full tmux environment with plugins

## How To Use

Simply run the `install.sh` script and that'll handle the rest. *Warning*: It'll take a while.

```sh
cd dev-my-shell
./dev-my-shell.sh
```

## Thanks

The vimrc and zshrc are mostly taken from https://github.com/jameshclrk/dotfiles. They are an essential set of defaults.
