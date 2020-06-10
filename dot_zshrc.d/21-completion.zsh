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

    # Return if command doesn't exist
    command -v "$cmd" >/dev/null || return 0

    # Generate completion if it doesn't exist
    if [[ ! -r "$cmpdir" ]]; then
        "$cmd" completion zsh > "$COMPDIR/_$cmd"
        return 0
    fi

    # Regenerate completion if binary
    # is newer than completion file
    cmdtime="$(zstat +mtime "$(which "$cmd")")"
    cmptime="$(zstat +mtime "$cmpdir")"
    if [[ "$cmdtime" > "$cmptime" ]]; then
        "$cmd" completion zsh > "$COMPDIR/_$cmd"
    fi
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
_bashcomp terraform
_bashcomp vault
