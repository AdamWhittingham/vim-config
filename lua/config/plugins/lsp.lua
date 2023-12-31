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
      ensure_installed = require('config.lsp').servers
      automatic_installation = true
    end
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'nvim-navic',
      'cmp-nvim-lsp',
      "b0o/schemastore.nvim",
    },
    config = function()
      require("config.lsp").setup()
    end
  },

  -- Pop up function definitions when typing a function call
  {
    "ray-x/lsp_signature.nvim",
    opts = {
      bind = true,
      doc_lines = 5,
      max_height = 6,
      max_width = 60,
      hint_prefix = " ",
      hi_parameter = "lspsignatureactiveparameter",
      floating_window = false,
    },
    event = "VeryLazy",
  },

  -- Better UI around renames and LSP diagnistics
  {
    "nvimdev/lspsaga.nvim",
    event = "BufRead",
    opts = {
      lightbulb = { enable = false },
      symbol_in_winbar = { enable = false },
      finder = {
        keys = {
          expand_or_jump = "<cr>"
        },
      },
    }

  },

  { 'j-hui/fidget.nvim', config = true,  tag = 'legacy' },        -- Show LSP progress feedback
}
