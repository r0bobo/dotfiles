#!/usr/bin/env bash
set -euo pipefail

[[ "$YADM_GRAPHICAL" != true ]] && exit 0

FIREFOX_DIR="$HOME/.mozilla/firefox"
PROFILE_FILE="$FIREFOX_DIR/profiles.ini"

default_profile="$(awk -F= '/^\[Install/,/.\*/ { n=NR }; NR>=$n && /Default=/{ print $2; exit }' "$PROFILE_FILE")"

ln -sf "$HOME/.config/firefox-users.js" "$FIREFOX_DIR/$default_profile/user.js"
echo "Linked $FIREFOX_DIR/$default_profile/user.js"
