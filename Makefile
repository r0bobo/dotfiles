INSTALL_DIR ?= $(HOME)
BATS_INSTALL_DIR ?= /usr/local
DOTFILES := $(shell pwd)
ZPLUG_HOME = $(INSTALL_DIR)/.zplug
VIMPLUG_HOME = $(INSTALL_DIR)/.local/share/nvim/site/autoload/plug.vim
VENV = $(INSTALL_DIR)/.local/share/nvim/.virtualenv

CONFIG_FILES := \
	.config/nvim/init.vim \
	.config/termite/config \
	.ctags \
	.gitconfig \
	.ignore \
	.tmux.conf \
	.tmuxline.conf \
   	.zshrc

.PHONY: all install install_bats plugins test vimplug virtual_env zplug

all: $(addprefix $(INSTALL_DIR)/, $(CONFIG_FILES))

install: plugins all

plugins: vimplug virtual_env zplug

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

virtual_env: $(VENV)/bin/activate
$(VENV)/bin/activate: requirements.txt
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install -Ur requirements.txt

install_bats:
	git clone https://github.com/sstephenson/bats.git bats
	bats/install.sh $(BATS_INSTALL_DIR)
	rm -rf bats

test:
	bats test.sh
