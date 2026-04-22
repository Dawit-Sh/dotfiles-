local status_ok, ntags = pcall(require, "nvim-ts-autotag")
if not status_ok then
  return
end

local configs_ok, configs = pcall(require, "nvim-treesitter.config")
if not configs_ok then
  configs_ok, configs = pcall(require, "nvim-treesitter.configs")
  if not configs_ok then
    return
  end
end

configs.setup {
  autotag = {
    enable = true,
    filetypes = { "html" , "xml" },
  }
}
