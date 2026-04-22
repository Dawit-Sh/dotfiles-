local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

local function install_parsers()
  local install = require("nvim-treesitter.install")
  install.ensure_installed({
    "lua", "vim", "vimdoc", "markdown", "markdown_inline",
    "bash", "rust", "python", "css", "javascript", "typescript",
    "tsx", "jsx", "html", "json", "yaml", "toml", "sql",
    "go", "gomod", "comment", "jq", "svelte", "tsx", "vue",
  })
end

vim.defer_fn(function()
  pcall(install_parsers)
end, 100)

configs.setup {
  ensure_installed = {
    "lua", "vim", "vimdoc", "markdown", "markdown_inline",
    "bash", "rust", "python", "css", "javascript", "typescript",
    "tsx", "jsx", "html", "json", "yaml", "toml", "sql",
    "go", "gomod", "comment", "jq", "svelte", "vue",
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  autopairs = { enable = true },
  context_commentstring = { enable = true },
}