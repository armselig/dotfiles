-- LSP CONFIG

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "html", "cssls", "ts_ls", "eslint", "vue_ls", "lua_ls" },
	automatic_enable = true,
})

-- deprecated
-- local lspconfig = require('lspconfig')
local mason_registry = require("mason-registry")

-- Common on_attach function for LSP servers
local on_attach = function(client, bufnr)
	-- Enable completion, formatting, etc.
	-- You might have more extensive keybindings or autocommands here
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- Add keybindings for LSP features
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

--- Stops a server from formatting so Prettier (via conform) is the only formatter.
--- ts_ls and vue_ls ignore the project's Prettier config, and conform's LSP
--- fallback would otherwise let them reformat files on save.
local disable_formatting = function(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

-- Capabilities for nvim-cmp integration
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities = cmp_nvim_lsp.default_capabilities()

-- Get the path to the Vue Language Server installed by Mason
-- mason_registry.get_package() throws if the package name is unknown, so use pcall
local vue_language_server_path
local ok, vue_ls_pkg = pcall(mason_registry.get_package, "vue-language-server")
if ok and vue_ls_pkg:is_installed() and vue_ls_pkg.get_install_path then
	vue_language_server_path = vue_ls_pkg:get_install_path() .. "/node_modules/@vue/language-server"
else
	vue_language_server_path = vim.fn.stdpath("data")
		.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
end

-- 1. TypeScript Language Server (ts_ls) configuration
-- lspconfig.ts_ls.setup({
vim.lsp.config("ts_ls", {
	on_attach = on_attach,
	on_init = disable_formatting,
	capabilities = capabilities,
	filetypes = {
		"typescript",
		"javascript",
		"javascriptreact",
		"typescriptreact",
		"vue", -- Important: Add 'vue' filetype here
	},
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
			},
		},
	},
})

-- 2. Vue Language Server (vue_ls) configuration
-- vue_ls handles the HTML and CSS parts of Vue files.
-- Keep lspconfig's default on_init: it forwards vue_ls' TypeScript requests to ts_ls.
local default_vue_ls_on_init = vim.lsp.config.vue_ls.on_init
vim.lsp.config("vue_ls", {
	on_attach = on_attach,
	on_init = function(client, init_result)
		if default_vue_ls_on_init then
			default_vue_ls_on_init(client, init_result)
		end
		disable_formatting(client)
	end,
	capabilities = capabilities,
	filetypes = { "vue" },
	init_options = {
		vue = {
			hybridMode = false, -- Set to false to let tsserver handle TypeScript in Vue files
		},
	},
})

-- 3. ESLint configuration
-- Keep lspconfig's default on_attach: it creates the LspEslintFixAll command.
local default_eslint_on_attach = vim.lsp.config.eslint.on_attach

--- Runs `eslint --fix` on save for buffers ESLint is attached to.
--- Repos usually use eslint-plugin-prettier, so this applies the same autofixes
--- as the pre-commit hook. The autocmd is created after conform's format_on_save
--- autocmd, so it runs after Prettier.
local fix_eslint_on_save = function(client, bufnr)
	if default_eslint_on_attach then
		default_eslint_on_attach(client, bufnr)
	end
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = vim.api.nvim_create_augroup("EslintFixOnSave_" .. bufnr, { clear = true }),
		buffer = bufnr,
		command = "LspEslintFixAll",
	})
end

vim.lsp.config("eslint", {
	on_attach = fix_eslint_on_save,
})

-- global lsp configs
-- vim.lsp.config('*', {
--     -- any custom settings...
-- })

-- autocomplete
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = cmp.mapping.preset.insert({
		-- Navigate between completion items
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = "select" }),

		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		-- Scroll up and down in the completion documentation
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
})
