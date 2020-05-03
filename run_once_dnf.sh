#!/bin/bash -eu

packages=(
    emacs
    ripgrep

    # test
    godoctor
    golang-x-tools-gopls
    golang-x-tools-gorename
    golang-x-tools-guru

)

sudo dnf install -y "${packages[@]}"
