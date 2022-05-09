#!/usr/bin/env zsh

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Zsh completion for typical go binaries
dean::gocomp helm
dean::gocomp kubectl
dean::gocomp linkding-cli

# Bash completion
dean::bashcomp aws aws_completer
dean::bashcomp consul
dean::bashcomp kustomize
dean::bashcomp terraform
