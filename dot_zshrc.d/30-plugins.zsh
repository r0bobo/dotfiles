#!/usr/bin/env zsh

-plugin /usr/share/fzf/shell/key-bindings.zsh
-plugin /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
-plugin /usr/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

eval "$(direnv hook zsh)"
eval "$(starship init zsh --print-full-init)"
