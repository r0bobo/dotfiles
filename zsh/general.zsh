# General zsh settings

export EDITOR='nvim'
export DEFAULT_USER=`whoami`
export USER=`whoami`

zstyle ':completion:*' menu select
setopt AUTO_CD

autoload -Uz compinit promptinit
compinit
promptinit

setopt correct
setopt correctall
