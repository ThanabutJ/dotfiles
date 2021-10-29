"remove lf default mapping
let g:lf_map_keys = 0
"open lf when vim opens a directory
let g:lf_replace_netrw = 1
 
let g:lf_command_override = 'lf -command "set hidden"'

nnoremap <leader>fmf :Lf<CR>
nnoremap <leader>fmw :LfWorkingDirectory<CR>
nnoremap <leader>fmd :LfCurrentDirectory<CR>
nnoremap <silent> <leader>fxp :FloatermNew --height=0.9 --width=0.8 --autoclose=2 --autohide=2 --name=nextjs_page lf pages<cr>
