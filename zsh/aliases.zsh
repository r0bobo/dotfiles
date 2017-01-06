# Zsh aliases

alias zshreload="source ~/.zshrc"

if hash termux-fix-shebang 2>/dev/null;then
    alias upgrade_dotfiles="sh ~/dotfiles/create_symlinks.sh"
else 
    alias upgrade_dotfiles="sh ~/dotfiles/create_symlinks.sh"
fi

