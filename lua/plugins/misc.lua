return {
  --------------------
  -- PLUGIN MANAGEMENT
  --------------------
  "nvim-lua/plenary.nvim",   -- Useful lua functions used ny lots of plugins
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
          add = 'ca',          -- Add surrounding in Normal and Visual modes
          delete = 'ds',       -- Delete surrounding
          find = '',           -- Find surrounding (to the right)
          find_left = '',      -- Find surrounding (to the left)
          highlight = 'hs',    -- Highlight surrounding
          replace = 'cs',      -- Replace surrounding
          update_n_lines = '', -- Update `n_lines`

          suffix_last = 'l',   -- Suffix to search with "prev" method
          suffix_next = 'n',   -- Suffix to search with "next" method
        },
      })
    end
  },

  --------------------
  -- TEXT MANIPULATION
  --------------------
  "AndrewRadev/switch.vim",              -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  "AndrewRadev/splitjoin.vim",           -- Quickly toggle between single and multi-line versions of common constructs
  "johmsalas/text-case.nvim",            -- Smartcase replacement with S
  "lukas-reineke/indent-blankline.nvim", -- Show indentation markers
  { "gbprod/yanky.nvim", lazy = true},   -- Paste previously yanked content
  "tpope/vim-sleuth",                    -- Detect tab and space settings from existing content

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
  { "folke/which-key.nvim", lazy = true, config = true },                     -- Help learn/relearn/remember key bindings with a handy pop up
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
      "nvim-telescope/telescope-live-grep-args.nvim" ,
    },
  },

  -------------------
  -- LANGUAGE SUPPORT
  -------------------
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
  { "uga-rosa/translate.nvim", lazy = true },                -- Easily call Google Translate and replace in-editor
  { "marcelofern/vale.nvim", lazy = true, ft = "markdown" }, -- Use Vale for prose linting
}

