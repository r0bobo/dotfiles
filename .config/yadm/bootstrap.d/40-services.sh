#!/usr/bin/env bash
set -euo pipefail

# Setup gpg
ln -sf /usr/share/doc/gnupg2/examples/systemd-user/*.{service,socket} \
   "$HOME/.config/systemd/user/"

systemctl --user daemon-reload

systemctl --user enable --now emacs.service

systemctl --user enable --now nix-collect-garbage.timer
systemctl --user enable --now systemd-tmpfiles-clean.timer
systemctl --user enable --now tmp-cleanup.timer

systemctl --user enable --now dirmngr.socket
systemctl --user enable --now gpg-agent-browser.socket
systemctl --user enable --now gpg-agent-extra.socket
systemctl --user enable --now gpg-agent.socket
systemctl --user enable --now gpg-agent-ssh.socket


[[ "$YADM_GRAPHICAL" != true ]] && exit 0
sudo systemctl disable --now packagekit.service
sudo systemctl disable --now packagekit-offline-update.service
sudo systemctl mask packagekit.service
sudo systemctl mask packgekit-offline-update.service
