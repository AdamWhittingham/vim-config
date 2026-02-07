return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        formats = {
          key = function(item)
            return { { item.key, hl = "key" } }
          end,
        },
        preset ={
          header = require('config.dash_headers').random_header(),
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Recent Files", section = "recent_files", cwd = true, indent = 2, padding = 1, limit = 9 },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      explorer = { enabled = true },
      indent = {
        enabled = true,
        animate = {
          enabled = false,
        },
        scope = {
          hl = "IblScope",
        }
      },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = {
        enabled = true,
        animate = {
          duration = { step = 10, total = 150 },
          easing = "outQuad",
        },
      },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  }
}
