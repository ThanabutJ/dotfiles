require("zoom.lsp")
require("zoom.telescope")
--require("zoom.luasnip")
--require("zoom.compe")
require("zoom.nvim-cmp")
require("zoom.treesitter")
require("zoom.lspsaga")
require("zoom.galaxyline")
-- require("zoom.yode")

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

require("terminal").setup()

require("colorizer").setup()

-- require("Comment").setup()
require('nvim_comment').setup()

require("orgmode").setup_ts_grammar({
	org_agenda_files = { "~/orgs/*" },
	org_default_notes_file = "~/orgs/captures.org",
})
require("orgmode").setup_ts_grammar()

-- TODO move this to it own file
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = false,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {},
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
})

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if null_ls_status_ok then
	local formatting = null_ls.builtins.formatting
	null_ls.setup({
		sources = {
			formatting.stylua,
			formatting.elm_format,
			formatting.eslint,
			formatting.stylelint,
			formatting.json_tool,
			formatting.markdownlint,
			-- null_ls.builtins.diagnostics.eslint,
			-- null_ls.builtins.completion.spell,
		},
	})
end
