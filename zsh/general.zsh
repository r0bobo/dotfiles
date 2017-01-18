# General zsh settings

export EDITOR='nvim'
export DEFAULT_USER=`whoami`
export USER=`whoami`
export HISTFILE=~/.zsh_history
export HISTSIZE=100
export SAVEHIST=100

autoload -Uz compinit promptinit run-help
compinit
promptinit

setopt correct
setopt correctall
setopt AUTO_CD
setopt append_history share_history histignorealldups

zstyle ':completion:*' menu select
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}

ZLE_RPROMPT_INDENT=0
