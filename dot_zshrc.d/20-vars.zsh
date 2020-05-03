export EDITOR=editor
export LIBVIRT_DEFAULT_URI=qemu+ssh://hypervisor/system
export VAULT_ADDR=https://vault.service.todevski:8200

typeset -U path  # Avoid duplicate entries in PATH
path+=$HOME/.local/bin
path+=$HOME/.cargo/bin
path+=$HOME/.npm/bin
path+=$HOME/go/bin
