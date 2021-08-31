#!/usr/bin/env zsh

# Dracula Theme (for zsh-syntax-highlighting)
#
# https://github.com/zenorocha/dracula-theme
#
# Copyright 2021, All rights reserved
#
# Code licensed under the MIT license
# http://zenorocha.mit-license.org
#
# @author George Pickering <@bigpick>
# @author Zeno Rocha <hi@zenorocha.com>
# Paste this files contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
typeset -gA ZSH_HIGHLIGHT_STYLES
# Default groupings per, https://spec.draculatheme.com, try to logically separate
# possible ZSH_HIGHLIGHT_STYLES settings accordingly...?
#
# Italics not yet supported by zsh; potentially soon:
#    https://github.com/zsh-users/zsh-syntax-highlighting/issues/432
#    https://www.zsh.org/mla/workers/2021/msg00678.html
# ... in hopes that they will, labelling accordingly with ,italic where appropriate
#
# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=white'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[function]='fg=green'
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#FFB86C,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#FFB86C'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#FFB86C'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=blue'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=cyan'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=magenta'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=yellow'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#F8F8F2'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[path]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[default]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[cursor]='standout'
