#!/usr/bin/env zsh

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Zsh completion
dean::zshcomp crane completion zsh
dean::zshcomp doom make completions --zsh
dean::zshcomp helm completion zsh
dean::zshcomp kind completion zsh
dean::zshcomp kubectl completion zsh

# Bash completion
dean::bashcomp aws aws_completer
dean::bashcomp consul
dean::bashcomp terraform
