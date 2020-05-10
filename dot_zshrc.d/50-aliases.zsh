# -*- sh -*-

alias e=editor
alias estat="journalctl --user-unit=emacs.service --follow"
alias k=kubectl
alias la="ls -lAh"
alias less="less -FSRX"
alias ssh-fix="chmod 600 ~/.ssh/{*/*.key,config}"
alias virsh-local="virsh -c qemu:///system"
alias zshreload="source $HOME/.zshrc"


proj() {
    PROJ="$(fd --max-depth=2 --base-directory="$PROJECT_DIR" --type=directory \
               | fzf --preview="ls $PROJECT_DIR/{}")"
    cd "$PROJECT_DIR/$PROJ"
}
