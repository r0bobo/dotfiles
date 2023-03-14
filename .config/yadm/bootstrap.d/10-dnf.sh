#!/usr/bin/env bash
set -euo pipefail

installed="$(rpm -qa)"

packages_installed() {
	for package in "$@"; do
		if ! grep -q "$package" <<<"$installed"; then
			return 1
		fi
	done
}

packages=(

	bat
	direnv
	emacs
	exa
	fd-find
	fzf
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

	# Golang dev
	godoctor
	golang-x-tools-gopls
	golang-x-tools-gorename
	golang-x-tools-guru

)

# Graphical packages
if [[ "$YADM_GRAPHICAL" = true ]]; then
	packages+=(

		alacritty
		flatpak
		gnome-shell-extension-pop-shell
		jetbrains-mono-fonts-all

		# Firefox VA-API
		# https://mastransky.wordpress.com/2020/06/03/firefox-on-fedora-finally-gets-va-api-on-wayland/
		ffmpeg
		libva
		libva-intel-driver
		libva-utils
		libva-vdpau-driver  # Nvidia

		# https://www.reddit.com/r/Fedora/comments/yq9p6d/mesafreeworld_available_on_rpmfusion/
		mesa-va-drivers-freeworld
		mesa-vdpau-drivers-freeworld

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
if ! packages_installed rpmfusion-free-release rpmfusion-nonfree-release; then
	sudo dnf install -y \
		"https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
		"https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
fi

if ! packages_installed "${packages[@]}"; then
	sudo dnf install -y "${packages[@]}"
fi
