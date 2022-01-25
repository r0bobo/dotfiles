#!/usr/bin/env zsh

# Source global definitions
if [ -f /etc/zshrc ]; then
    source /etc/zshrc
fi

[[ "$ZSH_PROFILE_ENABLED" = true ]] && zmodload zsh/zprof
[[ "$ZSH_NO_USER_CONFIG" = true ]] && exit 0

# Remove packagekit hook to significantly increase performance
if type command_not_found_handler &>/dev/null; then
    unset -f command_not_found_handler
fi
