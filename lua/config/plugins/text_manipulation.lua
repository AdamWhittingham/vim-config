return {
  -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  {
    "AndrewRadev/switch.vim",
    event = "BufEnter"
  },
  --
  -- Smartcase replacement with S
  {"johmsalas/text-case.nvim",
    event = "BufEnter"
  },

  -- Show indentation markers
  {"lukas-reineke/indent-blankline.nvim",
    event = "BufEnter"
  },

  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false },
    event = "BufEnter"
  },
}
