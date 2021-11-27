#!/usr/bin/env zsh

dean::plugin /usr/share/fzf/shell/key-bindings.zsh
dean::plugin /usr/share/zsh/site-functions/fzf

dean::plugin "$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
dean::plugin "$HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

eval "$(direnv hook zsh)"
eval "$(starship init zsh --print-full-init)"

source <(dean::cached_output $(whence -p grc) dean::grc_except "make")
