#!/usr/bin/env bash
set -euo pipefail

npminstall() {
    npm install --global "$@"
}

npminstall prettier@3.1.1
npminstall stylelint@16.0.2
npminstall vscode-langservers-extracted@4.8.0
