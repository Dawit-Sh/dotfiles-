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
require "lspconfig".clangd.setup {}
require "lspconfig".svelte.setup {}
require("nvim-surround").setup()
-- require bug fixes (Optional)
require "user.fixes"
