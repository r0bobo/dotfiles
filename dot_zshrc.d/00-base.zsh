#!/bin/zsh

# Source global definitions
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
fi

# Remove packagekit hook to significantly increase performance
if type command_not_found_handler &>/dev/null; then
    unset -f command_not_found_handler
fi
