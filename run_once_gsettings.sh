#!/bin/bash -eu

>&2 echo Configuring Gnome settings


gset() {
    gsettings set "$@"
}

keybind() {
    path="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/$1/"
    gset "$path" name "$2"
    gset "$path" command "$3"
    gset "$path" binding "$4"
}


# Generic
gset org.gnome.desktop.interface gtk-theme "Adapta-Eta"
gset org.gnome.desktop.interface enable-hot-corners "false"


# Workspace
gset org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>exclam']"
gset org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>quotedbl']"
gset org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>numbersign']"
gset org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>currency']"
gset org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gset org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gset org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gset org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"


# Keybinds
gset org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/'
]"
keybind custom0 'Emacs' 'emacsclient -nc' '<Super>e'
keybind custom1 'Terminal' 'alacritty-xway' '<Super>Return'
