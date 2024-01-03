#!/usr/bin/env bash
set -euo pipefail

systemctl --user daemon-reload
systemctl --user enable tpm-fido.service

sudo usermod -aG tss dean
sudo udevadm control --reload
