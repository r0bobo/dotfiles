# Disable zsh features when using "dumb" terminal to avoid issues with Emacs Tramp
if [[ "$TERM" == "dumb" ]]; then
    unsetopt zle
    PS1='$ '
    return
else
    source <(sed -E 's/^([^#\s].+)$/export \1/g' "$HOME/.config/environment.d/40-user.conf")

    for file in $XDG_CONFIG_HOME/zsh/*.zsh; do
        source "$file"
    done
fi

if [ -e /home/dean/.nix-profile/etc/profile.d/nix.sh ]; then . /home/dean/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
