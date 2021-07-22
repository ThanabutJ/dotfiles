"lspconfig
lua << EOF

EOF
"
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>grr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>gsd :lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>q :lua vim.lsp.diagnostic.set_loclist()<CR>

"lsp completion
"set completeopt=menuone,noselect
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
""let g:completion_auto_change_source = 1
"let g:completion_chain_complete_list = [
"    \{'complete_items': ['lsp','path']},
"    \{'complete_items': ['buffers']},
"    \{'mode': '<c-p>'},
"    \{'mode': '<c-n>'}
"\]
"let g:markdown_fenced_languages = [
"      \ 'vim',
"      \ 'help'
"      \]
"
"imap  <c-j> <Plug>(completion_next_source)
"imap  <c-k> <Plug>(completion_prev_source)

inoremap <C-Space> <C-n>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
