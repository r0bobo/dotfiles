# Zsh aliases

alias zshreload="source ~/.zshrc"

if hash termux-fix-shebang 2>/dev/null;then
    alias upgrade_dotfiles="sh $DOTFILES_DIR/scripts/setup-dotfiles-termux" 
else 
    alias upgrade_dotfiles="sh $DOTFILES_DIR/scripts/setup-dotfiles" 
fi

