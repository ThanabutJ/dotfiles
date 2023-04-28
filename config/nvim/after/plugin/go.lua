local nmap = require("zoom.keymap").nmap

vim.opt.autowrite = true

-- Auto formatting and importing
vim.g.go_fmt_autosave = 1

-- Auto linting
vim.g.go_metalinter_autosave = 0

--vim.g.go_fmt_command = "goimports"

-- disable vim-go :GoDef short cut (gd)
-- this is handled by LanguageClient [LC]
vim.g.go_def_mapping_enabled = 0

-- Specifies whether `gopls` should run staticcheck checks.
vim.g.go_gopls_staticcheck = nil

-- Status line types/signatures
vim.g.go_auto_type_info = 1

-- disable using K for godoc
vim.g.go_doc_keywordprg_enabled = 0

vim.g.go_doc_popup_window = 1

local group = vim.api.nvim_create_augroup(
    "gokeymap", { clear = true }
)

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "*.go",
    callback = function()
        nmap("<leader><leader>t", "<Plug>(go-test)")
        nmap("<leader><leader>K", "<Plug>(go-doc)")
        nmap("<leader><leader>b", "<Plug>(go-build)")
        nmap("<leader><leader>gg ", "<Plug>(go-generate)")
        nmap("<leader><leader>r", "<Plug>(go-run)")
        nmap("<leader><leader>fm", "GoFmt<CR>")
        nmap("<leader><leader>at", ":GoAddTags")
        nmap("<leader><leader>i", ":GoImports<CR>")
        nmap("<leader><leader>C", "<Plug>(go-coverage-toggle)")
        nmap("<leader><leader>fs", ":GoFillStruct<CR>")
        nmap("<leader><leader>ie", ":GoIfErr<CR>")
        nmap("<leader><leader>id", ":GoSameIdsToggle<CR>")
        nmap("<leader><leader><Tab>", ":GoAlternate<CR>")
        nmap("<leader><leader>a", ":vsp<CR>:GoAlternate<CR>")
        nmap("<leader><leader>l", ":GoLint<CR>")

        nmap("<leader><leader>dd", ":GoDebugStart")
        nmap("<leader><leader>ds", "<Plug>(go-debug-stop)")
        nmap("<F10>", "<Plug>(go-debug-breakpoint)")
        nmap("<F5>", "<Plug>(go-debug-continue)")
        nmap("<F11>", "<Plug>(go-debug-step)")

        nmap("<leader><leader>gtt", ":GoTest<CR>")
        nmap("<leader>gtf", ":GoTestFunc<CR>")
        nmap("<leader><leader>gta", ":GoTestAll<CR>")
    end,
})
