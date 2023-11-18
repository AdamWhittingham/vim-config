local surround_config = {
  mappings = {
    add = 'ys',
    delete = 'ds',
    find = '',
    find_left = '',
    highlight = '',
    replace = 'cs',
    update_n_lines = '',

    -- Add this only if you don't want to use extended mappings
    suffix_last = '',
    suffix_next = '',
  },
  search_method = 'cover_or_next',
}

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
    require('mini.surround').setup(surround_config)
    require('mini.trailspace').setup()
  end
}
