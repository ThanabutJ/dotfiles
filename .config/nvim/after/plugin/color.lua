vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.opt.background = "dark"

local set_hl = vim.api.nvim_set_hl

local quickScope = vim.api.nvim_create_namespace('quickscope')
set_hl(quickScope, 'QuickScopePrimary', {fg='#afff5f', underline=true, ctermfg=155, cterm=underline})
set_hl(quickScope, 'QuickScopeSecondary', {fg='#5fffff', underline=true, ctermfg=81, cterm=underline})

vim.cmd("colorscheme tokyonight-storm")

set_hl(0, 'ColorColumn', {ctermbg=0, bg='gray'})
set_hl(0, 'Normal', {bg='none'})
set_hl(0, 'SignColumn', {bg='none'})
set_hl(0, 'CursorLineNR', {bg='none'})
    -- highlight ColorColumn ctermbg=0 guibg=grey
    -- hi SignColumn guibg=none
    -- hi CursorLineNR guibg=None
    -- highlight Normal guibg=none
    -- " highlight LineNr guifg=#ff8659
    -- " highlight LineNr guifg=#aed75f
    -- highlight LineNr guifg=#5eacd3
    -- highlight netrwDir guifg=#5eacd3
    -- highlight qfFileName guifg=#aed75f
    -- hi TelescopeBorder guifg=#5eacd

-- vim.cmd("colorscheme gruvbox")
