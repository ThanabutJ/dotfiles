let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viwer = 'zathura'
let g:livepreview_previwer = 'zathura'
autocmd FileType tex nmap <leader><leader>c :VimtexCompile<CR>
autocmd FileType tex nmap <leader><leader>v :VimtexView<CR>
