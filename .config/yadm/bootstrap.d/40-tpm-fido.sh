#!/usr/bin/env bash
set -euo pipefail

cat <<EOF | sudo tee /etc/udev/rules.d/50-tpm-fido.rules
KERNEL=="uhid", SUBSYSTEM=="misc", GROUP="tss", MODE="0660"
EOF

cat <<EOF | sudo tee /etc/modules-load.d/uhid.conf
uhid
EOF

cat <<EOF > "$HOME/.config/systemd/user/tpm-fido.service"
[Unit]
Description=TPM FIDO

[Service]
Type=simple
ExecStart=%h/go/bin/tpm-fido
Restart=on-failure
Slice=session.slice
Environment=DISPLAY=:0.0

[Install]
WantedBy=basic.target
EOF

systemctl --user daemon-reload
systemctl --user enable tpm-fido.service

sudo usermod -aG tss dean
sudo udevadm control --reload
