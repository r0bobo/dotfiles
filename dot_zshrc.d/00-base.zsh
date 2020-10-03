#!/usr/bin/env zsh

# Source global definitions
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
fi

[[ -v ZSH_PROFILE_ENABLED ]] && zmodload zsh/zprof
[[ -v ZSH_NO_USER_CONFIG ]] && exit 0

# Remove packagekit hook to significantly increase performance
if type command_not_found_handler &>/dev/null; then
    unset -f command_not_found_handler
fi
