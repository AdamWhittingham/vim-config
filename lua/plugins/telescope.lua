return {
  { 'nvim-telescope/telescope.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "sharkdp/fd",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim" ,
    },
    config = function()
      require('telescope').load_extension('textcase')
      require('telescope').load_extension('fzf')
      require("telescope").load_extension("yank_history")

      return {
        defaults = {
          mappings = {
            i = { ["<C-h>"] = "which_key" }
          }
        },
        pickers = {},
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            -- override_generic_sorter = true,  -- override the generic sorter
            -- override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          }
        }
      }
    end
  }
}
