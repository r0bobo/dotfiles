#!/usr/bin/env zsh

zmodload -i zsh/complist # needed to get menuselect keymap

bindkey '^[f' vi-forward-word
bindkey '^[b' vi-backward-word

bindkey -M menuselect '^j' expand-or-complete
bindkey -M menuselect '^k' reverse-menu-complete

# Do prefix based history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search # Up
bindkey "^N" down-line-or-beginning-search # Down

# Mask annoying escape codes
# https://codeberg.org/dnkl/foot/issues/628#issuecomment-240679
bindkey "\e[27;2;13~" accept-line  # shift+return
bindkey "\e[27;5;13~" accept-line  # ctrl+return
