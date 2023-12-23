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
      ensure_installed = require('config.lsp').servers
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
      require("config.lsp").setup()
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
}
