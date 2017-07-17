" ## Vim-plug ##

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'tpope/vim-commentary'
" Plug 'raimondi/delimitmate'
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'airblade/vim-gitgutter'
" Plug 'haya14busa/incsearch.vim'
" Plug 'itchyny/vim-cursorword'
" Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'tpope/vim-fugitive'
" Plug 'tmux-plugins/vim-tmux'
" Plug 'mhinz/vim-startify'
" Plug 'ntpeters/vim-better-whitespace'
" Plug 'lifepillar/vim-cheat40'
" Plug 'chr4/nginx.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'


" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
" Plug 'edkolev/promptline.vim'

" Colorschemes
" Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'altercation/vim-colors-solarized'
" Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'

" Denite
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Deoplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neco-vim'
" Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" Plug 'wellle/tmux-complete.vim'
" Plug 'Shougo/echodoc'
" Plug 'Konfekt/FastFold'

" Lint
" Plug 'benekastah/neomake'

" Syntaxes
" Plug 'nginx.vim'
" Plug 'PotatoesMaster/i3-vim-syntax'

" Plug 'ryanoasis/vim-devicons'

call plug#end()


" ***************
" *** GENERAL ***
" ***************

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

set mouse=a

set showmatch

set ignorecase
set smartcase

set hlsearch
set incsearch

set backspace=indent,eol,start

set clipboard+=unnamedplus

set background=dark
:silent! let g:gruvbox_contrast_dark="soft"
:silent! colorscheme gruvbox
:silent! call deoplete#enable()

set modeline
set modelines=5
" NeoVim key mapping

map <F8> :TagbarToggle <CR>
map <F12> :NERDTreeToggle <CR>
nnoremap <C-PageUp> :bprevious <CR>
nnoremap <C-PageDown> :bnext <CR>
let mapleader = '-'

" Tmux Navigator
let g:tmux_navigator_no_mappings = 1

" TmuxNavigor Keymaps
nnoremap <silent> <C-Left> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-Down> :TmuxNavigateDown<CR>
nnoremap <silent> <C-Up> :TmuxNavigateUp<CR>
nnoremap <silent> <C-Right> :TmuxNavigateRight<CR>

" Denite mappings
map <silent> <C-P> :Denite file_rec <CR>
map <silent> <C-B> :Denite buffer <CR>

:silent! call denite#custom#map(
        \ 'insert',
        \ '<Up>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)

:silent! call denite#custom#map(
        \ 'insert',
        \ '<Down>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
" Airline config

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"

let g:airline#extensions#tabline#enabled = 1
