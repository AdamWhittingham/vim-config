return {
  {
    "AdamWhittingham/vim-adcode-theme",                                       -- A bright colorscheme
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme adCode]]) end,
  },
  'mbbill/undotree',                                                          -- Visualise the undo tree and make it easy to navigate
  { "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },  -- Show git diff in the gutter

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

  { -- Quick and nice statusline
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function () require('config.statusline') end,
  },
  { "folke/which-key.nvim", lazy = false, config = true },                    -- Help learn/relearn/remember key bindings with a handy pop up
  { "akinsho/git-conflict.nvim", config = true },                             -- Bindings to speed up choosing ours/theres when resolving diffs
  { "kevinhwang91/nvim-bqf", ft = "qf" },                                     -- Better Quickfix formatting
  { 'nvim-telescope/telescope.nvim',                                          -- Telescope plus the plugins that make it faster
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
}
