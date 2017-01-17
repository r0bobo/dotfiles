call plug#begin('~/.local/share/nvim/plugged')

" Plug 'tpope/vim-commentary'

Plug 'raimondi/delimitmate'

Plug 'nginx.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'edkolev/tmuxline.vim'

Plug 'tyrannicaltoucan/vim-quantum'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-jedi'
Plug 'wellle/tmux-complete.vim'
Plug 'Shougo/echodoc'
Plug 'Konfekt/FastFold'

call plug#end()
