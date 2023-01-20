local lspconfig = require('lspconfig')
--local on_attach = require'completion'.on_attach

--local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

lspconfig.texlab.setup({
	capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
})
lspconfig.java_language_server.setup({
	capabilities = capabilities,
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
})
lspconfig.gopls.setup({
	capabilities = capabilities,
})
lspconfig.vimls.setup({
	capabilities = capabilities,
})
lspconfig.bashls.setup({
	capabilities = capabilities,
})
lspconfig.clangd.setup({
	capabilities = capabilities,
})
lspconfig.jsonls.setup({
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end,
		},
	},
	capabilities = capabilities,
})
lspconfig.pyright.setup({
	capabilities = capabilities,
})
lspconfig.cssls.setup({
	capabilities = capabilities,
})
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
})
lspconfig.sqlls.setup({
	capabilities = capabilities,
})
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
})
lspconfig.vuels.setup({
	capabilities = capabilities,
})
lspconfig.graphql.setup({
	capabilities = capabilities,
})
lspconfig.html.setup({
	capabilities = capabilities,
})
lspconfig.eslint.setup({
	capabilities = capabilities,
})
lspconfig.dockerls.setup({
	capabilities = capabilities,
})
lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
			},
		},
	},
})
lspconfig.elmls.setup({
	capabilities = capabilities,
	filetypes = { "elm", "ELM" },
    root_dir = lspconfig.util.root_pattern("elm.json"),
})
lspconfig.hls.setup({
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

lspconfig.sumneko_lua.setup({
	-- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
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
