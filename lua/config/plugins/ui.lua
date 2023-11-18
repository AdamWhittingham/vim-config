return {
  {
    "AdamWhittingham/vim-adcode-theme",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme adCode]]) end,
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
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true
  },

  { 'mbbill/undotree' },                                                      -- Visualise the undo tree and make it easy to navigate
  { "folke/which-key.nvim", lazy = false, config = true },                    -- Help learn/relearn/remember key bindings with a handy pop up
  { "akinsho/git-conflict.nvim", config = true },                             -- Bindings to speed up choosing ours/theres when resolving diffs
  { "kevinhwang91/nvim-bqf", ft = "qf" },                                     -- Better Quickfix formatting
}
