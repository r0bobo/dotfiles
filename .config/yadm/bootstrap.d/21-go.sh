#!/usr/bin/env bash
set -euo pipefail

goinstall() {
	echo Installing go package "$@" >&2
	go install "$@"
}

goinstall github.com/psanford/tpm-fido@5f8828b82b58f9badeed65718fca72bc31358c5c
