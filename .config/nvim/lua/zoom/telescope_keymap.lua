local nnoremap = require("zoom.keymap").nnoremap
local builtin = require('telescope.builtin')

nnoremap("<leader>fp", function() builtin.git_files() end)
nnoremap("<leader>ff", function() builtin.find_files() end)
nnoremap("<leader>bf", function() builtin.buffers() end)
nnoremap("<leader>fh", function() builtin.help_tags() end)
nnoremap("<leader>fof", function() builtin.oldfiles() end)
nnoremap("<leader>fp", function() builtin.git_files() end)
nnoremap("<leader>fca", function() builtin.lsp_code_actions() end)
nnoremap("<leader>few", function() builtin.file_browser() end)
nnoremap("<leader>fee",
    function() builtin.file_browser({ cwd = require("telescope.utils").buffer_dir() }) end)

--lsp builtin
nnoremap("<leader>sd", function() builtin.lsp_document_symbols() end)
nnoremap("<leader>sw", function() builtin.lsp_workspace_symbols() end)
nnoremap("<leader>ed", "<cmd>Telescope diagnostics bufnr=0<cr>")
nnoremap("<leader>ew", "<cmd>Telescope diagnostics<cr>")
nnoremap("gi", function() builtin.lsp_implementations() end)
nnoremap("<leader>grr", function() builtin.lsp_references() end)

nnoremap("<leader>pgs", function() builtin.git_status() end)
nnoremap("<leader>gc", function() builtin.git_branches() end)

nnoremap("<leader>pts", function() builtin.treesitter() end)

nnoremap("<leader>fdf", function() require('zoom.telescope').search_dotfiles() end)

nnoremap("<leader>as", "<cmd>Telescope tmux sessions<CR>")
nnoremap("<leader>aw", "<cmd>Telescope tmux windows<CR>")
nnoremap("<leader>ap", "<cmd>Telescope tmux pane_contents<CR>")

nnoremap("<leader><leader>im", function() require 'telescope'.extensions.goimpl.goimpl {} end)
nnoremap("<leader>bm", function() require('telescope').extensions.bookmarks.bookmarks({}) end)
