return {
  {
    "AdamWhittingham/vim-adcode-theme",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme adCode]]) end,
  },

  -- Telescope plus the plugins that make it faster
  { 'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "sharkdp/fd",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim" ,
    },
  },


  -- Show git diff in the gutter
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- show code hierarchy of item under cursor
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      separator = " » ",
    }
  },

   -- Show colour swatches in virtualtext
    {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
        mode = "virtualtext",
      }
    }
  },

  -- File operatons using a Vim buffer
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { 'mbbill/undotree' },                                                      -- Visualise the undo tree and make it easy to navigate
  { "folke/which-key.nvim", lazy = false, config = true },                    -- Help learn/relearn/remember key bindings with a handy pop up
  { "akinsho/git-conflict.nvim", config = true },                             -- Bindings to speed up choosing ours/theres when resolving diffs
  { "kevinhwang91/nvim-bqf", ft = "qf" },                                     -- Better Quickfix formatting
}
