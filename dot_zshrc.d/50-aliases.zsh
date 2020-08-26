#!/bin/zsh

alias d=docker
alias e=editor

alias kubectl='EDITOR=vim kubectl'
alias k='kubectl'

# Emacs commands
alias emacs-log='journalctl --user-unit=emacs.service --follow'
alias emacs-restart='systemctl --user restart emacs.service'
alias emacs-status='systemctl --user status emacs.service'

alias ls=exa
alias la="exa -la"
alias ll="exa -l"

alias less="less -FSRX"

# Colors
alias diff='diff --color=auto'
alias grep='grep --color=auto'

alias ssh='TERM=xterm-256color ssh'
alias ssh-fix='chmod 600 ~/.ssh/{*/*.key,config}'

alias virsh-local='virsh -c qemu:///system'
alias zshreload='exec zsh'

alias cin='xclip -in -selection clipboard'
alias cout='xclip -out -selection clipboard'

alias dh='dirs -v'

ssh_until_connection() { until ssh "$1"; do sleep 3; done; }
