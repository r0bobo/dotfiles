#!/bin/zsh

zmodload -i zsh/complist # needed to get menuselect keymap

bindkey -e # emacs key bindings

bindkey -M menuselect '^j' expand-or-complete
bindkey -M menuselect '^k' reverse-menu-complete
