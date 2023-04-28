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

nnoremap("<leader>pl", function() builtin.live_grep() end)
nnoremap("<leader>ps", function() builtin.grep_string({ search = vim.fn.input({"Grep For > "})}) end)
nnoremap("<leader>pw", function() builtin.grep_string({ search = vim.fn.expand("<cword>") }) end)


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

nnoremap("<leader><leader>im", function() require 'telescope'.extensions.goimpl.goimpl {} end)
nnoremap("<leader>bm", function() require('telescope').extensions.bookmarks.bookmarks({}) end)

nnoremap('<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
