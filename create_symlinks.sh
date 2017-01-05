#!/bin/bash

./create_symlinks.py '~/dotfiles' '~/dotfiles/dotfiles.conf'


# Run and update vim-plug
nvim -c "PlugUpgrade | PlugInstall | PlugUpgrade | q | q"
