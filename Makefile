INSTALL_DIR ?= $(HOME)
BATS_INSTALL_DIR ?= /usr/local
DOTFILES := $(shell pwd)
ZPLUG_HOME := $(INSTALL_DIR)/.zplug
VIMPLUG_HOME := $(INSTALL_DIR)/.local/share/nvim/site/autoload/plug.vim
VENV := $(INSTALL_DIR)/.local/share/nvim/.virtualenv

CONFIG_FILES := \
	.config/nvim/init.vim \
	.config/termite/config \
	.ctags \
	.gitconfig \
	.ignore \
	.tmux.conf \
	.tmuxline.conf \
   	.zshrc

.PHONY: all \
	install \
	install_bats \
	plugins \
	test \
	vimplug \
	virtual_env \
	zplug

all: $(addprefix $(INSTALL_DIR)/, $(CONFIG_FILES))

install: plugins all

plugins: vimplug virtual_env zplug

$(INSTALL_DIR)/%: FORCE
	@ [ ! -L $@ ] || rm $@
	@ mkdir -p $(dir $@)

	# Create numbered backup if supported
	ln -sf --backup=numbered $(DOTFILES)/configs/$* $@ \
		|| ln -sfb $(DOTFILES)/configs/$* $@

FORCE:

install_bats:
	git clone https://github.com/sstephenson/bats.git bats
	bats/install.sh $(BATS_INSTALL_DIR)
	rm -rf bats

vimplug:
	curl -fLo $(VIMPLUG_HOME) --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;

zplug:
	[ -d $(ZPLUG_HOME) ] || git clone https://github.com/zplug/zplug $(ZPLUG_HOME)

virtual_env: $(VENV)/bin/activate
$(VENV)/bin/activate: requirements.txt
	python3 -m venv --without-pip $(VENV)
	# Fix broken venv-pip in Debian 8 and Ubuntu 14.04
	bash -c "source $(VENV)/bin/activate; \
		curl https://bootstrap.pypa.io/get-pip.py | python"
	bash -c "source $(VENV)/bin/activate; \
		pip install -Ur requirements.txt"

test:
	bats test.sh
