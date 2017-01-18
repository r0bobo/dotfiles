# Zsh aliases

alias zshreload="source ~/.zshrc"
alias promptreload="source $DOTFILES_DIR/zsh/prompt.zs"

alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

if hash termux-fix-shebang 2>/dev/null;then
    alias upgrade_dotfiles="sh $DOTFILES_DIR/scripts/setup-dotfiles-termux" 
else 
    alias upgrade_dotfiles="zsh $DOTFILES_DIR/scripts/setup-dotfiles" 
fi

