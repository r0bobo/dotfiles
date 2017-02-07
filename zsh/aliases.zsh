# Zsh aliases

alias zshreload="source ~/.zshrc"
alias promptreload="source $DOTFILES_DIR/zsh/prompt.zsh"

# Directory
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lAh --color=auto'

if hash termux-fix-shebang 2>/dev/null;then
    alias upgrade_dotfiles="sh $DOTFILES_DIR/scripts/setup-dotfiles-termux" 
else 
    alias upgrade_dotfiles="zsh $DOTFILES_DIR/scripts/setup-dotfiles" 
fi

alias diff='diff --color=auto'  # Color diff

alias grep='grep --color=auto'  # Color grep

# Color manpages
export MANPAGER='lynx -force_html'
alias man='man -Thtml'
