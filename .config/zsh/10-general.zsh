#!/usr/bin/env zsh

zstyle ':completion:*' add-space true
zstyle ':completion:*' completer _list _expand _expand_alias _complete _ignored _match _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle ':completion:*' list-colors ''

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_CACHEDIR/zcompcache"

HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt append_history share_history histignorealldups histignorespace

setopt extendedglob notify
setopt autocd
unsetopt beep


DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

autoload run-help

setopt interactivecomments

bindkey -e # emacs key bindings

WORDCHARS="$WORDCHARS:s:/:" # Each element in path is treated as a word
WORDCHARS="$WORDCHARS:s:=:" # Split word on =
WORDCHARS="$WORDCHARS|" # Pipe is treated as word
