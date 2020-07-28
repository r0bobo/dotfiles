#!/bin/zsh

_plugin() {
    if [[ -r $1 ]]; then
        source $1
    fi
}

_plugin /etc/profile.d/grc.bashrc
_plugin /usr/share/fzf/shell/key-bindings.zsh
_plugin /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
_plugin /usr/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

eval "$(direnv hook zsh)"
eval "$(starship init zsh --print-full-init)"
