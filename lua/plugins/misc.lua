return {
  --------------------
  -- PLUGIN MANAGEMENT
  --------------------
  "nvim-lua/plenary.nvim",   -- Useful lua functions used ny lots of plugins
  "kyazdani42/nvim-web-devicons", -- Instantly make everything nicer with NerdFont icons
  -- Collection of small, focussed plugins
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function ()
      require('mini.ai').setup()
      require('mini.comment').setup()
      require('mini.align').setup()
      require('mini.surround').setup({
        highlight_duration = 1000,
        mappings = {
          add = 'as',          -- Add surrounding in Normal and Visual modes
          replace = 'cs',      -- Replace surrounding
          delete = 'ds',       -- Delete surrounding
          find = '',           -- Find surrounding (to the right)
          find_left = '',      -- Find surrounding (to the left)
          highlight = 'hs',    -- Highlight surrounding
          update_n_lines = '', -- Update `n_lines`

          suffix_last = 'l',   -- Suffix to search with "prev" method
          suffix_next = 'n',   -- Suffix to search with "next" method
        },
      })
    end
  },

  -------------------
  -- Navigation
  -------------------
  "tpope/vim-projectionist",                     -- Map tools and actions based on the project
  { "christoomey/vim-tmux-navigator", lazy = false },              -- Seemless movement between panes and tmux
  "AdamWhittingham/vim-copy-filename",           -- Quick shortcuts for copying the file name, path and/or line number
  "ruanyl/vim-gh-line",                          -- Generate and copy the github/gitlab repo URL for the current line

  -------------------
  -- Miscellaneous
  -------------------
  { "uga-rosa/translate.nvim", lazy = true },                -- Easily call Google Translate and replace in-editor
  { "marcelofern/vale.nvim", lazy = true, ft = "markdown" }, -- Use Vale for prose linting
}

