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

local ai_opts = function()
  local ai = require("mini.ai")
  return {
    n_lines = 500,
    custom_textobjects = {
      o = ai.gen_spec.treesitter({
        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
      }, {}),
      f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
      c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
      t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
    },
  }
end

return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup({opts = ai_opts})
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
