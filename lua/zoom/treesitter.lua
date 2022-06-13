-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.org = {
--   install_info = {
--     url = 'https://github.com/milisims/tree-sitter-org',
--     revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
--     files = {'src/parser.c', 'src/scanner.cc'},
--   },
--   filetype %?= 'org',
-- }
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?"
        }
    },
    highlight = {
        enable = true
        -- disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
        -- additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            node_decremental = "grm",
            scope_incremental = "grc"
        }
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        --    lint_events = {"BufWrite", "CursorHold"},
        lint_events = {"BufWrite"}
    },
    indent = {enable = true, disable = {"yaml"}},
    rainbow = {
        enable = false,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}
