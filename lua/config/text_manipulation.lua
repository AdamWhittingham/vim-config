-- Setup surround
require("yanky").setup({
  picker = {
    select = { action = nil },
    telescope = { mappings = nil },
  },
  ring = {
    history_length = 20,
    storage = "shada",
    sync_with_numbered_registers = false,
    cancel_event = "update",
  },
})

-- Setup better text objects and motions
require('mini.ai').setup()
require('mini.align').setup()
require('mini.surround').setup({
  highlight_duration = 1000,
  mappings = {
    add = 'ca', -- Add surrounding in Normal and Visual modes
    delete = 'ds', -- Delete surrounding
    find = '', -- Find surrounding (to the right)
    find_left = '', -- Find surrounding (to the left)
    highlight = 'hs', -- Highlight surrounding
    replace = 'cs', -- Replace surrounding
    update_n_lines = '', -- Update `n_lines`

    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
  },
})
require('mini.trailspace').setup()
