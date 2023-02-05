return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        local ls = require("luasnip")
        ls.filetype_extend("ruby", {"rails"})

        require("luasnip.loaders.from_vscode").lazy_load({
          paths = { './snippets' }
        })
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = require("cmp").mapping.confirm { select = false },
    },
  },

}
