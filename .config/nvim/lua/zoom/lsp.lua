-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  local builtin =  require('telescope.builtin')
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', builtin.lsp_type_definitions, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  gopls = {},
  -- pyright = {},
  rust_analyzer = {},
  tsserver = {},

  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

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

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- lspconfig.texlab.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.rust_analyzer.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.java_language_server.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.tsserver.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.gopls.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.vimls.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.bashls.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.clangd.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.jsonls.setup({
-- 	commands = {
-- 		Format = {
-- 			function()
-- 				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
-- 			end,
-- 		},
-- 	},
-- 	capabilities = capabilities,
-- })
-- lspconfig.pyright.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.cssls.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.emmet_ls.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.sqlls.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.tailwindcss.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.vuels.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.graphql.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.html.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.eslint.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.dockerls.setup({
-- 	capabilities = capabilities,
-- })
-- lspconfig.yamlls.setup({
-- 	settings = {
-- 		yaml = {
-- 			schemas = {
-- 				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
-- 				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
-- 			},
-- 		},
-- 	},
-- })
-- lspconfig.elmls.setup({
-- 	capabilities = capabilities,
-- 	filetypes = { "elm", "ELM" },
--     root_dir = lspconfig.util.root_pattern("elm.json"),
-- })
-- lspconfig.hls.setup({
-- 	capabilities = capabilities,
-- 	filetypes = { "HASKELL", "haskell", "lhaskell" },
-- 	cmd = { "haskell-language-server-wrapper", "--lsp" },
-- 	single_file_support = true,
-- })
-- 
-- local system_name
-- if vim.fn.has("mac") == 1 then
-- 	system_name = "macOS"
-- elseif vim.fn.has("unix") == 1 then
-- 	system_name = "Linux"
-- elseif vim.fn.has("win32") == 1 then
-- 	system_name = "Windows"
-- else
-- 	print("Unsupported system for sumneko")
-- end
-- 
-- -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- --local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
-- local sumneko_root_path = vim.fn.expand("$SUMNEKO_ROOT_PATH")
-- local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"
-- --print("root_path", sumneko_root_path)
-- --print("binary", sumneko_binary)
-- 
-- --require'lspconfig'.sumneko_lua.setup{ on_attach=on_attach }
-- 
-- lspconfig.sumneko_lua.setup({
-- 	-- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- 				version = "LuaJIT",
-- 				-- Setup your lua path
-- 				path = vim.split(package.path, ";"),
-- 			},
-- 			diagnostics = {
-- 				-- Get the language server to recognize the `vim` global
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
-- 				},
-- 			},
-- 			-- Do not send telemetry data containing a randomized but unique identifier
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- 	capabilities = capabilities,
-- })
