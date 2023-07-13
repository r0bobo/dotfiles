#!/usr/bin/env bash
set -euo pipefail

packages=(
	bat
	direnv
	emacs
	exa
	fd-find
	fzf
	go
	gopass
	hyperfine
	kubectl
	pass
	rclone
	ripgrep
	tmpwatch
	tmux
	vim
	xclip
	z
	zsh
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# Graphical packages
if [[ "$YADM_GRAPHICAL" = true ]]; then
	packages+=(
		alacritty
		flatpak
		gnome-shell-extension-pop-shell
		jetbrains-mono-fonts-all

		# https://rpmfusion.org/Howto/Multimedia
		intel-media-driver
		nvidia-vaapi-driver
	)
fi

tmpfile="$(mktemp)"

cat <<EOF > "$tmpfile"
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
if ! diff "$tmpfile" /etc/yum.repos.d/kubernetes.repo &>/dev/null; then
	sudo mv "$tmpfile" /etc/yum.repos.d/kubernetes.repo
fi

# RPM Fusion
sudo dnf install -y \
	"https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
	"https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

sudo dnf install -y "${packages[@]}"

# https://rpmfusion.org/Howto/Multimedia
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate -y sound-and-video
