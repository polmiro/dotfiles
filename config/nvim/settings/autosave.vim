" TrimWhiteSpaces when saving
autocmd BufWritePre * :call TrimWhiteSpace()
" Display white space after insert
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
