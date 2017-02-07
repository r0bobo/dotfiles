"general neovim settings

syntax on
set number          " show line numbers

" Setup tab length
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set clipboard+=unnamedplus

set background=dark
:silent! colorscheme gruvbox
:silent! call deoplete#enable()

set modeline
set modelines=2
