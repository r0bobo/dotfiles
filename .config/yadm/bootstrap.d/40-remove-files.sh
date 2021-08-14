#!/usr/bin/env bash
set -euo pipefail

to_remove=(
    "$HOME/.zshenv"
    "$HOME/.zshrc.d"
    "$HOME/.local/bin/fman"
    "$HOME/.local/bin/firefox-link-userjs"
)

xargs rm -rfv <<<"${to_remove[@]}"
