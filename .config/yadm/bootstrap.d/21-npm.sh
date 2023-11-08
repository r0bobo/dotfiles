#!/usr/bin/env bash
set -euo pipefail

npminstall() {
    npm install --global $*
}

npminstall prettier@3.0.3
npminstall stylelint@15.11.0
