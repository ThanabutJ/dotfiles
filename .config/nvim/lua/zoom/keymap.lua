local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vmap = bind("v", {noremap = false})
M.vnoremap = bind("v")
M.xmap = bind("x", {noremap = false})
M.xnoremap = bind("x")
M.imap = bind("i", {noremap = false})
M.inoremap = bind("i")
M.tnoremap = bind("t", {noremap = false})

return M
