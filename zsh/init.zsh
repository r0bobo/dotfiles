# Zsh init script

# Setup paths
export DOTFILES_DIR=${DOTFILES_DIR-~/dotfiles}
source $DOTFILES_DIR/zsh/paths.sh

# Source config files
source $DOTFILES_DIR/zsh/general.zsh
source $DOTFILES_DIR/zsh/aliases.zsh
source $DOTFILES_DIR/zsh/commands.zsh
source $DOTFILES_DIR/zsh/zplug.zsh
source $DOTFILES_DIR/zsh/prompt.zsh

source $ZSH/oh-my-zsh.sh
