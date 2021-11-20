"lspconfig
lua << EOF

EOF
"
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gD :lua vim.lsp.buf.type_definition()<CR>
"nnoremap gi :lua vim.lsp.buf.implementation()<CR> "use telescope one
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
"nnoremap <leader>sh :lua vim.lsp.buf.signature_help()<CR> "use saga one
nnoremap <leader>grr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gld :lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>gp :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>q :lua vim.lsp.diagnostic.set_loclist()<CR>


"used telescope for this
"nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR> 
nnoremap K :lua vim.lsp.buf.hover()<CR>

inoremap <C-Space> <C-n>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
"nnoremap K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent><leader>gd <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>

nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

" only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

nnoremap <silent> gp <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
