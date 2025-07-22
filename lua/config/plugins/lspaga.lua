return {
  'nvimdev/lspsaga.nvim',
  opts = {
    symbol_in_winbar = { enable = false },
    lightbulb = { enable = false },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  }
}
