ua <<EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' > ',
        color_devicons = true,
        prompt_position = 'top',
        sorting_strategy = 'ascending',

        _previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        use_less = true,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
         override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
EOF


"telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fof <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fp :lua require('telescope.builtin').git_files()<CR>

nnoremap <leader>pl <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

nnoremap <leader>bf :lua require('telescope.builtin').buffers()<CR>

"lsp builtin
nnoremap <leader>ds <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>ws <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
nnoremap <leader>dd <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
nnoremap <leader>wd <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>

nnoremap <leader>pgs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>pgc <cmd>lua require('telescope.builtin').git_branches()<cr>

nnoremap <leader>pts <cmd>lua require('telescope.builtin').treesitter()<cr>

"nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles()<CR>
"nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
"nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
"nnoremap <leader>gc :lua require('theprimeagen.telescope').git_branches()<CR>

