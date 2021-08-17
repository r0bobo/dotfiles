#!/usr/bin/env zsh

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

export EDITOR=vim

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

[[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]] && source "$HOME/.nix-profile/etc/profile.d/nix.sh"
