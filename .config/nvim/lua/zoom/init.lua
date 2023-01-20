require("zoom.set")
require("zoom.let")
require("zoom.remap")
require("zoom.packer")
require("zoom.telescope")
require("zoom.telescope_keymap")
require("zoom.lsp")
require("zoom.lsp-keymap")
require("zoom.galaxyline")
require("zoom.treesitter")
require("zoom.nvim-cmp")
require("zoom.floaterm")
require("zoom.nvim-cmp")
require("zoom.lf")
require("zoom.go")
require("zoom.symbols-outline")

require("terminal").setup()

require("colorizer").setup()

require('nvim_comment').setup()

P = function(v)
	print(vim.inspect(v))
	return v
end

if pcall(require, "plenary") then
	RELOAD = require("plenary.reload").reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end
