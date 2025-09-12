#!/usr/bin/env bash
set -euo pipefail

root_files_path="$BOOTSTRAP_DIR/root-files"

shopt -s globstar

for src in "$root_files_path"/**; do
	[[ -d "$src" ]] && continue
	dest="/$(realpath --relative-to="$root_files_path" "$src")"

	sudo install -CDvm0644 "$src" "$dest"
done
