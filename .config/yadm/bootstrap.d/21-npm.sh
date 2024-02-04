#!/usr/bin/env bash
set -euo pipefail

npminstall() {
    npm install --no-fund --global "$@"
}

npminstall prettier@3.2.5
npminstall stylelint@16.2.1
npminstall vscode-langservers-extracted@4.8.0
