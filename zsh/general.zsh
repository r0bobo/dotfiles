# General zsh settings

export EDITOR='nvim'
export DEFAULT_USER=`whoami`
export USER=`whoami`


# History
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

setopt append_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history


# Completion
setopt always_to_end
setopt auto_menu
setopt complete_in_word

zstyle ':completion:*' menu select
zstyle ':completion:*:default'  list-colors ${(s.:.)LS_COLORS}
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'


autoload -Uz compinit promptinit run-help
compinit
promptinit


setopt correct
setopt correctall
setopt auto_cd
setopt auto_pushd


# Fix right prompt offset
ZLE_RPROMPT_INDENT=0
