return {
  -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  {
    "AndrewRadev/switch.vim",
  },

  -- Expand/Contract logical structures to/from multiple lines
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false },
    event = "VeryLazy"
  },

  -- Nice case switching
  {
    "johmsalas/text-case.nvim",
    event = "VeryLazy",
    config = function()
      require("textcase").setup({
        default_keymappings_enabled = false,
      })
    end,
    cmd = {
      "Subs",
      "TextCaseStartReplacingCommand",
    },
  },
}
