" ## Vim-plug ##

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


" ***************
" *** GENERAL ***
" ***************

"general neovim settings

syntax on
set number          " show line numbers

" set hidden  " allow buffers open in background without needing to save

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
autocmd Filetype html setlocal ts=2 sts=2 sw=2



" NeoVim key mapping

map <F5> :make <CR>
map <F8> :TagbarToggle <CR>
noremap <C-PageUp> :bprevious <CR>
noremap <C-PageDown> :bnext <CR>
let mapleader = '-'

" Tmux Navigator
" let g:tmux_navigator_no_mappings = 1

" TmuxNavigor Keymaps
noremap <silent> <C-Left> :TmuxNavigateLeft<CR>
noremap <silent> <C-Down> :TmuxNavigateDown<CR>
noremap <silent> <C-Up> :TmuxNavigateUp<CR>
noremap <silent> <C-Right> :TmuxNavigateRight<CR>

" Denite mappings
map <silent> <C-P> :Denite file_old <CR>
map <silent> <C-B> :Denite buffer <CR>
map <silent> <Ä> :DeniteCursorWord line <CR>

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

" if !exists('g:airline_symbols')
" 	let g:airline_symbols = {}
" endif
" 
let g:airline_powerline_fonts = 0
" let g:airline_symbols.space = "\ua0"

let g:tmuxline_powerline_separators = 0

" 
let g:airline#extensions#tabline#enabled = 1

let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}

" Add custom menus
let s:menus = {}

" let s:menus.dotfiles = {
" 	\ 'description': 'Edit dotfiles'
" 	\ }
" let s:menus.dotfiles.file_candidates = [
" 	\ ['init.vim', '~/.dotfiles/nvim/init.vim'],
" 	\ ['tmux.conf', '~/.dotfiles/tmux/tmux.conf'],
" 	\ ['zshrc', '~/.dotfiles/zsh/zshrc'],
" 	\ ]

 let s:menus.my_commands = {
 	\ 'description': 'Example commands'
 	\ }
let s:menus.my_commands.command_candidates = [
	\ ['Split the window', 'vnew'],
	\ ['Open zsh menu', 'Denite menu:zsh'],
	\ ]

call denite#custom#var('menu', 'menus', s:menus)
