#!/usr/bin/env zsh

zmodload zsh/stat

dean::cached_output () {
    NOW="$(date +%s)"

    srcfile="$1"
    srctime="$(zstat +mtime "$srcfile")"
    cachefile="$ZSH_CACHEDIR/$srcfile:t-$srctime"

    # Generate completion if it doesn't exist
    if [[ ! -r "$cachefile" ]]; then
        "${@:2}" > "$cachefile"
    fi

    cat "$cachefile"
}

dean::grc_except() {
    while read -r conf; do
        cmd="$conf:t:e"
        printf '%s\n' "$@" | grep -q "^$cmd\$" && continue
        [[ -z "$cmd" ]] && continue
        echo "function ${cmd}() { grc -es --colour=auto $cmd }"
    done < <(find $(readlink -f ~/.nix-profile/share/grc))
}

dean::bashcomp() {
    cmd=$1
    cmp="${2:-"$cmd"}"  # Set to $cmd if undefined

    if command -v $cmd &>/dev/null; then
        complete -o nospace -C $cmp $cmd
    fi
}

dean::gocomp() {
    cmd=$1

    # Return if command doesn't exist
    command -v "$cmd" >/dev/null || return 0

    dean::cached_output "$(which "$cmd")" "$cmd" completion zsh \
        > "$ZSH_COMPDIR/_$cmd"
}

dean::plugin() {
    if [[ -r $1 ]]; then
        source $1
    fi
}

ssl-check() {
    docker run --rm -ti drwetter/testssl.sh:3.1dev "$@"
}

autoload -Uz j
autoload -Uz man
autoload -Uz zsh-benchmark
autoload -Uz zsh-profile
