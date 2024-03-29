local lspkind = require "lspkind"

-- Setup nvim-cmp.
local cmp = require "cmp"

cmp.setup(
    {
        snippet = {
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end
        },
        mapping = {
            ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
            ["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
            ["<Down>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
            ["<Up>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
            ["<C-y>"] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
            ["<C-e>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            ["<ESC>"] = cmp.mapping(
                {
                    i = cmp.mapping.close(),
                    n = cmp.mapping.close()
                }
            ),
            ["<CR>"] = cmp.mapping.confirm(
                {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                }
            )
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "nvim_lua"},
                -- { name = 'vsnip' }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
                {name = "path"},
                {name = "buffer"},
                {name = "orgmode"}
            }
        ),
        formatting = {
            format = lspkind.cmp_format {
                with_text = true,
                menu = {
                    buffer = "[buf]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[api]",
                    path = "[path]",
                    luasnip = "[snip]"
                }
            }
        },
        experimental = {
            native_menu = false,
            ghost_text = true
        },
        completion = {
            keyword_length = 3
        }
    }
)

-- Use buffer source for `/`.
cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"}
        }
    }
)

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)
