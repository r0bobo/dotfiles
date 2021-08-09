#!/usr/bin/env zsh

zmodload -i zsh/complist # needed to get menuselect keymap

bindkey -e # emacs key bindings

bindkey -M menuselect '^j' expand-or-complete
bindkey -M menuselect '^k' reverse-menu-complete

# Do prefix based history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search # Up
bindkey "^N" down-line-or-beginning-search # Down
