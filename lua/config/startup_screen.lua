local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local layout = require("alpha.themes.startify")
local startify = require "alpha.themes.startify"

layout.section.header.val = {
  [[__      __            ]],
  [[\ \    / (_)          ]],
  [[ \ \  / / _ _ __ ___  ]],
  [[  \ \/ / | | `_ ` _ \ ]],
  [[   \  /  | | | | | | |]],
  [[    \/   |_|_| |_| |_|]],
  [[                      ]],
}

layout.section.top_buttons.val = { }

local cwd = vim.fn.getcwd()

-- disable MRU
layout.section.mru.val = { { type = "padding", val = 0 } }
layout.section.mru_cwd.val = {
  {
    type = "text",
    val = "Recent files in ".. cwd,
    opts = { hl = "SpecialComment", shrink_margin = false },
  },
  { type = "padding", val = 1 },
  {
    type = "group",
    val = function()
      return { startify.mru(1, cwd, 9) }
    end,
    opts = { shrink_margin = false },
  },
}

layout.section.bottom_buttons.val = {
  { type = "padding", val = 1 },
  { type = "text", val = "---------", opts = { hl = "SpecialComment" } },
  { type = "padding", val = 1 },
  layout.button("f", "  Find file", ":Telescope find_files <CR>"),
  layout.button("F", "  Find text", ":Telescope live_grep <CR>"),
  layout.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  layout.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  layout.button( "q", "  Quit NVIM" , ":qa<CR>"),
}
layout.section.footer = {
  { type = "text", val = "footer" },
}

alpha.setup(layout.opts)
