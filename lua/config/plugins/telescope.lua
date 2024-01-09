local options = function()
  local telescope = require('telescope')
  telescope.load_extension('textcase')
  telescope.load_extension('fzf')
  telescope.load_extension("yank_history")
  telescope.load_extension("ui-select")
  telescope.load_extension("textcase")

  local lga_actions = require("telescope-live-grep-args.actions")

  return {
    defaults = {
      mappings = {
        i = {
          ["<C-h>"] = "which_key"
        }
      }
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        layout_strategy='vertical',
        layout_config={
          width={0.75, min=80, max=120},
          height=0.80,
          mirror=true,
          prompt_position="top",
        }
      },
      grep_files = {
        theme = "dropdown",
        layout_strategy='flex',
        layout_config={
          width={0.75, min=80, max=120},
          height=0.80,
          mirror=true,
          prompt_position="top",
        }
      },
      buffers = { theme = "ivy" },
      jumplist = {theme = "dropdown" },
    },
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
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
        },
      },
    },
  }
end

-- Telescope plus the plugins that make it faster
return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "sharkdp/fd",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-dap.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim" ,
    'nvim-telescope/telescope-ui-select.nvim',
    "johmsalas/text-case.nvim",
  },
  opts = options,
}
