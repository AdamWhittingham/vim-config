-- Install Lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "plugins.lua",
  command = "Lazy sync",
  desc = "Update plugins",
})

local plugins = {
  --------------------
  -- PLUGIN MANAGEMENT
  --------------------
  "nvim-lua/plenary.nvim",   -- Useful lua functions used ny lots of plugins
  'echasnovski/mini.nvim',   -- Collection of small, focussed plugins

  --------------------
  -- TEXT MANIPULATION
  --------------------
  "AndrewRadev/switch.vim",              -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  "AndrewRadev/splitjoin.vim",           -- Quickly toggle between single and multi-line versions of common constructs
  "johmsalas/text-case.nvim",            -- Smartcase replacement with S
  "lukas-reineke/indent-blankline.nvim", -- Show indentation markers
  "gbprod/yanky.nvim",                   -- Paste previously yanked content
  "tpope/vim-sleuth",                    -- Detect tab and space settings from existing content

  -------------------
  -- AUTOCOMPLETION
  -------------------
  "windwp/nvim-autopairs",     -- Autopairs, integrates with both cmp and treesitter
  'windwp/nvim-ts-autotag',    -- Auto close HTML and XML tags too

  -- cmp plugins
  "hrsh7th/nvim-cmp",          -- Completion engine
  "hrsh7th/cmp-buffer",        -- buffer completions
  "hrsh7th/cmp-path",          -- path completions
  "hrsh7th/cmp-cmdline",       -- cmdline completions
  "saadparwaiz1/cmp_luasnip",  -- snippet completions
  "hrsh7th/cmp-nvim-lsp",      -- LSP based completions
  'andersevenrud/cmp-tmux',    -- tmux completions
  'octaltree/cmp-look',        -- dictionary completions

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -------------------
  -- UI
  -------------------
  {
    "AdamWhittingham/vim-adcode-theme",                                       -- A bright colorscheme
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme adCode]]) end,
  },
  {
    "goolord/alpha-nvim",                                                     -- Excellent start screen framework
    lazy = true,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
  'mbbill/undotree',                                                          -- Visualise the undo tree and make it easy to navigate
  { "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },  -- Show git diff in the gutter
  "DarwinSenior/nvim-colorizer.lua",                                          -- Fork of colorizer with VirtualText
  "feline-nvim/feline.nvim",                                                  -- Quick and nice statusline
  { "folke/which-key.nvim", lazy = true },                                    -- Help learn/relearn/remember key bindings with a handy pop up
  { "SmiteshP/nvim-navic", dependencies = "neovim/nvim-lspconfig" },          -- show code hierarchy of item under cursor
  { "akinsho/git-conflict.nvim" },                                            -- Bindings to speed up choosing ours/theres when resolving diffs
  { "kevinhwang91/nvim-bqf", ft = "qf" },                                     -- Better Quickfix formatting
  { 'nvim-telescope/telescope.nvim',                                          -- Telescope plus the plugins that make it faster
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "sharkdp/fd",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-dap.nvim",
    },
  },

  -------------------
  -- LANGUAGE SUPPORT
  -------------------
  {
    "williamboman/mason.nvim",                   -- Install and configure Language Servers
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  "ray-x/lsp_signature.nvim",                    -- Pop up function definitions when typing a function call
  "gpanders/editorconfig.nvim",                  -- Obey editorconfig files
  { "glepnir/lspsaga.nvim", branch = "main", },  -- Better UI around renames and LSP diagnistics

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", }, -- Syntax parsing and highlighting
  { "nvim-treesitter/nvim-treesitter-textobjects", -- Define text objects based on Treesitter
    dependencies = { "nvim-treesitter"},
  },
  "nvim-treesitter/playground",                  -- Show details of treesitter and highlighting
  "andymass/vim-matchup",                       -- Extend % for more languages

  -- Debugging
  "mfussenegger/nvim-dap",                       -- Debug Anything Protocol bindings
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },   -- Lovely UI for DAP output
  "theHamsta/nvim-dap-virtual-text",             -- Show debug values in virtual text
  "leoluz/nvim-dap-go",                          -- Bindings for Delve, the go debugger
  "suketa/nvim-dap-ruby",                        -- Bindings for ruby-debug

  -------------------
  -- Navigation
  -------------------
  "tpope/vim-projectionist",                     -- Map tools and actions based on the project
  "christoomey/vim-tmux-navigator",              -- Seemless movement between panes and tmux
  "AdamWhittingham/vim-copy-filename",           -- Quick shortcuts for copying the file name, path and/or line number
  "ruanyl/vim-gh-line",                          -- Generate and copy the github/gitlab repo URL for the current line

  -------------------
  -- Miscellaneous
  -------------------
  "uga-rosa/translate.nvim",                     -- Easily call Google Translate and replace in-editor
  { "marcelofern/vale.nvim", lazy = true, ft = "markdown" }, -- Use Vale for prose linting
}

local options = {
  defaults = { lazy = false },
  install = { colorscheme = { "adCode", "habamax" } },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

require("lazy").setup(plugins, options)
