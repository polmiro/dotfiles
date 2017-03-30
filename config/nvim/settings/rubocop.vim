function! RubocopFix()
  silent execute "!rubocop -a %"
  edit! %
  Neomake
endfunction

nnoremap <leader>rf :call RubocopFix()<CR>```"

