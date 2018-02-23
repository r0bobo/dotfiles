INSTALL_DIR ?= $(HOME)
BATS_INSTALL_DIR ?= /usr/local
DOTFILES := $(shell pwd)
ZPLUG_HOME := $(INSTALL_DIR)/.zplug
VIMPLUG_HOME := $(INSTALL_DIR)/.local/share/nvim/site/autoload/plug.vim
VENV := $(INSTALL_DIR)/.local/share/nvim/.virtualenv

CONFIG_FILES := \
	.config/alacritty/alacritty.yml \
	.config/mpv \
	.config/nvim/init.vim \
	.config/ranger \
	.config/termite/config \
	.ctags \
	.gitconfig \
	.globalrc \
	.ignore \
	.pam_environment \
  .pip/pip.conf \
	.pypirc \
	.spacemacs.d \
	.tmux.conf \
	.tmuxline.conf \
	.zshenv \
	.zshrc

.PHONY: all
all: $(addprefix $(INSTALL_DIR)/, $(CONFIG_FILES))

.PHONY: install
install: plugins all

.PHONY: plugins
plugins: vimplug virtual_env zplug

$(INSTALL_DIR)/%: FORCE
	@ [ ! -L $@ ] || rm $@
	@ # Backup directory if already exists
	@ if [ -d $@ ]; then [ -d $@.~ ] && rm -r $@.~; mv $@ $@.~; fi
	@ mkdir -p $(dir $@)
	@ # Create symlink and backup (dont create numbered backup if not supported)
	@	ln -sf --backup=numbered $(DOTFILES)/configs/$* $@ 2>/dev/null\
		|| ln -sfb $(DOTFILES)/configs/$* $@
	@ echo "linking $@"

FORCE:

.PHONY: install_bats
install_bats:
	git clone https://github.com/sstephenson/bats.git bats
	bats/install.sh $(BATS_INSTALL_DIR)
	rm -rf bats

.PHONY: vimplug
vimplug:
	curl -fLo $(VIMPLUG_HOME) --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;

.PHONY: zplug
zplug:
	[ -d $(ZPLUG_HOME) ] || git clone https://github.com/zplug/zplug $(ZPLUG_HOME)

.PHONY: virtual_env
virtual_env: $(VENV)/bin/activate
$(VENV)/bin/activate: requirements.txt
	python3 -m venv --without-pip $(VENV)
	@ # Fix broken venv-pip in Debian 8 and Ubuntu 14.04
	bash -c "source $(VENV)/bin/activate; \
		curl https://bootstrap.pypa.io/get-pip.py | python"
	bash -c "source $(VENV)/bin/activate; \
		pip install -Ur requirements.txt"

.PHONY: spacemacs
spacemacs:
	git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

.PHONY: spacemacs-layer-home
spacemacs-layer-home:
	cd ~/.spacemacs.d/layers && \
		ln -s private-home private

.PHONY: spacemacs-layer-work
spacemacs-layer-home:
	cd ~/.spacemacs.d/layers && \
		ln -s private-home private

.PHONY: test
test:
	bats test.sh
