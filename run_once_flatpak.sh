#!/bin/bash -eu

flatpaks=(
    com.bitwarden.desktop
    com.github.tchx84.Flatseal
    com.slack.Slack
    com.spotify.Client
    org.gtk.Gtk3theme.Adapta-Eta
    org.nextcloud.Nextcloud
    org.telegram.desktop
)

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub "${flatpaks[@]}"
