#!/usr/bin/env zsh

export EDITOR=vim

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# ZSH
ZSH_COMPDIR="$XDG_DATA_HOME/zsh/completions"
ZSH_CACHEDIR="$XDG_CACHE_HOME/zsh/cache"
mkdir -p "$ZSH_CACHEDIR" "$ZSH_COMPDIR"

# Path
typeset -U path # Avoid duplicate entries in PATH
path+=$HOME/.local/bin
path+=$HOME/.cargo/bin
path+=$HOME/.npm/bin
path+=$HOME/go/bin
path+=$HOME/.emacs.d/bin
path+=$HOME/.cargo/bin
path+=${KREW_ROOT:-$HOME/.krew}/bin

fpath+="$ZSH_COMPDIR"
fpath+=/usr/share/zsh/vendor-completions
fpath+="$HOME/.nix-profile/share/zsh/site-functions"

# Apps
export LIBVIRT_DEFAULT_URI=qemu+ssh://hypervisor/system
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config

# Less config
export PAGER=less
lessflags=(
	--ignore-case
	--quit-if-one-screen
	--chop-long-lines
	--RAW-CONTROL-CHARS  # show colors
	--no-init
	--tabs=4
)
export LESS="${lessflags[*]}"
unset lessflags

# GPG export GPG_TTY=$(tty)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Firefox fix for mixed Wayland/Xorg
# https://mastransky.wordpress.com/2020/03/16/wayland-x11-how-to-run-firefox-in-mixed-environment/
export MOZ_DBUS_REMOTE=1

[[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]] && source "$HOME/.nix-profile/etc/profile.d/nix.sh"
