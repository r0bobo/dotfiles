" TODO: Implement auto-installation of vim plug from \"https://github.com/junegunn/vim-plug/wiki/faq\"
if empty(glob('$VIMPLUG_HOME'))
  silent !curl -fLo $VIMPLUG_HOME --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/vim-cursorword'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'tpope/vim-fugitive'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'

" Colorschemes
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'altercation/vim-colors-solarized'

" Denite
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'wellle/tmux-complete.vim'
Plug 'Shougo/echodoc'
Plug 'Konfekt/FastFold'

" Lint
Plug 'benekastah/neomake'

" Syntaxes
Plug 'nginx.vim'

call plug#end()
