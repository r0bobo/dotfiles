alias e=editor
alias estat="journalctl --user-unit=emacs.service --follow"
alias k=kubectl
alias la="ls -lAh"
alias less="less -FSRX"
alias ssh-fix="chmod 600 ~/.ssh/{*/*.key,config}"
alias virsh-local="virsh -c qemu:///system"
alias zshreload="source $HOME/.zshrc"


proj() {
    BASE="$HOME/projects"
    PROJ="$(fd --max-depth=2 --base-directory="$BASE" --type=directory \
               | fzf --preview='ls $HOME/projects/{}')"
    cd "$BASE/$PROJ"
}
