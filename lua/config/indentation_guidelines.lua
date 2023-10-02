local exclude_buffer_types = { "terminal", "nofile" }
local exclude_filetypes = {
  "alpha",
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
}

require("ibl").setup {
  exclude = {
    filetypes = exclude_filetypes,
    buftypes = exclude_buffer_types,
  }
}
