#!/usr/bin/env bash
set -euo pipefail

[[ "$YADM_GRAPHICAL" != true ]] && exit 0

flatpaks=(
    com.bitwarden.desktop
    com.github.tchx84.Flatseal
    com.slack.Slack
    com.spotify.Client
    org.gtk.Gtk3theme.Adapta-Eta
    org.telegram.desktop
)

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub "${flatpaks[@]}"
