"telescope
lua require("zoom")

" Find files using Telescope command-line sugar.
nnoremap <silent> <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <silent> <leader>bf :lua require('telescope.builtin').buffers()<CR>
nnoremap <silent> <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <silent> <leader>fof <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <silent> <leader>fp :lua require('telescope.builtin').git_files()<CR>
nnoremap <silent> <leader>fca :lua require('telescope.builtin').lsp_code_actions()<CR>
nnoremap <silent> <leader>few :lua require('telescope.builtin').file_browser()<CR>
nnoremap <silent> <leader>fee :lua require('telescope.builtin').file_browser({ cwd = require("telescope.utils").buffer_dir()})<CR><Esc>

nnoremap <silent> <leader>pl <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent> <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

"lsp builtin
nnoremap <silent> <leader>sd <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <silent> <leader>sw <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
nnoremap <silent> <leader>ed <cmd>Telescope diagnostics bufnr=0<cr>
nnoremap <silent> <leader>ew <cmd>Telescope diagnostics<cr>
nnoremap <silent> gi <cmd>lua require('telescope.builtin').lsp_implementations()<cr>

nnoremap <silent> <leader>pgs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <silent> <leader>gc <cmd>lua require('telescope.builtin').git_branches()<cr>

nnoremap <silent> <leader>pts <cmd>lua require('telescope.builtin').treesitter()<cr>

nnoremap <silent> <leader>fdf :lua require('zoom.telescope').search_dotfiles()<CR>

nnoremap <silent> <leader>as <cmd>Telescope tmux sessions<CR>
nnoremap <silent> <leader>aw <cmd>Telescope tmux windows<CR>
nnoremap <silent> <leader>ap <cmd>Telescope tmux pane_contents<CR>

nnoremap <silent> <leader><leader>im :lua require'telescope'.extensions.goimpl.goimpl{}<CR>
nnoremap <silent> <leader>bm :lua require('telescope').extensions.bookmarks.bookmarks({})<CR>

"nnoremap <leader>gpt :lua require('zoom.telescope').git_tag_selector()<CR>

"nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
"nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
"nnoremap <leader>gc :lua require('theprimeagen.telescope').git_branches()<CR>
