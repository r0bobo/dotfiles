"general neovim settings

syntax on
set number          " show line numbers

set hidden  " allow buffers open in background without needing to save

" Setup tab length
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent

set showmatch

set ignorecase
set smartcase

set hlsearch
set incsearch

set backspace=indent,eol,start

set clipboard+=unnamedplus

set background=dark
:silent! colorscheme gruvbox
:silent! call deoplete#enable()

set modeline
set modelines=5
