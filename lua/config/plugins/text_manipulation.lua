return {
  -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  {
    "AndrewRadev/switch.vim",
  },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false },
    event = "VeryLazy"
  },
}
