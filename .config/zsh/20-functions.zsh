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

dean::mangle_colourify_except() {
    grc_profile="$1"
    excludes=(${@:2})

    printf 'GRC="$(which grc)"\n'
    printf 'if [ "$TERM" != dumb ] && [ -n "$GRC" ]; then\n'

    while IFS= read -r alias; do
        funcname="$(cut -d= -f1 <<<"$alias")"

        cmd_raw="$(cut -d= -f2- <<<"$alias")"

        # Remove surrounding quotes
        temp="${cmd_raw%\"}"
        temp="${temp#\"}"
        temp="${temp%\'}"
        command="${temp#\'}"

        for exclude in "${excludes[@]}"; do
            if [[ "$funcname" != "$exclude" ]]; then
                printf '\n'
                printf '  unalias "%s" &>/dev/null || true\n' "$funcname"
                printf '  function %s { %s "$@"; }\n' "$funcname" "$command"
            fi
        done
    done < <(grep -E '^\s*[^#]\s*alias' <"$grc_profile" | sed -E 's|^\s*alias\s*(.+)+|\1|g')
    printf 'fi\n'
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

fpath+="$XDG_CONFIG_HOME/zsh/functions"
autoload -Uz j
autoload -Uz man
autoload -Uz zsh-benchmark
autoload -Uz zsh-profile
