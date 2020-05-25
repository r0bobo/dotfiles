#!/bin/zsh

zmodload zsh/stat

NOW="$(date +%j)"
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

    cmpdir="$COMPDIR/_$cmd"

    if [[ ! -r "$cmpdir" ]] || [[ "$NOW" != $(zstat -F '%j' +mtime -- "$cmpdir") ]]; then
        "$cmd" completion zsh > "$COMPDIR/_$cmd"
    fi
}


mkdir -p "$COMPDIR"
fpath+="$COMPDIR"

autoload -Uz compinit
autoload -U +X bashcompinit


# Zsh completion for typical go binaries
_gocomp kubectl
_gocomp tkn

compinit
bashcompinit

# Bash completion
_bashcomp aws aws_completer
_bashcomp consul
_bashcomp terraform
_bashcomp vault
