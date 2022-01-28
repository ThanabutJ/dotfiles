--local on_attach = require'completion'.on_attach

--local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

require("lspconfig").texlab.setup({
	capabilities = capabilities,
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
})
require("lspconfig").java_language_server.setup({
	capabilities = capabilities,
})
require("lspconfig").tsserver.setup({
	capabilities = capabilities,
})
require("lspconfig").gopls.setup({
	capabilities = capabilities,
})
require("lspconfig").vimls.setup({
	capabilities = capabilities,
})
require("lspconfig").bashls.setup({
	capabilities = capabilities,
})
require("lspconfig").clangd.setup({
	capabilities = capabilities,
})
require("lspconfig").jsonls.setup({
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end,
		},
	},
	capabilities = capabilities,
})
require("lspconfig").pyright.setup({
	capabilities = capabilities,
})
require("lspconfig").cssls.setup({
	capabilities = capabilities,
})
require("lspconfig").emmet_ls.setup({
	capabilities = capabilities,
})
require("lspconfig").sqlls.setup({
	capabilities = capabilities,
})
require("lspconfig").tailwindcss.setup({
	capabilities = capabilities,
})
require("lspconfig").vuels.setup({
	capabilities = capabilities,
})
require("lspconfig").graphql.setup({
	capabilities = capabilities,
})
require("lspconfig").html.setup({
	capabilities = capabilities,
})
require("lspconfig").eslint.setup({
	capabilities = capabilities,
})
require("lspconfig").dockerls.setup({
	capabilities = capabilities,
})
require("lspconfig").elmls.setup({
	capabilities = capabilities,
})
require("lspconfig").yamlls.setup({
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
			},
		},
	},
})
require("lspconfig").hls.setup({
	capabilities = capabilities,
	filetypes = { "HASKELL", "haskell", "lhaskell" },
	cmd = { "haskell-language-server-wrapper", "--lsp" },
	single_file_support = true,
})

local system_name
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	system_name = "Windows"
else
	print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
--local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_root_path = vim.fn.expand("$SUMNEKO_ROOT_PATH")
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"
--print("root_path", sumneko_root_path)
--print("binary", sumneko_binary)

--require'lspconfig'.sumneko_lua.setup{ on_attach=on_attach }

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	capabilities = capabilities,
})
