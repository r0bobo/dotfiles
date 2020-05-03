#!/bin/bash -eu

sudo dnf copr enable -y chmouel/tektoncd-cli
sudo dnf copr enable -y robobo/packages

packages=(
    emacs
    lab
    ripgrep
    starship

    # Golang dev
    godoctor
    golang-x-tools-gopls
    golang-x-tools-gorename
    golang-x-tools-guru

)

sudo dnf install -y "${packages[@]}"
