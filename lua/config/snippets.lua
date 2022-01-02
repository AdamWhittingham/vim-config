-- Snippets are integrated via CMP in autocomplete.lua

local ls = require("luasnip")
ls.filetype_extend("ruby", {"rails"})

require("luasnip.loaders.from_vscode").lazy_load({
  paths = { vim.fn.stdpath('config') .. '/snippets', }
})
