INSTALL_DIR ?= $(HOME)
DOTFILES := $(shell pwd)
ZPLUG_HOME = $(INSTALL_DIR)/.zplug
VIMPLUG_HOME = $(INSTALL_DIR)/.local/share/nvim/site/autoload/plug.vim
VENV := .venv

CONFIG_FILES := \
	.config/nvim/init.vim \
	.ctags \
	.gitconfig \
	.ignore \
	.tmux.conf \
	.tmuxline.conf \
   	.zshrc

all: $(addprefix $(INSTALL_DIR)/, $(CONFIG_FILES)) vimplug zplug

vimplug:
	curl -fLo $(VIMPLUG_HOME) --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;

zplug:
	[ -d $(ZPLUG_HOME) ] || git clone https://github.com/zplug/zplug $(ZPLUG_HOME)

$(INSTALL_DIR)/%: FORCE
	@ [ ! -L $@ ] || rm $@
	@ mkdir -p $(dir $@)
	ln -sf --backup=numbered $(DOTFILES)/configs/$* $@

FORCE:

venv: $(VENV)/bin/activate
$(VENV)/bin/activate: requirements.txt
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install -Ur requirements.txt
