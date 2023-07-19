#!/usr/bin/env zsh

alias k=kubectl
alias tf=terraform

alias bat='bat --plain'

alias ls="exa --git"
alias la="ls -la"
alias ll="ls -l"

# Colors
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -c'

alias ssh='TERM=xterm-256color ssh'
alias ssh-fix='chmod 600 ~/.ssh/{*/*.key,config}'

alias virsh-local='virsh -c qemu:///system'
alias zshreload='exec zsh'

alias cin='xclip -in -selection clipboard'
alias cout='xclip -out -selection clipboard'


alias nixup='nix-channel --update && nix-env -iA nixpkgs.myPackages && nix-env --upgrade'

alias ssh-until='ssh -o ConnectTimeout=10 -o ConnectionAttempts=360'

alias zsh-benchmark="hyperfine -L userconfig true,false 'ZSH_NO_USER_CONFIG={userconfig} zsh -i -c exit'"
