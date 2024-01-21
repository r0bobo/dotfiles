#!/usr/bin/env bash
set -euo pipefail

FEDORA_VERSION="$(rpm -E %fedora)"

packages=(
	bat
	direnv
	emacs
	eza
	fd-find
	fzf
	gh
	git-absorb
	go
	gopass
	htop
	hyperfine
	kubectl
	pass
	rclone
	ripgrep
	tmpwatch
	tmux
	vim
	xclip
	yadm
	z
	zsh
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# Graphical packages
if [[ "$YADM_GRAPHICAL" = true ]]; then
	packages+=(
		flatpak
		foot
		gnome-shell-extension-pop-shell
		jetbrains-mono-fonts-all

		# https://rpmfusion.org/Howto/Multimedia
		intel-media-driver
	)
fi

# RPM Fusion
sudo dnf install -y \
	"https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$FEDORA_VERSION.noarch.rpm" \
	"https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$FEDORA_VERSION.noarch.rpm"

sudo dnf config-manager --add-repo "https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/Fedora_$FEDORA_VERSION/home:TheLocehiliosan:yadm.repo"

sudo dnf install -y "${packages[@]}"

# https://rpmfusion.org/Howto/Multimedia
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate -y sound-and-video
