#!/usr/bin/env zsh

# ZSH
ZSH_COMPDIR="$XDG_DATA_HOME/zsh/completions"
ZSH_CACHEDIR="$XDG_CACHE_HOME/zsh"
mkdir -p "$ZSH_CACHEDIR" "$ZSH_COMPDIR"

fpath+="$ZSH_COMPDIR"
fpath+=/usr/share/zsh/vendor-completions
fpath+="$HOME/.nix-profile/share/zsh/site-functions"
fpath+="$XDG_CONFIG_HOME/zsh/completion"
fpath+="$XDG_CONFIG_HOME/zsh/functions"

# Apps
export LIBVIRT_DEFAULT_URI=qemu+ssh://hypervisor/system
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config
export KUBE_EDITOR=vim

# Less config
export PAGER=less
lessflags=(
	--ignore-case
	--chop-long-lines
	--RAW-CONTROL-CHARS # show colors
	--no-init
	--tabs=4
)
export LESS="${lessflags[*]}"
unset lessflags

[[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]] && source "$HOME/.nix-profile/etc/profile.d/nix.sh"
