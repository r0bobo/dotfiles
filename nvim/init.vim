" ============================================================================
" subcat                                                              VIM_PLUG
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
Plug 'mhinz/vim-signify'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/vim-cursorword'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'mhinz/vim-startify'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'hecal3/vim-leader-guide'
Plug 'ryanoasis/vim-devicons'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'dbakker/vim-projectroot'
Plug 'junegunn/gv.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'tpope/vim-eunuch'
Plug 'Valloric/MatchTagAlways'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-dispatch'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Airline
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Colorschemes
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
Plug 'Shougo/echodoc'
Plug 'Konfekt/FastFold'

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

autocmd Filetype html setlocal ts=2 sts=2 sw=2  "Tab length = 2 in html

set nofoldenable

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set cursorline

let g:loaded_ruby_provider = 1

let g:loaded_python_provider = 1
let g:deoplete#sources#jedi#show_docstring = 1

" ============================================================================
" subcat                                                       PLUGIN-SETTINGS 

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = '*.xml,*.html,*.xhtml,*.phtml,*.js'

" Fix delimitmate and closetag issues that inserts extra >
autocmd FileType xml,html,xhtml,phtml,js,htmldjango let b:delimitMate_matchpairs = "(:),[:],{:}"

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#auto_complete_delay=0

function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

let g:signify_vcs_list = [ 'git', 'hg' ]

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCreateDefaultMappings= 0

let NERDTreeMinimalUI = 1

let g:tagbar_autoshowtag = 1
let g:tagbar_width = 31

" Autoclose Deoplete preview
autocmd CompleteDone * silent! pclose!

" ============================================================================
" subcat                                                          KEYMAP-SETUP

" map <F5> :make <CR>
noremap <F9> :TagbarToggle <CR>
noremap <F8> :NERDTreeFind <CR>
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
    \   'p' : [ 'DeniteProjectDir file_rec -cursor-wrap', 'Project Files'],
    \   'b' : [ 'Denite buffer -cursor-wrap', 'Open Buffers'],
    \   'o' : [ 'Denite file_old -cursor-wrap', 'Old File'],
    \   't' : [ 'Denite outline -cursor-wrap -auto-highlight', 'Code Tags'],
    \   'l' : [ 'Denite line -cursor-wrap -auto-highlight -smartcase', 'Line'],
    \   'L' : [ 'DeniteCursorWord line -cursor-wrap -auto-highlight',
            \   'Line Selected Word' ],
    \   'g' : [ 'Denite grep -cursor-wrap', 'Grep' ],
    \   'G' : [ 'DeniteCursorWord grep -cursor-wrap', 'Grep Selected Word' ],
    \   'h' : [ 'Denite help -cursor-wrap', 'Help' ],
    \   'e' : [ 'Denite location_list -cursor-wrap -auto-highlight', 'Linter Errors' ],
    \}

let g:lmap.e = {
    \   'name' : 'Extra',
    \   'r' : [ 'so $MYVIMRC', 'Reload Neovim Config' ],
    \   'n' : [ 'Denite line -cursor-wrap -auto-highlight -input=subcat',
    \           'Navigate dotfiles' ],
    \   'i' : [ 'edit $MYVIMRC', 'Open init.vim'],
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
    \   '$' : [ 'call feedkeys("\<Plug>NERDCommenterToEOL")', 'To EOL' ],
    \   'a' : [ 'call feedkeys("\<Plug>NERDCommenterAltDelims")', 'Alternate Delimitators' ],
    \   'A' : [ 'call feedkeys("\<Plug>NERDCommenterAppend")', 'Append' ],
    \   'b' : [ 'call feedkeys("\<Plug>NERDCommenterAlignBoth")', 'Align Both' ],
    \   'c' : [ 'call feedkeys("\<Plug>NERDCommenterComment")', 'Comment' ],
    \   'i' : [ 'call feedkeys("\<Plug>NERDCommenterInvert")', 'Invert' ],
    \   'l' : [ 'call feedkeys("\<Plug>NERDCommenterAlignLeft")', 'Align Left' ],
    \   'm' : [ 'call feedkeys("\<Plug>NERDCommenterMinimal")', 'Minimal' ],
    \   'n' : [ 'call feedkeys("\<Plug>NERDCommenterNested")', 'Nested' ],
    \   's' : [ 'call feedkeys("\<Plug>NERDCommenterSexy")', 'Sexy' ],
    \   'u' : [ 'call feedkeys("\<Plug>NERDCommenterUncomment")', 'Uncomment' ],
    \   'y' : [ 'call feedkeys("\<Plug>NERDCommenterYank")', 'Yank' ],
    \}

let g:lmap.b = {
    \   'name' : 'Buffers',
    \   'n' : [ 'bnext', 'Next' ],
    \   'p' : [ 'bprevious', 'Previous' ],
    \   'q' : [ 'bdelete', 'Close' ],
    \   'r' : [ 'edit', 'Reload' ],
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

call denite#custom#var('file_rec', 'command',
	\ ['rg', '--files', '--glob', '!.git', ''])

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Change default prompt
call denite#custom#option('default', 'prompt', '>>')


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

