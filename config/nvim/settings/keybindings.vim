" Deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>""

" vim-tmux-navigation"
" Don't allow any default key-mappings.
let g:tmux_navigator_no_mappings = 1

" vim-multi-cursors"
" Don't allow any default key-mappings.
let g:multi_cursor_use_default_mapping=0

" Re-enable tmux_navigator.vim default bindings, minus <c-\>.
" <c-\> conflicts with NERDTree "current file".

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Fzf
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nnoremap <silent> ,t :Files<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap <silent> ,w :Windows<CR>
nnoremap <silent> ,ag :Ag<CR>

" Nerd tree
map  <c-N> :NERDTreeTabsToggle<CR>
map  <c-F> :NERDTreeFind<CR>

" Move buffers
map <leader>x :bn<cr>
map <leader>z :bp<cr>

" Trim whitespace
map <leader>w :call TrimWhiteSpace()<CR>
