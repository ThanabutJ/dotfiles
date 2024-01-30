local nmap = require("zoom.keymap").nmap
local nnoremap = require("zoom.keymap").nnoremap
local vmap = require("zoom.keymap").vmap
local vnoremap = require("zoom.keymap").vnoremap
local imap = require("zoom.keymap").imap
local inoremap = require("zoom.keymap").inoremap
local tnoremap = require("zoom.keymap").tnoremap

nnoremap("tt", ":tab split<CR>")
nnoremap("<leader>h", "<C-w>h")
nnoremap("<leader>l", "<C-w>l")

nnoremap("<leader>gs", ":G<CR>")

vmap("<C-c>", "\"+yi")
vmap("<C-x>", "\"+c")
vmap("<C-v>", "c<ESC>\"+p")
imap("<C-v>", "<C-r><C-o>+")

-- Number 1: Moving text
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '>-2<CR>gv=gv")
inoremap("<C-j>", "<esc>:m .+1<CR>==")
inoremap("<C-k>", "<esc>:m .-2<CR>==")

-- Number 2: Jumplist mutations
local function relativeJump(key)
    return function()
        local prefix = ''
        if vim.v.count > 5 then
            prefix = "m'" .. vim.v.count
        end
        return prefix .. key
    end
end

nnoremap("j", relativeJump("j"), { expr = true })
nnoremap("k", relativeJump("k"), { expr = true })

-- Number 3: Undo break points
inoremap(",", ",<c-g>u")
inoremap(".", ".<c-g>u")
inoremap("!", "!<c-g>u")
inoremap("?", "?<c-g>u")

-- Number 4: Keeping it centered
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

-- prime top 5 remap
-- Number 5: Behave vim
nnoremap("Y", "y$")

nnoremap("<leader><leader>f", ":Neoformat<CR>")
nnoremap("<leader>F", function() vim.lsp.buf.format({ async = true }) end)

nnoremap("<leader>v", "<cmd>vsp<CR>")

nnoremap("<leader><leader>/", ":filetype detect<cr>")
nmap("<leader><leader>'", ":set filetype=")

tnoremap("<C-q>", "<C-\\><C-n>", { silent = true })
nnoremap("<leader><TAB>", "<C-^>")

nnoremap("<C-w><", "<C-w>10<")
nnoremap("<C-w>>", "<C-w>10>")

nnoremap("<C-j>", ":cnext<CR>zzzv")
nnoremap("<C-k>", ":cprevious<CR>zzzv")
nnoremap("<leader>j", ":lnext<CR>zzzv")
nnoremap("<leader>k", ":lprevious<CR>zzzv")

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>Y", "gg\"+yG")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

nmap("<leader>gj", ":diffget //3<CR>")
nmap("<leader>gf", ":diffget //2<CR>")
nmap("<leader>gs", ":G<CR>")
nnoremap("<leader>gb", ":G blame<CR>")

nnoremap("<leader>cb", ":!echo % | pbcopy<CR>")
