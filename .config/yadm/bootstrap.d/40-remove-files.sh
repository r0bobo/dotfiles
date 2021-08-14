#!/usr/bin/env bash
set -euo pipefail

to_remove=(
    "$HOME/.zshenv"
    "$HOME/.zshrc.d"
)

xargs rm -rfv <<<"${to_remove[@]}"
