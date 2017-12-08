#!/bin/bash

set -e

# Setup paths
DOWNLOAD_DIR=~/Downloads
DOWNLOAD_URL='https://api.github.com/repos/BurntSushi/ripgrep/releases/latest'

PKGDIR=~/.local
ZSH_COMP_DIR=~/.zsh/completion


################################
# Arguments:
#   DOWNLOAD_URL
#   DOWNLOAD_DIR
################################
function download_gh_release() {
    echo "Downloading package"

    curl -s "$1" \
        | grep browser_download_url \
        | grep x86_64-unknown-linux \
        | cut -d '"' -f 4 \
        | xargs curl -#Lo "$2/ripgrep.tar.gz"
}


################################
# Arguments:
#   DOWNLOAD_DIR
################################
function install_pkg() {
    echo "Unpacking archive"

    mkdir -p "$1/ripgrep"
    cd "$1/ripgrep"
    tar -xf "$1/ripgrep.tar.gz" \
        --strip=1
        # -C "$1/ripgrep"

    echo "Installing"
    install -d -m 755 "$PKGDIR/bin/"
    install -d "$PKGDIR/share/man/man1/"
    install -d -m 755 "$ZSH_COMP_DIR/"

    install -m 755 "rg" "$PKGDIR/bin/rg"
    install -m 644 "rg.1" "$PKGDIR/share/man/man1/rg.1"
    install -m 644 "complete/_rg" "$ZSH_COMP_DIR/_rg"

    echo "Cleaning up"
    # cd ..
    rm -rf "$1/ripgrep" "$1/ripgrep.tar.gz"

    echo "Finished"
}


################################
# Arguments:
#   DOWNLOAD_DIR
################################
function remove_pkg() {
    rm -v "$PKGDIR/bin/rg"
    rm -v "$PKGDIR/share/man/man1/rg.1"
    rm -v "$ZSH_COMP_DIR/_rg"

    echo "Finished"
}


download_gh_release $DOWNLOAD_URL $DOWNLOAD_DIR
install_pkg $DOWNLOAD_DIR
