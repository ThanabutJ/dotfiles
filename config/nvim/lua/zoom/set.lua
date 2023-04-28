local opt = vim.opt
local g = vim.g

g.mapleader = " "

opt.guicursor = ""

opt.hidden = true
opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.hlsearch = false
opt.incsearch = true
opt.smartindent = true

opt.wrap = false
opt.swapfile = false
opt.backup = false

opt.termguicolors = true

opt.showmode = false

--Give more space for displaying messages.
opt.cmdheight=2

--Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
--delays and poor user experience.
opt.updatetime=50

--Don't pass messages to |ins-completion-menu|.
opt.shortmess:append("c")

opt.mouse="a"

opt.splitbelow = true
opt.splitright = true

opt.timeoutlen=1000
opt.ttimeoutlen=5

opt.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
