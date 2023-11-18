return {
  "nvim-lua/plenary.nvim",   -- Useful lua functions used ny lots of plugins
  'echasnovski/mini.nvim',   -- Collection of small, focussed plugins
  {
    "AdamWhittingham/vim-adcode-theme",                                       -- A bright colorscheme
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme adCode]]) end,
  },

  -------------------
  -- LANGUAGE SUPPORT
  -------------------
  {
    "williamboman/mason.nvim", -- Install Language servers
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },
  {
    "williamboman/mason-lspconfig.nvim", -- Configure language servers
    "neovim/nvim-lspconfig",
  },
  "ray-x/lsp_signature.nvim",                     -- Pop up function definitions when typing a function call
  { "nvimdev/lspsaga.nvim", event = "BufRead" } , -- Better UI around renames and LSP diagnistics
  { 'j-hui/fidget.nvim', config = true,  tag = 'legacy' },        -- Show LSP progress feedback

  -- Treesitter
  { -- Syntax parsing and highlighting
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = require "config.treesitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    }
  },

  {-- Show details of treesitter and highlighting
    "nvim-treesitter/playground",
    lazy = true,
    cmd = "TSPlaygroundToggle",
  },
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
  { -- Generate and copy the github/gitlab repo URL for the current line
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = { mapping = nil }
  },

  -------------------
  -- Miscellaneous
  -------------------
  { "uga-rosa/translate.nvim" },                -- Easily call Google Translate and replace in-editor
  { -- Use Vale for prose linting
    "marcelofern/vale.nvim",
    lazy = true,
    ft = "markdown",
    config = function(_, _)
      require("vale").setup({
        bin="/usr/local/bin/vale",
        vale_config_path="$HOME/.adshell/vale/vale.ini",
      })
    end
  },
  'folke/tokyonight.nvim'
}
