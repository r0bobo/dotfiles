#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob

EMACS_DIR="$HOME/.config/emacs"
DOWNLOAD_DIR="$EMACS_DIR/.local/tree-sitter-download"
INSTALL_DIR="$EMACS_DIR/.local/etc/tree-sitter"

VERSION=0.12.303
DOWNLOAD_FILE="$DOWNLOAD_DIR/$VERSION.tar.gz"

mkdir -p "$DOWNLOAD_DIR"
mkdir -p "$INSTALL_DIR"

URL="https://github.com/emacs-tree-sitter/tree-sitter-langs/releases/download/$VERSION/tree-sitter-grammars-linux-$VERSION.tar.gz"

if [[ ! -f "$DOWNLOAD_FILE" ]]; then
	curl -sSfL -o "$DOWNLOAD_FILE" "$URL"
fi

tmp="$(mktemp -d)"

tar -C "$tmp" -xzf "$DOWNLOAD_FILE"

for f in "$tmp/"*.so; do
	name="${f##*/}"
	mv "$f" "$tmp/libtree-sitter-$name"
done

rm -f -- "$INSTALL_DIR/"*.so
mv "$tmp"/*.so "$INSTALL_DIR"
