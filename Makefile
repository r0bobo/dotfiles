DOTFILES := $(shell pwd)
ZPLUG_HOME = $(HOME)/.zplug
VIMPLUG_HOME = $(HOME)/.local/share/nvim/site/autoload/plug.vim
VENV := .venv

CONFIG_FILES := \
	.ctags \
	.gitconfig \
	.ignore

all: $(addprefix $(HOME)/, $(CONFIG_FILES))

zplug:
	[ -d $(ZPLUG_HOME) ] || git clone https://github.com/zplug/zplug $(ZPLUG_HOME)

vimplug:
	curl -fLo $(VIMPLUG_HOME) --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;

$(HOME)/%: FORCE
	[ ! -L $@ ] || rm $@
	ln -sfb $(DOTFILES)/configs/$* $@

FORCE:

venv: $(VENV)/bin/activate
$(VENV)/bin/activate: requirements.txt
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install -Ur requirements.txt
