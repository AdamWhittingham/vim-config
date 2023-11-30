return {
  -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  {
    "AndrewRadev/switch.vim",
    event = "VeryLazy"
  },
  --
  -- Smartcase replacement with S
  {"johmsalas/text-case.nvim",
    event = "VeryLazy"
  },

  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false },
    event = "VeryLazy"
  },
}
