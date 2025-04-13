local fn = vim.fn

-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Autocommand that reloads neovim whenever you save the plugins.lua file
--vim.cmd [[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--  augroup end
--]]


-- Install your plugins here
require('lazy').setup({
  -- My plugins here
  'nvimdev/lspsaga.nvim',
  'mfussenegger/nvim-lint',
  'folke/neodev.nvim',
  'nvim-lua/plenary.nvim', -- Useful lua functions used by lots of plugins
  'windwp/nvim-autopairs', -- Autopairs, integrates with both cmp and treesitter
  'numToStr/Comment.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  'akinsho/bufferline.nvim',
  'moll/vim-bbye',
  'nvim-lualine/lualine.nvim',
  'akinsho/toggleterm.nvim',
  'ahmedkhalf/project.nvim',
  'goolord/alpha-nvim',
  'windwp/nvim-ts-autotag',
  'mbbill/undotree',
  'ray-x/lsp_signature.nvim',
  { 'wakatime/vim-wakatime', lazy = false },



  -- Colorschemes
  'catppuccin/nvim',
  'EdenEast/nightfox.nvim',
  'folke/tokyonight.nvim',
  'lunarvim/darkplus.nvim',
  'ellisonleao/gruvbox.nvim',
  'rebelot/kanagawa.nvim',
  'Mofiqul/dracula.nvim',
  'nvim-tree/nvim-web-devicons',
  'datsfilipe/vesper.nvim',

  -- cmp plugins
  'hrsh7th/nvim-cmp',         -- The completion plugin
  'hrsh7th/cmp-buffer',       -- buffer completions
  'hrsh7th/cmp-path',         -- path completions
  'saadparwaiz1/cmp_luasnip', -- snippet completions
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',

  -- snippets
  'L3MON4D3/LuaSnip',             --snippet engine
  'rafamadriz/friendly-snippets', -- a bunch of snippets to

  -- LSP
  --  { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to  language server installer
  'neovim/nvim-lspconfig', -- enable LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'jose-elias-alvarez/null-ls.nvim', -- for formatters and linters
  'RRethy/vim-illuminate',
  'mhartington/formatter.nvim',

  -- Telescope
  'nvim-telescope/telescope.nvim',

  -- Treesitter
  'nvim-treesitter/nvim-treesitter',

  -- Git
  'lewis6991/gitsigns.nvim',
  'f-person/git-blame.nvim',

  -- DAP
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'ravenxrz/DAPInstall.nvim',

  -- language
  'ianks/vim-tsx',
  'pangloss/vim-javascript',
  'peitalin/vim-jsx-typescript',
  'leafgarland/typescript-vim',
  'styled-components/vim-styled-components',
  { 'neoclide/coc.nvim',     branch = 'release' },
  'josa42/coc-go',
  'pantharshit00/coc-prisma',
  'prisma/vim-prisma',
  'dart-lang/dart-vim-plugin',
  'thosakwe/vim-flutter',
  'natebosch/vim-lsc',
  'natebosch/vim-lsc-dart',
  { "ellisonleao/glow.nvim", config = function() require("glow").setup() end },
  'othree/html5.vim',
  'evanleck/vim-svelte',
  'leafOfTree/vim-svelte-plugin',

  -- java and spring
  'mfussenegger/nvim-jdtls',
  'folke/trouble.nvim',

  -- transparency
  'xiyaowong/transparent.nvim',

  -- linting
  'MunifTanjim/prettier.nvim',
  'MunifTanjim/eslint.nvim',
  'elentok/format-on-save.nvim',

  -- refactoring
  'nvim-pack/nvim-spectre',

  -- Writing
  {
    "junegunn/goyo.vim",
    config = function()
      vim.cmd([[
      function! s:goyo_enter()
        set linebreak
        set spell spelllang=en_us
      endfunction

      function! s:goyo_leave()
        set nolinebreak
        set nospell
      endfunction

      autocmd! User GoyoLeave nested call <SID>goyo_leave()
      autocmd! User GoyoEnter nested call <SID>goyo_enter()
    ]])
    end,
  },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- Vim surround
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  -- file management
  {
    'stevearc/oil.nvim',
    config = function() require('oil').setup() end
  },
})
