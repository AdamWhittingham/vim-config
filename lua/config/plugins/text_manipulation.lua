return {
  -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  {
    "AndrewRadev/switch.vim",
  },
  --
  -- Smartcase replacement with S
  {"johmsalas/text-case.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup({})
      require("telescope").load_extension("textcase")
    end,
  },

  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false },
    event = "VeryLazy"
  },
}
