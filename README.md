[![Build Status](https://travis-ci.org/r0bobo/dotfiles.svg?branch=master)](https://travis-ci.org/r0bobo/dotfiles)

# Deans Dotfiles

## Install
```bash
git clone git@github.com:r0bobo/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && make test && make
```

## Directory Structure
```bash
.
|-- configs/
|   |-- .config/
|   |   |-- alacritty/
|   |   |   `-- alacritty.yml
|   |   |-- nvim/
|   |   |   `-- init.vim
|   |   `-- termite/
|   |       `-- config
|   |-- .ctags
|   |-- .gitconfig
|   |-- .ignore
|   |-- .tmux.conf
|   |-- .tmuxline.conf
|   `-- .zshrc
|-- _config.yml
|-- .gitignore
|-- Makefile
|-- README.md
|-- requirements.txt
|-- test.sh*
`-- .travis.yml
```

This is a personal dotfile repository for:
* Neovim
* Termux
* Zsh
