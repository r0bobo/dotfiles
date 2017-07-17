DOTFILES := $(shell pwd)
ZPLUG_HOME := $(HOME)/.zplug
VIMPLUG_HOME := $($HOME)/.local/share/nvim/site/autoload/plug.vim
all: install_neovim install_tmux install_zsh
	@echo "Finished setup"

setup_backup:
	mkdir -p $(DOTFILES)/bak

install_neovim: clean_neovim install_vimplug
	ln -s $(DOTFILES)/nvim/init.vim $(HOME)/.config/nvim/init.vim
install_vimplug:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
clean_neovim: setup_backup
	mkdir -p $(HOME)/.config/nvim
	if [ -e $(HOME)/.config/nvim/init.vim ]; then \
		mv $(HOME)/.config/nvim/init.vim $(DOTFILES)/bak/; \
	fi;

install_tmux: clean_tmux
	ln -s $(DOTFILES)/tmux/tmux.conf $(HOME)/.tmux.conf
clean_tmux: setup_backup
	if [ -e $(HOME)/.tmux.conf ]; then \
		mv $(HOME)/.tmux.conf $(DOTFILES)/bak/; \
	fi;

install_zsh: clean_zsh install_zplug
	ln -s $(DOTFILES)/zsh/zshrc $(HOME)/.zshrc
install_zplug:
	if [ ! -d $(ZPLUG_HOME) ];then \
		git clone https://github.com/zplug/zplug $(ZPLUG_HOME); \
	fi;
clean_zsh: setup_backup
	if [ -e $(HOME)/.zshrc ]; then \
		mv $(HOME)/.zshrc $(DOTFILES)/bak/; \
	fi;
