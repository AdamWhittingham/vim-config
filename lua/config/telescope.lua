local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {},
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
    }
  }
}

require('telescope').load_extension('textcase')
require('telescope').load_extension('fzf')
require("telescope").load_extension("yank_history")
