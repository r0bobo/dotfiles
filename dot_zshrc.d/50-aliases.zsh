#!/bin/zsh

alias e=editor
alias k=kubectl

alias estat="journalctl --user-unit=emacs.service --follow"

alias ls=exa
alias la="exa -la"
alias ll="exa -l"

alias less="less -FSRX"

alias ssh-fix="chmod 600 ~/.ssh/{*/*.key,config}"
alias virsh-local="virsh -c qemu:///system"
alias zshreload="source $HOME/.zshrc"

alias cin='xclip -in -selection clipboard'
alias cout='xclip -out -selection clipboard'

alias dh='dirs -v'


proj() {
    PROJ="$(fd --max-depth=2 --base-directory="$PROJECT_DIR" --type=directory \
               | fzf --preview="ls $PROJECT_DIR/{}")"
    cd "$PROJECT_DIR/$PROJ"
}
