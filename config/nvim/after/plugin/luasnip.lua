local luasnip = require 'luasnip'
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

require("luasnip.loaders.from_vscode").lazy_load()
luasnip.filetype_extend("vue", { "vue" })

-- For changing choices in choiceNodes (not strictly necessary for a basic setup).
vim.keymap.set({ "i", "s" }, "<C-E>",
    function() return luasnip.choice_active() and '<Plug>luasnip-next-choice' or '<C-E>' end,
    { silent = true, expr = true })

ls.add_snippets("proto", {
    s("jn", {
        t("[json_name = \""),
        i(1),
        t("\"];"),
    }, {
        key = "proto",
    })
})

ls.add_snippets("all", {
    s("cfgportpillar", {
        t("INTERNAL_SERVER_LISTEN_ADDR=:0")
    }),
    s("cfgporthttp", {
        t("APP_SERVER_LISTEN_ADDR=:8080")
    }),
    s("cfgportgrpc", {
        t("APP_GRPC_SERVER_LISTEN_ADDR=:8980")
    }),
},{
    key = "all",
})
