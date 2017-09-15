" vim:foldmethod=marker:foldlevel=0:foldenable

" NeoVim Config
" =============

" INITIAL {{{
" ==============================================================================
let g:loaded_ruby_provider = 1

let g:loaded_python_provider = 1
let g:python3_host_prog = $HOME."/.local/share/nvim/.virtualenv/bin/python"
let g:deoplete#sources#jedi#python_path = g:python3_host_prog


" }}}
" PLUGINS {{{
" ==============================================================================
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdcommenter', { 'on': [
        \ '<Plug>NERDCommenterToggle',
        \ '<Plug>NERDCommenterComment',
        \ '<Plug>NERDCommenterUncomment' ] }
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree',
        \ { 'on': ['NERDTreeFind', 'NERDTreeToggle', 'NERDTreeOpen'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': [
        \ 'NERDTreeFind',
        \ 'NERDTreeToggle',
        \ 'NERDTreeOpen'] }
Plug 'mhinz/vim-signify'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/vim-cursorword'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar', { 'on': ['TagbarOpen', 'TagbarToggle'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'hecal3/vim-leader-guide'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'dbakker/vim-projectroot'
Plug 'junegunn/gv.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'tpope/vim-eunuch'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-dispatch'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'chemzqm/denite-git'
Plug 'nixprime/cpsm', { 'do': 'PY3=ON ./install.sh' }
Plug 'joonty/vdebug'
Plug 'ludovicchabant/vim-lawrencium', { 'on': 'Hgvdiff' }
Plug 'tmhedberg/SimpylFold'
Plug 'sjl/gundo.vim'
Plug 'embear/vim-localvimrc'
Plug 'vim-scripts/bats.vim'

" Language Specific
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'ap/vim-css-color', { 'for': ['css', 'scss'] }
Plug 'junegunn/limelight.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'

" Colorschemes
Plug 'morhetz/gruvbox'

" Denite
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'chemzqm/denite-extra'
Plug 'Shougo/neoinclude.vim'
Plug 'nixprime/cpsm', { 'do': 'PY3=ON ./install.sh'}

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'wellle/tmux-complete.vim'
Plug 'Shougo/echodoc'
Plug 'Konfekt/FastFold'

if $USER=="dean"
    Plug 'ryanoasis/vim-devicons'
endif

if $USER=="deatod"
    Plug '~/.vim_plugin'
endif

call plug#end()


" }}}
" GENERAL SETTINGS {{{
" ==============================================================================
if $USER=="dean"
    set termguicolors
endif

set encoding=utf-8

set noshowmode      " dont show vim-mode in command line

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

set wrap!

set cursorline
set hlsearch
set incsearch

set backspace=indent,eol,start

set clipboard+=unnamedplus

set nofoldenable

" Theme
set background=dark
:silent! let g:gruvbox_contrast_dark="soft"
:silent! colorscheme gruvbox

set modeline
set modelines=5


" }}}
" FILETYPE-SETTINGS {{{
" =============================================================================
autocmd Filetype html setlocal ts=2 sts=2 sw=2  "Tab length = 2 in html

autocmd Filetype python setlocal foldmethod=indent

" }}}
" PLUGIN-SETTINGS {{{
" =============================================================================
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = '*.xml,*.html,*.xhtml,*.phtml,*.js'

" Fix delimitmate and closetag issues that inserts extra >
autocmd FileType xml,html,xhtml,phtml,js,htmldjango let b:delimitMate_matchpairs = "(:),[:],{:}"

" deoplete tab-complete
let g:deoplete#auto_complete_delay=0
let g:deoplete#sources#jedi#show_docstring = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

:silent! call deoplete#enable()
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Autoclose Deoplete preview
autocmd CompleteDone * silent! pclose!

let g:signify_vcs_list = [ 'git', 'hg' ]

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCreateDefaultMappings= 0

let NERDTreeMinimalUI = 1

" Disable polyglot python and used enhanced python syntax
let g:polyglot_disabled = ['python']
let g:python_highlight_all = 1

let NERDCreateDefaultMappings = 0

let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0


" }}}
" KEYMAP-SETUP {{{
" ==============================================================================

noremap <F9> :TagbarOpen -j <CR>
noremap <F8> :NERDTreeFind <CR>
noremap <C-PageUp> :bprevious <CR>
noremap <C-PageDown> :bnext <CR>

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

noremap <silent> <C-Left> :TmuxNavigateLeft<CR>
noremap <silent> <C-Down> :TmuxNavigateDown<CR>
noremap <silent> <C-Up> :TmuxNavigateUp<CR>
noremap <silent> <C-Right> :TmuxNavigateRight<CR>


" }}}
" LEADER-KEY-SETUP {{{
" ==============================================================================

let mapleader = ' '
set timeoutlen=20
set ttimeoutlen=0

let g:lmap = {
    \   '/' : [ 'Denite line -cursor-wrap -auto-highlight -smartcase', 'Line'],
    \   '*' : [ 'DeniteCursorWord line -cursor-wrap -auto-highlight',
            \   'Line Selected Word' ],
    \}

let g:lmap.d = {
    \   'name' : 'Denite',
    \   'p' : [ 'ProjectRootExe DeniteProjectDir file_rec -cursor-wrap', 'Project Files'],
    \   'P' : [ 'DeniteBufferDir file_rec -cursor-wrap', 'Dir Files'],
    \   'b' : [ 'Denite buffer -cursor-wrap', 'Open Buffers'],
    \   'o' : [ 'Denite file_old -cursor-wrap', 'Old File'],
    \   't' : [ 'Denite outline -cursor-wrap -auto-highlight', 'Code Tags'],
    \   'T' : [ 'DeniteCursorWord outline -cursor-wrap -auto-highlight', 'Code Tags'],
    \   'l' : [ 'Denite line -cursor-wrap -auto-highlight -smartcase', 'Line'],
    \   'L' : [ 'DeniteCursorWord line -cursor-wrap -auto-highlight',
            \   'Line Selected Word' ],
    \   'g' : [ 'ProjectRootExe Denite grep -cursor-wrap', 'Grep' ],
    \   'G' : [ 'ProjectRootExe DeniteCursorWord grep -cursor-wrap', 'Grep Selected Word' ],
    \   'h' : [ 'Denite help -cursor-wrap', 'Help' ],
    \   'e' : [ 'Denite location_list -cursor-wrap -auto-highlight', 'Linter Errors' ],
    \   'f' : [ 'Denite filetype -cursor-wrap -auto-highlight', 'Language' ],
    \}

let g:lmap.e = {
    \   'name' : 'Extra',
    \   'r' : [ 'so $MYVIMRC', 'Reload Neovim Config' ],
    \   'i' : [ 'edit $MYVIMRC', 'Open init.vim'],
    \   'n' : [ 'Denite line -cursor-wrap -auto-highlight -input=^.*\{{3}$ -mode=normal',
    \           'Navigate dotfiles' ],
    \}

let g:lmap.p = {
    \   'name' : 'Plugins',
    \   'i' : [ 'so $MYVIMRC | PlugInstall', 'Install' ],
    \   'u' : [ 'PlugUpgrade | PlugUpdate', 'Update' ],
    \   'c' : [ 'so $MYVIMRC | PlugClean ', 'Clean' ],
    \}

let g:lmap.g = {
    \   'name' : 'Git',
    \   'd' : [ 'Gdiff', 'Git Diff' ],
    \   'h' : [ 'GV', 'Commit History' ],
    \   'H' : [ 'GV!', 'File Commit History' ],
    \   'a' : [ 'Gwrite', 'Add File'],
    \   's' : [ 'Gstatus', 'Status'],
    \   'c' : [ 'Gcommit', 'Commit'],
    \   'p' : [ 'Gpush --all origin', 'Push all'],
    \}

    " \   'n' : [ 'call feedkeys("\<Plug>(signify-next-hunk)")', 'Show Next Diff'],
    " \   'p' : [ 'call feedkeys("\<Plug>(signify-prev-hunk)")', 'Show Prev Diff'],

let g:lmap.c = {
    \   'name' : 'Comment',
    \   ' ' : [ 'call feedkeys("\<Plug>NERDCommenterToggle")', 'Toggle' ],
    \   'c' : [ 'call feedkeys("\<Plug>NERDCommenterComment")', 'Comment' ],
    \   'u' : [ 'call feedkeys("\<Plug>NERDCommenterUncomment")', 'Uncomment' ],
    \}

let g:lmap.b = {
    \   'name' : 'Buffers',
    \   'n' : [ 'bnext', 'Next' ],
    \   'p' : [ 'bprevious', 'Previous' ],
    \   'q' : [ 'bdelete', 'Close' ],
    \   'r' : [ 'edit', 'Reload' ],
    \   'd' : [ 'lcd %:p:h ', 'CD to current buffer' ],
    \}

let g:lmap.m = {
    \   'name' : 'Make',
    \   'm' : [ 'Make', 'Make' ],
    \   'b' : [ 'Make', 'Make (Background)' ],
    \   't' : [ 'Make test', 'Run Tests' ],
    \   'l' : [ 'Copen', 'Make Log' ],
    \}

let g:lmap.a = {
    \   'name' : 'ALE',
    \   't': [ 'ALEToggle', 'Toggle' ],
    \   'n': [ 'ALENextWrap', 'Next Error' ],
    \   'p': [ 'ALEPreviousWrap', 'Previous Error' ],
    \   's': [ 'ALEFixSuggest', 'Show suggestions' ],
    \}

let g:lmap.i = {
    \   'name' : 'Interface',
    \   't' : [ 'TagbarToggle', 'Open Tagbar' ],
    \   'n' : [ 'NERDTreeToggle', 'Open NERDTree'],
    \}

:silent! call leaderGuide#register_prefix_descriptions(' ', "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

" "}}}
" DENITE-CONFIG {{{
" ==============================================================================

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

:silent! call denite#custom#map(
        \ 'normal',
        \ '<Up>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)

:silent! call denite#custom#map(
        \ 'normal',
        \ '<Down>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)


" Use ripgrep if avialable
if executable('rg')
    :silent! call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git', '--hidden'])

    :silent! call denite#custom#var('grep', 'command', ['rg'])
    :silent! call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
    :silent! call denite#custom#var('grep', 'recursive_opts', [])
    :silent! call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    :silent! call denite#custom#var('grep', 'separator', ['--'])
    :silent! call denite#custom#var('grep', 'final_opts', [])
endif

" call denite#custom#source(
    " \ 'file_rec', 'matchers', ['matcher_cpsm'])

" Change default prompt
:silent! call denite#custom#option('default', 'prompt', '>>')


" "}}}
" AIRLINE-CONFIG {{{
" ==============================================================================
let g:airline_powerline_fonts = 0

let g:tmuxline_powerline_separators = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0


" }}}
" TAGBAR-CONFIG {{{
" ==============================================================================
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1
let g:tagbar_width = 31
let g:tagbar_autoclose = 1
let g:tagbar_compact = 1

let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }


" }}}
