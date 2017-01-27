"general neovim settings

syntax on
set number          " show line numbers

" Setup tab length
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set clipboard+=unnamedplus

:silent! colorscheme quantum
:silent! call deoplete#enable()
