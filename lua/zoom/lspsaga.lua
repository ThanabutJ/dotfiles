local saga = require('lspsaga')

saga.init_lsp_saga()

vim.cmd [[
nnoremap <silent><leader>gd <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>

nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

" only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

nnoremap <silent> gp <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
]]
-- scroll down hover doc or scroll in definition preview
--nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
---- scroll up hover doc
--nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

local map = vim.api.nvim_set_keymap
--map("n","<C-f>","pumvisible() ? \"\"", {silent=true, noremap=true})
