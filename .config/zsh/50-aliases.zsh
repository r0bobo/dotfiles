#!/usr/bin/env zsh

# alias k=kubectl
alias kubectl=kubecolor
alias k=kubecolor
compdef kubecolor=kubectl

alias ls="eza --no-git"
alias la="ls -la"
alias ll="ls -l"

# Colors
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

alias ssh='TERM=xterm-256color ssh'
alias ssh-fix='chmod 600 ~/.ssh/{*/*.key,config}'

alias virsh-local='virsh -c qemu:///system'
alias zshreload='exec zsh'

alias cin='xclip -in -selection clipboard'
alias cout='xclip -out -selection clipboard'

alias ssh-until='ssh -o ConnectTimeout=10 -o ConnectionAttempts=360 -v'

# https://news.ycombinator.com/item?id=44203451
alias zsh-benchmark="hyperfine -L userconfig true,false 'ZSH_NO_USER_CONFIG={userconfig} zsh -i -c logout'"

alias wake-desktop="wol -v 30:9c:23:df:43:4f"

alias bazelisk='noglob bazelisk'
alias bazel='noglob bazelisk'
alias bzl='noglob bazelisk'
alias ibzl='noglob ibazel'

alias runidle='systemd-run --user --scope -p CPUWeight=idle'
