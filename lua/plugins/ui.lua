return {
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

  { 'mbbill/undotree', cmd = "UndotreeToggle" },                                                          -- Visualise the undo tree and make it easy to navigate
  { -- Show git diff in the gutter
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
  },
  { -- Show color swatches whenever a color code shows up
  "DarwinSenior/nvim-colorizer.lua",                                          -- Fork of colorizer with VirtualText
    lazy = false,
  },
  {
    "feline-nvim/feline.nvim",
    lazy = false,
    opts = require("config.statusline"),
    dependencies = {
      "nvim-navic"
    }
  },                                                  -- Quick and nice statusline
  { "folke/which-key.nvim", lazy = true, config = true },                     -- Help learn/relearn/remember key bindings with a handy pop up
  { "akinsho/git-conflict.nvim" },                                            -- Bindings to speed up choosing ours/theres when resolving diffs
  { "kevinhwang91/nvim-bqf", ft = "qf" },                                     -- Better Quickfix formatting
  { 'nvim-telescope/telescope.nvim',                                          -- Telescope plus the plugins that make it faster
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "sharkdp/fd",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim" ,
    },
  },
  { -- Show indentation markers
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    opts = {
      show_current_context = true,
      show_current_context_start = false,
      use_treesitter = true,
      show_first_indent_level = false,
    }
  }
}
