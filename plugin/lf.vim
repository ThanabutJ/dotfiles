"remove lf default mapping
let g:lf_map_keys = 0
"open lf when vim opens a directory
let g:lf_replace_netrw = 1
 
nnoremap <leader>fmf :Lf<CR>
nnoremap <leader>fmw :LfWorkingDirectory<CR>
nnoremap <leader>fmd :LfCurrentDirectory<CR>
