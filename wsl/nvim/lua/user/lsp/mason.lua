local servers = {
	"cssls",
	"html",
	"tsserver",
	"bashls",
	"jsonls",
  "clangd",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

if vim.lsp.config == nil then
	return
end

local lazy_loader = nil
local loader_ok, loader = pcall(require, "lazy.core.loader")
if loader_ok then
	lazy_loader = loader
	lazy_loader.load("nvim-lspconfig")
end

local function ensure_server(name)
	if lazy_loader then
		lazy_loader.load("nvim-lspconfig")
	end

	local config = nil
	local ok, lspconfig_lib = pcall(require, "lspconfig")
	if ok and type(lspconfig_lib) == "table" then
		config = lspconfig_lib[name]
	end

	if not config and vim.lsp.config then
		pcall(vim.lsp.config, name, {})
		config = vim.lsp.config[name]
	end

	if not config then
		local ok2, direct = pcall(require, "lspconfig.configs." .. name)
		if ok2 then
			config = direct
		end
	end

	if not config then
		vim.notify("LSP config not found for: " .. name, vim.log.levels.WARN)
		return nil
	end

	return config
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	local srv = ensure_server(server)
	if srv then
		srv.setup(opts)
	end
end
