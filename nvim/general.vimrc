"general neovim settings

syntax on
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set number          " show line numbers

set clipboard+=unnamedplus

:silent! colorscheme quantum
:silent! call deoplete#enable()
