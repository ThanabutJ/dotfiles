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
--require("lspconfig").vuels.setup({
--	capabilities = capabilities,
--})
require'lspconfig'.volar.setup({
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
require("lspconfig").elmls.setup({
	capabilities = capabilities,
})
require("lspconfig").hls.setup({
	capabilities = capabilities,
	filetypes = { "HASKELL", "haskell", "lhaskell" },
	cmd = { "haskell-language-server-wrapper", "--lsp" },
	single_file_support = true,
})
require('lspconfig').bufls.setup({
	capabilities = capabilities,
})
require('lspconfig').svelte.setup({
	capabilities = capabilities,
})
require('lspconfig').lua_ls.setup({
	capabilities = capabilities,
})
