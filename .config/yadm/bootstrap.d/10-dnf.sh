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
	z
	zsh
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# Graphical packages
if [[ "$YADM_GRAPHICAL" = true ]]; then
	packages+=(
		alacritty
		flatpak
		foot
		gnome-shell-extension-pop-shell
		jetbrains-mono-fonts-all

		# https://rpmfusion.org/Howto/Multimedia
		intel-media-driver
	)
fi

tmpfile="$(mktemp)"

kubernetes_version=1.28

cat <<EOF > "$tmpfile"
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v${kubernetes_version}/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v${kubernetes_version}/rpm/repodata/repomd.xml.key
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
