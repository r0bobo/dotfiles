#!/bin/bash

./create_symlinks.py ~/dotfiles


# Run and update vim-plug
nvim -c "PlugUpgrade | PlugInstall | PlugUpgrade | q | q"
