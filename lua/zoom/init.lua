require("zoom.lsp")
require("zoom.telescope")
--require("zoom.luasnip")
--require("zoom.compe")
require("zoom.nvim-cmp")
require("zoom.treesitter")
require("zoom.lspsaga")
require("zoom.galaxyline")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

require'terminal'.setup()

require"colorizer".setup()

require('Comment').setup()

require('orgmode').setup({
  org_agenda_files = {'~/orgs/*'},
  org_default_notes_file = '~/orgs/captures.org',
})
