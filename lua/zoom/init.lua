require("zoom.lsp")
require("zoom.telescope")
require("zoom.luasnip")
require("zoom.compe")
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
