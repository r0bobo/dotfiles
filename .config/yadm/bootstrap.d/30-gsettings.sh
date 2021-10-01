#!/usr/bin/env bash
set -euo pipefail

[[ "$YADM_GRAPHICAL" != true ]] && exit 0

echo >&2 Configuring Gnome settings

keybind() {
	path="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/$1/"
	gsettings set "$path" name "$2"
	gsettings set "$path" command "$3"
	gsettings set "$path" binding "$4"
}

# Generic
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Darker"
gsettings set org.gnome.desktop.interface enable-hot-corners "false"

# Workspace
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>exclam']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>quotedbl']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>numbersign']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>currency']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.shell.keybindings switch-to-application-1 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"

# Keybinds
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/'
]"
keybind custom0 'Emacs' 'emacsclient -nc' '<Super>e'
keybind custom1 'Terminal' 'sh -c "WAYLAND_DISPLAY= alacritty"' '<Super>Return'
keybind custom2 'Org-capture' "$HOME/.local/bin/org-capture" '<Super>c'

# Gnome Software
gsettings set org.gnome.software download-updates false

# GDM
sudo -u gdm dbus-run-session gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
