# Disable zsh features when using "dumb" terminal to avoid issues with Emacs Tramp
if [[ "$TERM" == "dumb" ]]; then
    unsetopt zle
    PS1='$ '
    return
else
    for file in $XDG_CONFIG_HOME/zsh/*.zsh; do
        source "$file"
    done
fi
