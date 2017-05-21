" NeoVim key mapping

map <F12> :NERDTreeToggle <CR>
map <C-Pageup> :bprevious <CR>
map <C-Pagedown> :bnext <CR>
let mapleader = '-'

" Tmux Navigator
let g:tmux_navigator_no_mappings = 1

" TmuxNavigor Keymaps
nnoremap <silent> <C-Left> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-Down> :TmuxNavigateDown<CR>
nnoremap <silent> <C-Up> :TmuxNavigateUp<CR>
nnoremap <silent> <C-Right> :TmuxNavigateRight<CR>

" Denite mappings
map <C-P> :Denite file_rec <CR>
map <C-B> :Denite buffer <CR>

call denite#custom#map(
        \ 'insert',
        \ '<Up>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)

call denite#custom#map(
        \ 'insert',
        \ '<Down>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
