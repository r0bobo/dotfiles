#!/usr/bin/env zsh

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Zsh completion
dean::zshcomp doom make completions --zsh
dean::zshcomp tailscale completion zsh

# Bash completion
dean::bashcomp aws aws_completer
dean::bashcomp consul
dean::bashcomp terraform

compdef _bazel bazelisk
