return {
  -- A bright colorscheme for bright engineers
  {
    "AdamWhittingham/vim-adcode-theme",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme adCode]]) end,
  },

  -- Lovely colorscheme with a reasonable light mode option
  {
    'folke/tokyonight.nvim',
    lazy = true,
  },

  -- Help learn/relearn/remember key bindings with a handy pop up
  {
    "folke/which-key.nvim",
    lazy = false,
    config = true,
  },

   -- Show colour swatches in virtualtext
    {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
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
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true
  },

  -- Visualise the undo tree and make it easy to navigate
  {
    'mbbill/undotree',
    event = "VeryLazy",
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

  {
    'sindrets/diffview.nvim'
  },

  -- Better Quickfix formatting
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },


  -- Show indentation markers
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "▏",
        tab_char = " ",
      },
      scope = {
        enabled = true,
        exclude = {
           node_type = { ruby = { "module", "class" } },
        }
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
        },
      },
    },
  },
}
