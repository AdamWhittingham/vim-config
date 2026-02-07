return {
  {
    "AdamWhittingham/vim-adcode-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme adCode")
      vim.api.nvim_set_option_value("background", "dark", {})
      vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]]) -- transparent background
    end
  },

  -- Lovely colorschemes with reasonable light mode options
  {
    'folke/tokyonight.nvim',
    event = "VeryLazy",
  },

  {
    "NTBBloodbath/sweetie.nvim",
    event = "VeryLazy",
  },

  -- Help learn/relearn/remember key bindings with a handy pop up
  {
    "folke/which-key.nvim",
    lazy = false,
    opts = {
      notify = false,
    },
  },

  -- Show colour swatches in virtualtext
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      render = "virtual",
      virtual_symbol_position = "eol",
      virtual_symbol_prefix = '',
      virtual_symbol_suffix = '',
    }
  },

  -- File operatons using a Vim buffer
  {
    'stevearc/oil.nvim',
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view_options = {
        show_hidden = true,
      }
    }
  },

  -- Bindings to speed up choosing ours/theres when resolving diffs
  {
    "akinsho/git-conflict.nvim",
    config = true,
    event = "VeryLazy",
    opts = {
      default_mappings = false,
      default_commands = true,
      disable_diagnostics = true,
      highlights = {
        incoming = 'DiffText',
        current = 'DiffAdd',
      }
    }
  },

  -- Better Quickfix formatting
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  {
    "sphamba/smear-cursor.nvim",
    opts = { enabled = false },
  }
}
