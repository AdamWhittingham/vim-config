return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup()
    require('mini.align').setup()
    require('mini.bracketed').setup({
      comment    = { suffix = '#', options = {} },-- default 'c' clashes with next/prex change
      oldfile    = { suffix = '', options = {} }, -- disable oldfiles to keep o free for future use
      yank       = { suffix = '', options = {} }, -- disable yank as Yanky does a more complete job
    })
    require('mini.comment').setup()
    require('mini.cursorword').setup()
    require('mini.jump').setup()
    require('mini.trailspace').setup()
  end
}
