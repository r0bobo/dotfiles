" NeoVim key mapping

map <F12> :NERDTreeToggle <CR>
map <C-g> :bnext <CR>

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
