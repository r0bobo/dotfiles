#!/usr/bin/env zsh

dean::plugin /usr/share/fzf/shell/key-bindings.zsh
dean::plugin /usr/share/zsh/site-functions/fzf

eval "$(direnv hook zsh)"
eval "$(starship init zsh --print-full-init)"
eval "$(atuin init zsh)"

dean::plugin /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
dean::plugin /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
