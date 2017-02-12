# Zsh init script

# Setup paths
export DOTFILES_DIR=${DOTFILES_DIR-~/dotfiles}
source $DOTFILES_DIR/zsh/paths.sh

# # Start tmux
# if command -v tmux>/dev/null; then
#   [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
# fi

# Source config files
source $DOTFILES_DIR/zsh/general.zsh
source $DOTFILES_DIR/zsh/keybind.zsh
source $DOTFILES_DIR/zsh/functions.sh
source $DOTFILES_DIR/zsh/aliases.zsh
source $DOTFILES_DIR/zsh/zplug.zsh
source $DOTFILES_DIR/zsh/prompt.zsh


if hash neofetch 2>/dev/null;then
   neofetch
fi
