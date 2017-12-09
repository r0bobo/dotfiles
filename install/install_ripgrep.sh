#!/bin/bash

source install_from_github.sh

set -e

# Setup paths
DOWNLOAD_DIR=~/Downloads
DOWNLOAD_URL='https://api.github.com/repos/BurntSushi/ripgrep/releases/latest'
DEST_DIR_NAME=ripgrep

PKGDIR=~/.local
ZSH_COMP_DIR=~/.zsh/completion


################################
# Arguments:
#   DOWNLOAD_DIR
################################
function install_pkg() {
    echo "Unpacking archive"

    download_gh_release $DOWNLOAD_URL \
                        $DOWNLOAD_DIR \
                        $DEST_DIR_NAME \
                        x86_64-unknown-linux

    echo "Installing"
    install -d -m 755 "$PKGDIR/bin/"
    install -d "$PKGDIR/share/man/man1/"
    install -d -m 755 "$ZSH_COMP_DIR/"

    install -m 755 "rg" "$PKGDIR/bin/rg"
    install -m 644 "rg.1" "$PKGDIR/share/man/man1/rg.1"
    install -m 644 "complete/_rg" "$ZSH_COMP_DIR/_rg"

    echo "Cleaning up"
    rm -rf "${DOWNLOAD_DIR:?}/$DEST_DIR_NAME" \
       "$DOWNLOAD_DIR/$DEST_DIR_NAME.tar.gz"

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

install_pkg $DOWNLOAD_DIR
# remove_pkg
