#!/usr/bin/env zsh

export EDITOR=editor
export LIBVIRT_DEFAULT_URI=qemu+ssh://hypervisor/system
export VAULT_ADDR=https://vault.service.todevski:8200

typeset -U path # Avoid duplicate entries in PATH
path+=$HOME/.local/bin
path+=$HOME/.cargo/bin
path+=$HOME/.npm/bin
path+=$HOME/go/bin
path+=$HOME/.emacs.d/bin
path+=$HOME/.cargo/bin
path+=${KREW_ROOT:-$HOME/.krew}/bin

ZSH_COMPDIR="$HOME/.local/share/zsh/completions"
ZSH_CACHEDIR="$HOME/.local/share/zsh/cache"
mkdir -p "$ZSH_CACHEDIR" "$ZSH_COMPDIR"

fpath+="$ZSH_COMPDIR"
fpath+=/usr/share/zsh/vendor-completions

# Setup gpg ssh agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export DOOMDIR="$HOME/.local/share/chezmoi/doom"
export MANPAGER='bat -lman -p'

export GPG_TTY=$(tty)
