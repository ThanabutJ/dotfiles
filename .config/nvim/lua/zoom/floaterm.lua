local kset = vim.keymap.set

vim.g.floaterm_height = 0.7
vim.g.floaterm_width = 0.8


kset("n", "<F9>", ":FloatermToggle main<cr><C-\\><C-n>:FloatermUpdate --wintype=split --height=0.4<cr>")
kset("t", "<F9>", "<C-\\><C-n>:FloatermToggle<cr>")
-- "nnoremap  "<F8>" :FloatermToggle main<cr><C-\><C-n>:FloatermUpdate --wintype=float position=center --height=1 --width=1<cr>
kset("n", "<F8>", ":FloatermToggle<cr>")
kset("t", "<F8>", "<C-\\><C-n>:FloatermToggle<cr>")
kset("n", "<F11>", ":FloatermHide!<cr>")
kset("t", "<F11>", "<C-\\><C-n>:FloatermHide!<cr>")
-- "nnoremap  "<F12>" :FloatermNew --wintype=split --height=0.4 --name=bot<cr>
kset("n", "<F3>", ":FloatermPrev<CR>")
kset("t", "<F3>", "<C-\\><C-n>:FloatermPrev<CR>")
kset("n", "<F4>", ":FloatermNext<CR>")
kset("t", "<F4>", "<C-\\><C-n>:FloatermNext<CR>")
kset("t", "<F7>", "<C-\\><C-n>:FloatermKill<CR>")
kset("n", "<leader>tg", ":FloatermNew --height=0.9 --width=0.8 --autoclose=2 --autohide=2 --name=lg lazygit<cr>")
kset("n", "<leader>td",
    ":FloatermNew --height=0.9 --width=0.8 --autoclose=2 --autohide=2 --name=ld cd ../.. ; lazydocker<cr>")
