local nnoremap = require("zoom.keymap").nnoremap
local vmap = require("zoom.keymap").vmap
local vnoremap = require("zoom.keymap").vnoremap
local imap = require("zoom.keymap").imap
local inoremap = require("zoom.keymap").inoremap

nnoremap("tt", ":tab split<CR>")
nnoremap("<leader>h", "<C-w>h")
nnoremap("<leader>l", "<C-w>l")

nnoremap("<leader>gs", ":G<CR>")

vmap("<C-c>", "\"+yi")
vmap( "<C-x>", "\"+c")
vmap("<C-v>", "c<ESC>\"+p")
imap("<C-v>", "<C-r><C-o>+")

-- prime top 5 remap
-- Number 5: Behave vim
nnoremap("Y", "y$")

-- Number 1: Moving text
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '>-2<CR>gv=gv")
inoremap("<C-j>", "<esc>:m .+1<CR>==")
inoremap("<C-k>", "<esc>:m .-2<CR>==")

nnoremap("<leader><leader>f", ":Neoformat<CR>")
nnoremap("<leader>F", ":lua vim.lsp.buf.formatting()<CR>")

nnoremap("<leader>v", "<cmd>vsp<CR>")
