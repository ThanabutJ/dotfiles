filetype plugin indent on

set autowrite

" Go syntax highlighting
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
"let g:go_fmt_command = "goimports"

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
"autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"autocmd FileType go nmap <leader>r  <Plug>(go-run)
"autocmd FileType go nmap <leader>t  <Plug>(go-test)

"autocmd FileType go nmap <leader>er <Plug>(go-run)
autocmd FileType go nmap <leader>et <Plug>(go-test)
autocmd FileType go nmap <leader>eb <Plug>(go-build)
autocmd FileType go nmap <leader>eg <Plug>(go-generate)
autocmd FileType go nmap <leader>efm :GoFmt<CR>
autocmd FileType go nmap <leader>eat :GoAddTags
autocmd FileType go nmap <leader>ei :GoImports<CR>
autocmd FileType go nmap <leader>eC <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>efs :GoFillStruct<CR>
autocmd FileType go nmap <leader>eie :GoIfErr<CR>
autocmd FileType go nmap <leader>eid :GoSameIdsToggle<CR>
