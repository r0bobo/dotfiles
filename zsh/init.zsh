# Zsh init script

export DOTFILES_DIR=~/dotfiles
export ZSH=~/.oh-my-zsh

# ZSH_THEME="agnoster"

source $DOTFILES_DIR/zsh/paths.zsh
source $DOTFILES_DIR/zsh/general.zsh
source $DOTFILES_DIR/zsh/aliases.zsh
source $DOTFILES_DIR/zsh/commands.zsh
source $DOTFILES_DIR/zsh/zplug.zsh

source $ZSH/oh-my-zsh.sh
