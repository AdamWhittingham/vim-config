-- Setup surround
require("nvim-surround").setup({})

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

require('textcase').setup {}
