#!/usr/bin/env zsh

CACHEDIR="$HOME/.local/share/zsh/cache"
mkdir -p "$CACHEDIR"

_cached_output() {
    NOW="$(date +%s)"

    srcfile="$1"
    srctime="$(zstat +mtime "$srcfile")"
    cachefile="$CACHEDIR/$srcfile:t-$srctime"

    # Generate completion if it doesn't exist
    if [[ ! -r "$cachefile" ]]; then
        "${@:2}" > "$cachefile"
    fi

    cat "$cachefile"
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
