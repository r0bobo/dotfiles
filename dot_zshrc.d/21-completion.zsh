#!/bin/zsh

fpath+=/usr/share/zsh/vendor-completions

zmodload zsh/stat

COMPDIR="$HOME/.local/share/zsh/completions"


_bashcomp() {
    cmd=$1
    cmp=$2
    cmp="${cmp:-"$cmd"}"  # Set to $cmd if undefined

    if command -v $cmd &>/dev/null; then
        complete -o nospace -C $cmp $cmd
    fi
}

_gocomp() {
    cmd=$1

    # Return if command doesn't exist
    command -v "$cmd" >/dev/null || return 0

    _cached_output "$(which "$cmd")" "$cmd" completion zsh \
        > "$COMPDIR/_$cmd"
}


mkdir -p "$COMPDIR"
fpath+="$COMPDIR"

autoload -Uz compinit
autoload -U +X bashcompinit


# Zsh completion for typical go binaries
_gocomp eksctl
_gocomp helm
_gocomp kubectl
_gocomp tkn

compinit
bashcompinit

# Bash completion
_bashcomp aws aws_completer
_bashcomp consul
_bashcomp kustomize
_bashcomp mc
_bashcomp terraform
_bashcomp vault
