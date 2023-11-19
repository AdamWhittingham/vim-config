local lsp_signature_opts = {
  bind = true,
  doc_lines = 5,
  max_height = 6,
  max_width = 60,
  hint_prefix = " ",
  hi_parameter = "lspsignatureactiveparameter",
  floating_window = false,
}

local lsp_saga_opts = {
  lightbulb = { enable = false },
  symbol_in_winbar = { enable = false },
  finder = {
    keys = {
      expand_or_jump = "<cr>"
    },
  },
}

return {
  {
    "williamboman/mason.nvim", -- Install Language servers
    event = "VeryLazy",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim", -- Configure language servers
    event = "VeryLazy",
    opts = function()
      ensure_installed = require('config.language_servers')
    end
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'nvim-navic',
      'cmp-nvim-lsp',
    },
    config = function()
      require("config.lsp")
    end
  },

  -- Pop up function definitions when typing a function call
  {
    "ray-x/lsp_signature.nvim",
    opts = lsp_signature_opts,
    event = "VeryLazy",
  },

  -- Better UI around renames and LSP diagnistics
  {
    "nvimdev/lspsaga.nvim",
    event = "BufRead",
    opts = lsp_saga_opts,
  },

  { 'j-hui/fidget.nvim', config = true,  tag = 'legacy' },        -- Show LSP progress feedback

  -- Treesitter
  -- Syntax parsing and highlighting
  {
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

  -- Show details of treesitter and highlighting
  {
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
}
