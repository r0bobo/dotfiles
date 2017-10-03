#!/usr/bin/sh

set -e

# Setup paths
DOWNLOAD_DEST=~/Downloads/firefox-nightly.tar.bz2
DOWNLOAD_URL='https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US'
INSTALL_DEST=~/.local/share
BIN_DEST=~/.local/bin

# Create dirs
mkdir -p $BIN_DEST
mkdir -p $INSTALL_DEST

# Download firefox
curl -L -o $DOWNLOAD_DEST $DOWNLOAD_URL

# Extract and symlink
tar -xvf $DOWNLOAD_DEST -C $INSTALL_DEST
ln -s $INSTALL_DEST/firefox/firefox $BIN_DEST/firefox-nightly

# Cleanup
rm $DOWNLOAD_DEST
