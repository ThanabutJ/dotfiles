local luasnip = require 'luasnip'

require("luasnip.loaders.from_vscode").lazy_load()
luasnip.filetype_extend("vue", { "vue" })

-- For changing choices in choiceNodes (not strictly necessary for a basic setup).
vim.keymap.set({ "i", "s" }, "<C-E>",
    function() return luasnip.choice_active() and '<Plug>luasnip-next-choice' or '<C-E>' end,
    { silent = true, expr = true })
