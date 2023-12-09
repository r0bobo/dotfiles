#!/usr/bin/env bash
set -euo pipefail

npminstall() {
    npm install --global $*
}

npminstall prettier@3.1.0
npminstall stylelint@16.0.1
npminstall vscode-langservers-extracted@4.8.0
