#!/bin/bash

source install_from_github.sh

set -e

# Setup paths
DOWNLOAD_DIR=~/Downloads
DOWNLOAD_URL='https://api.github.com/repos/sharkdp/fd/releases/latest'
DEST_DIR_NAME=fd

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
                        x86_64-unknown-linux-gnu


    echo "Installing"
    install -Dm 755 "fd" "$PKGDIR/bin/fd"
    install -Dm 644 "fd.1" "$PKGDIR/share/man/man1/fd.1"
    install -Dm 644 "autocomplete/_fd" "$ZSH_COMP_DIR/_fd"

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
    rm -v "$PKGDIR/bin/fd"
    rm -v "$PKGDIR/share/man/man1/fd.1"
    rm -v "$ZSH_COMP_DIR/_fd"

    echo "Finished"
}

install_pkg $DOWNLOAD_DIR
# remove_pkg
