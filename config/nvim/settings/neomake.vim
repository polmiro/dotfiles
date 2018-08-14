" neomake
let g:neomake_ruby_enabled_makers = ['mri']
let g:neomake_elixir_enabled_makers = ['credo']
let g:neomake_open_list = 2
autocmd! BufWritePost *.rb,*.exs,*.ex Neomake
