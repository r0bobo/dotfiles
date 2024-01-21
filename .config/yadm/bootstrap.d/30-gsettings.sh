#!/usr/bin/env bash
set -euo pipefail

[[ "$YADM_GRAPHICAL" != true ]] && exit 0

echo >&2 Configuring Gnome settings

keybind() {
    gpath="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/$1/"
    gsettings set "$gpath" name "$2"
    gsettings set "$gpath" command "$3"
    gsettings set "$gpath" binding "$4"
}

# Generic
gsettings set org.gnome.desktop.interface enable-hot-corners "false"
gsettings set org.gnome.desktop.interface show-battery-percentage "true"

# Workspace
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.mutter dynamic-workspaces true
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9
for i in {1..9}; do
    gsettings set "org.gnome.shell.keybindings" "switch-to-application-$i" "[]"
    gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>${i}']"
    gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Super><Shift>${i}']"
    gsettings set "org.gnome.shell.keybindings" "switch-to-application-$i" "[]"
done

# Keybinds
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/'
]"
keybind custom0 'Emacs' 'emacsclient -nc' '<Super>e'
keybind custom1 'Terminal' 'foot' '<Super>Return'
keybind custom2 'Org-capture' "$HOME/.local/bin/org-capture" '<Super>c'

# Gnome Software
gsettings set org.gnome.software download-updates false

# Calendar
gsettings set org.gnome.desktop.calendar show-weekdate "true"

# GDM
sudo -u gdm dbus-run-session gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
