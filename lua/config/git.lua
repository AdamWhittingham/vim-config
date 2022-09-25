local bar = '▐'

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = bar, numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = bar, numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = bar, numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = bar, numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = bar, numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,   -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false,  -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false,  -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false,   -- Toggle with `:Gitsigns toggle_word_diff`

  keymaps = {
    -- Default keymap options
    noremap = true,

    -- Text objects
    ['o ic'] = ':<C-U>Gitsigns select_hunk<CR>',
    ['x ic'] = ':<C-U>Gitsigns select_hunk<CR>'
  },
  watch_gitdir = {
    interval = 500,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 0,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

require("diffview").setup({
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  view = {
    merge_tool = {
      layout = "diff3_horizontal",
      disable_diagnostics = true,   -- Temporarily disable diagnostics for conflict buffers while in the view.
    },
  },
})
