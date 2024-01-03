#!/usr/bin/env bash
set -euo pipefail

npminstall() {
    npm install --no-fund --global "$@"
}

npminstall prettier@3.1.1
npminstall stylelint@16.1.0
npminstall vscode-langservers-extracted@4.8.0
