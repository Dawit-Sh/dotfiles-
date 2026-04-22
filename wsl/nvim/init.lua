require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.autocommands"
require "user.undotree"
require "user.colorscheme"
require "user.cmp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.autotag"
require "user.comment"
require "user.mason"
require "nvim-tree".setup()
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.illuminate"
require "user.indentline"
require "user.alpha"
require "user.lsp"
require "user.dap"
require "user.formatter"
require "user.prettier"
require "user.null_ls"
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
  if vim.lsp.config then
    pcall(vim.lsp.config, name, {})
    config = vim.lsp.config[name]
  end

  if config and type(config.setup) == "function" then
    return config
  end

  local ok_configs, configs = pcall(require, "lspconfig.configs")
  if ok_configs and type(configs) == "table" then
    local ok_direct, direct = pcall(require, "lspconfig.configs." .. name)
    if ok_direct and type(direct) == "table" then
      configs[name] = direct
      config = configs[name]
    else
      config = configs[name]
    end
  end

  return config
end

local function setup_server(name, opts)
  local srv = ensure_server(name)
  if not srv then
    return
  end
  srv.setup(opts)
end

setup_server("clangd", {})
setup_server("svelte", {})
require("nvim-surround").setup()
-- require bug fixes (Optional)
require "user.fixes"
