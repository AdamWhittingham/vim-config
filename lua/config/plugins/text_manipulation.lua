return {
  "AndrewRadev/switch.vim",              -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  "johmsalas/text-case.nvim",            -- Smartcase replacement with S
  "lukas-reineke/indent-blankline.nvim", -- Show indentation markers
  "gbprod/yanky.nvim",                   -- Paste previously yanked content
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false }
  },
}
