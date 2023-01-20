local nnoremap = require("zoom.keymap").nnoremap
local inoremap = require("zoom.keymap").inoremap
local kset = vim.keymap.set

nnoremap("gd", function() vim.lsp.buf.definition() end)
nnoremap("gD", function() vim.lsp.buf.type_definition() end)
nnoremap("<leader>gd", function() vim.lsp.buf.declaration() end)
--nnoremap( "gi", function() vim.lsp.buf.implementation() end) "use telescope one
nnoremap("<leader>gi", function() vim.lsp.buf.implementation() end)
-- nnoremap <leader>sh :lua vim.lsp.buf.signature_help()<CR> "use saga one
-- nnoremap("<leader>grr", function() vim.lsp.buf.references() end)
nnoremap("<leader>grn", function() vim.lsp.buf.rename() end)
nnoremap("<leader>gld", function() vim.lsp.util.show_line_diagnostics() end)
nnoremap("<leader>gn", function() vim.diagnostic.goto_next() end)
nnoremap("<leader>gp", function() vim.diagnostic.goto_prev() end)
nnoremap("<leader>q", function() vim.lsp.diagnostic.set_loclist() end)
nnoremap("gs", function() vim.lsp.buf.signature_help() end)
nnoremap("<leader>E", function() vim.diagnostic.open_float() end)

-- used telescope for this
-- nnoremap( "<leader>gca", function() vim.lsp.buf.code_action() end)
nnoremap("K", function() vim.lsp.buf.hover() end)

inoremap("<C-Space>", "<C-n>")
kset("i", "<Tab>", function()
    return vim.fn.pumvisible() == 1 and [[<C-n>]] or [[<Tab>]]
end, { expr = true })
kset("i", "<S-Tab>", function()
    return vim.fn.pumvisible() == 1 and [[<C-p>]] or [[<S-Tab>]]
end, { expr = true })
