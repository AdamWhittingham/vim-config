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
require('mini.surround').setup()
require('mini.pairs').setup()
