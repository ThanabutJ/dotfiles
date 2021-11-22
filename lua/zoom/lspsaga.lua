--local saga = require('lspsaga')

--saga.init_lsp_saga()
--
--vim.cmd [[
--]]
-- scroll down hover doc or scroll in definition preview
--nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
---- scroll up hover doc
--nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

--local map = vim.api.nvim_set_keymap
--map("n","<C-f>","pumvisible() ? \"\"", {silent=true, noremap=true})
