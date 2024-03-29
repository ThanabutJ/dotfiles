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

" Auto linting
let g:go_metalinter_autosave = 0

"let g:go_fmt_command = "goimports"

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" Specifies whether `gopls` should run staticcheck checks.
let g:go_gopls_staticcheck = v:null

" Status line types/signatures
let g:go_auto_type_info = 1

" disable using K for godoc
let g:go_doc_keywordprg_enabled = 0

let g:go_doc_popup_window = 1

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
autocmd FileType go nmap <leader><leader>t <Plug>(go-test)
autocmd FileType go nmap <leader><leader>K <Plug>(go-doc)
autocmd FileType go nmap <leader><leader>b <Plug>(go-build)
autocmd FileType go nmap <leader><leader>gg <Plug>(go-generate)
autocmd FileType go nmap <leader><leader>r <Plug>(go-run)
autocmd FileType go nmap <leader><leader>fm :GoFmt<CR>
autocmd FileType go nmap <leader><leader>at :GoAddTags
autocmd FileType go nmap <leader><leader>i :GoImports<CR>
autocmd FileType go nmap <leader><leader>C <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader><leader>fs :GoFillStruct<CR>
autocmd FileType go nmap <leader><leader>ie :GoIfErr<CR>
autocmd FileType go nmap <leader><leader>id :GoSameIdsToggle<CR>
autocmd FileType go nmap <leader><leader><Tab> :GoAlternate<CR>
autocmd FileType go nmap <leader><leader>a :vsp<CR>:GoAlternate<CR>
autocmd FileType go nmap <leader><leader>l :GoLint<CR>

autocmd FileType go nmap <leader><leader>dd :GoDebugStart
autocmd FileType go nmap <leader><leader>ds <Plug>(go-debug-stop)
autocmd FileType go nmap <F10> <Plug>(go-debug-breakpoint)
autocmd FileType go nmap <F5> <Plug>(go-debug-continue)
autocmd FileType go nmap <F11> <Plug>(go-debug-step)

autocmd FileType go nmap <leader><leader>gtt :GoTest<CR>
autocmd FileType go nmap <leader>gtf :GoTestFunc<CR>
autocmd FileType go nmap <leader><leader>gta :GoTestAll<CR>
