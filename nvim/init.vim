" ============================================================================
" subcat                                                              VIM_PLUG

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-commentary'
" Plug 'raimondi/delimitmate'
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'airblade/vim-gitgutter'
" Plug 'haya14busa/incsearch.vim'
" Plug 'itchyny/vim-cursorword'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'tpope/vim-fugitive'
" Plug 'tmux-plugins/vim-tmux'
" Plug 'mhinz/vim-startify'
" Plug 'ntpeters/vim-better-whitespace'
" Plug 'lifepillar/vim-cheat40'
" Plug 'chr4/nginx.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'hecal3/vim-leader-guide'


" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
" Plug 'edkolev/promptline.vim'

" Colorschemes
" Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'altercation/vim-colors-solarized'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'

" Denite
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'chemzqm/denite-extra'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'wellle/tmux-complete.vim'
" Plug 'Shougo/echodoc'
" Plug 'Konfekt/FastFold'

" Syntaxes
" Plug 'nginx.vim'
" Plug 'PotatoesMaster/i3-vim-syntax'

Plug 'ryanoasis/vim-devicons'

call plug#end()


" ============================================================================
" subcat                                                      GENERAL-SETTINGS

syntax on
set number          " show line numbers
set hidden          " allow buffers open in background without needing to save

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

set wrap!

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


" ============================================================================
" subcat                                                          AUTOCOMMANDS

autocmd Filetype html setlocal ts=2 sts=2 sw=2  "Tab length = 2 in html


" ============================================================================
" subcat                                                          KEYMAP-SETUP

map <F5> :make <CR>
map <F8> :TagbarToggle <CR>
noremap <C-PageUp> :bprevious <CR>
noremap <C-PageDown> :bnext <CR>

noremap <silent> <C-Left> :TmuxNavigateLeft<CR>
noremap <silent> <C-Down> :TmuxNavigateDown<CR>
noremap <silent> <C-Up> :TmuxNavigateUp<CR>
noremap <silent> <C-Right> :TmuxNavigateRight<CR>


" ============================================================================
" subcat                                                      LEADER-KEY-SETUP

let mapleader = ' '
set timeoutlen=20
set ttimeoutlen=0


let g:lmap = {}
let g:lmap.d = {
    \   'name' : 'Denite',
    \   'f' : [ 'Denite file_rec', 'Recursive File'],
    \   'b' : [ 'Denite buffer', 'Open Buffers'],
    \   'o' : [ 'Denite file_old', 'Old File'],
    \   't' : [ 'Denite outline', 'Code Tags'],
    \   'l' : [ 'Denite line', 'Line' ],
    \   '*' : [ 'DeniteCursorWord line', 'Line, highligted word' ],
    \   'g' : [ 'Denite grep', 'Grep' ],
    \}
let g:lmap.e = {
    \   'name' : 'Extra',
    \   'r' : [ 'so $MYVIMRC', 'Reload Neovim Config' ],
    \}

call leaderGuide#register_prefix_descriptions(' ', "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

" ============================================================================
" subcat                                                         DENITE-CONFIG

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

call denite#custom#var('file_rec', 'command',
	\ ['rg', '--files', '--glob', '!.git', ''])


" ============================================================================
" subcat                                                        AIRLINE-CONFIG

" if !exists('g:airline_symbols')
" 	let g:airline_symbols = {}
" endif
" 
let g:airline_powerline_fonts = 0
" let g:airline_symbols.space = "\ua0"

let g:tmuxline_powerline_separators = 0

" 
let g:airline#extensions#tabline#enabled = 1


" ============================================================================
" subcat                                                         TAGBAR-CONFIG

let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}


