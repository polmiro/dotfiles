function! Light()
  execute "!light"
endfunction

function! Dark()
  execute "!dark"
endfunction

colorscheme NeoSolarized
set background=dark
let g:airline_theme='solarized'
let g:gitgutter_sign_column_always=1
let g:neosolarized_visibility='high'
set cursorline
set cursorcolumn
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
