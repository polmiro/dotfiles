" TrimWhiteSpaces when saving
autocmd BufWritePre * :call TrimWhiteSpace()
" Display white space after insert
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1
