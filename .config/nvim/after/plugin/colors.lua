function ColorMyPencils(color) 
    color = color  or "tokyonight-night"
    vim.cmd.colorscheme (color)
    vim.opt.background = "dark"

    local set_hl = vim.api.nvim_set_hl

    vim.g.tokyonight_transparent_sidebar = true
    vim.g.tokyonight_transparent = true
    set_hl(0, 'ColorColumn', {ctermbg=0, bg='gray'})
    set_hl(0, 'Normal', {bg='none'})
    set_hl(0, 'SignColumn', {bg='none'})
    set_hl(0, 'CursorLineNR', {bg='none'})
    set_hl(0, "Normal", { bg = "none"})
    set_hl(0, "NormalFloat", { bg = "none"})
    set_hl(0, "NormalNC", { bg = "none"})

    local quickScope = vim.api.nvim_create_namespace('quickscope')
    set_hl(quickScope, 'QuickScopePrimary', {fg='#afff5f', underline=true, ctermfg=155, cterm=underline})
    set_hl(quickScope, 'QuickScopeSecondary', {fg='#5fffff', underline=true, ctermfg=81, cterm=underline})
end

ColorMyPencils()
