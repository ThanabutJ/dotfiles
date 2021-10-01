autocmd FileType sh nmap <leader><leader>c :FloatermNew shellcheck %:p<CR>
autocmd FileType sh nmap <leader><leader>r :FloatermNew --title=shell\ run --autoclose=0 %:p<CR>
