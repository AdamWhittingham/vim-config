local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
local startify = require "alpha.themes.startify"
local cwd = vim.fn.getcwd()

local header = {
  type = "text",
  val = {
    [[__      __            ]],
    [[\ \    / (_)          ]],
    [[ \ \  / / _ _ __ ___  ]],
    [[  \ \/ / | | `_ ` _ \ ]],
    [[   \  /  | | | | | | |]],
    [[    \/   |_|_| |_| |_|]],
    [[                      ]],
  },
  opts = {
    position = "center",
    hl = "Type",
  },
}

local section_mru = {
  type = "group",
  val = {
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
}

local buttons = {
  type = "group",
  val = {
    { type = "padding", val = 1 },
    { type = "text", val = "Quick links", opts = { hl = "SpecialComment" } },
    { type = "padding", val = 1 },
    startify.button("f", "  Find file", ":Telescope find_files <CR>"),
    startify.button("F", "  Find text", ":Telescope live_grep <CR>"),
    startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    startify.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    startify.button( "u", "  Update plugins" , ":PackerSync<CR>"),
    startify.button( "q", "  Quit" , ":qa<CR>"),
  }
}

local opts = {
    layout = {
        { type = "padding", val = 2 },
        header,
        { type = "padding", val = 2 },
        section_mru,
        { type = "padding", val = 2 },
        buttons,
    },
    opts = {
        margin = 5,
    },
}

alpha.setup(opts)
