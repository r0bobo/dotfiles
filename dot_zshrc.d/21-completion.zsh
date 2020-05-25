#!/bin/zsh


autoload -Uz compinit
compinit

autoload -U +X bashcompinit
bashcompinit

_bashcomp() {
    cmd=$1
    cmp=$2
    cmp=${cmp:-$cmd}  # Set to $cmd if undefined

    if command -v $cmd &>/dev/null; then
        complete -o nospace -C $cmp $cmd
    fi
}


_gocomp() {
    cmd=$1
    if command -v $cmd &>/dev/null; then
        source <($cmd completion zsh)
    fi
}


# Bash completion
_bashcomp aws aws_completer
_bashcomp consul
_bashcomp terraform
_bashcomp vault


# Zsh completion for typical go binaries
_gocomp kubectl
_gocomp tkn
