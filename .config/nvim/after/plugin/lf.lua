--remove lf default mapping
vim.g.lf_map_keys = 0
--open lf when vim opens a directory
vim.g.lf_replace_netrw = 1
vim.g.lf_command_override = 'lf -command "set hidden"'

local nnoremap = require("zoom.keymap").nnoremap

nnoremap( "<leader>fmf", ":Lf<CR>")
nnoremap( "<leader>fmw", ":LfWorkingDirectory<CR>")
nnoremap( "<leader>fmd", ":LfCurrentDirectory<CR>")
nnoremap(  "<leader>fxp", ":FloatermNew --height=0.9 --width=0.8 --autoclose=2 --autohide=2 --name=nextjs_page lf pages<cr>")
