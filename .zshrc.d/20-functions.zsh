#!/usr/bin/env zsh

zmodload zsh/stat

-cached_output() {
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

-mangle_colourify_except() {
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

-bashcomp() {
    cmd=$1
    cmp="${2:-"$cmd"}"  # Set to $cmd if undefined

    if command -v $cmd &>/dev/null; then
        complete -o nospace -C $cmp $cmd
    fi
}

-gocomp() {
    cmd=$1

    # Return if command doesn't exist
    command -v "$cmd" >/dev/null || return 0

    -cached_output "$(which "$cmd")" "$cmd" completion zsh \
        > "$ZSH_COMPDIR/_$cmd"
}

-plugin() {
    if [[ -r $1 ]]; then
        source $1
    fi
}

zsh-benchmark() (
    TIMEFMT=$'%E'
    ZSH="$(which zsh)"
    for i in $(seq 1 10); do
        echo "Loop $i"
        printf '  system            '
        usertime="$(export ZSH_NO_USER_CONFIG=true; time "$ZSH" -i -c exit)"
        printf '  with user config  '
        baretime="$(time "$ZSH" -i -c exit)"
        echo
    done
)

zsh-profile() {
    (
        export ZSH_PROFILE_ENABLED=true
        zsh -i -c zprof
    ) | less
}

fix-zoom() {
    sudo cp /etc/os-release $(flatpak info -l org.freedesktop.Platform)/files/lib/.
    sudo flatpak override --socket=session-bus us.zoom.Zoom
}

ssl-check() {
    docker run --rm -ti drwetter/testssl.sh:3.1dev "$@"
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert always

j() {
    if ! result="$(cdr -l | fzf --with-nth 2 | awk '{print $1}')"; then
        cdr "$result"
    fi
}
