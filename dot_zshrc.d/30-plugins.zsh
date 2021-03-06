#!/usr/bin/env zsh

-plugin /usr/share/fzf/shell/key-bindings.zsh
source "$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.nix-profile/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh"

eval "$(direnv hook zsh)"
eval "$(starship init zsh --print-full-init)"
