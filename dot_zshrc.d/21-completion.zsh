#!/usr/bin/env zsh

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Zsh completion for typical go binaries
-gocomp eksctl
-gocomp helm
-gocomp kubectl
-gocomp tkn

# Bash completion
-bashcomp aws aws_completer
-bashcomp consul
-bashcomp kustomize
-bashcomp mc
-bashcomp terraform
-bashcomp vault
