return {
  {
    "esmuellert/codediff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
    opts = {
      -- Highlight configuration
      highlights = {
        -- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
        line_insert = "DiffAdd",      -- Line-level insertions
        line_delete = "DiffDelete",   -- Line-level deletions

        -- Character-level: accepts highlight group names or hex colors
        -- If specified, these override char_brightness calculation
        char_insert = nil,            -- Character-level insertions (nil = auto-derive)
        char_delete = nil,            -- Character-level deletions (nil = auto-derive)

        -- Brightness multiplier (only used when char_insert/char_delete are nil)
        -- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
        char_brightness = nil,        -- Auto-adjust based on your colorscheme

        -- Conflict sign highlights (for merge conflict views)
        -- Accepts highlight group names or hex colors (e.g., "#f0883e")
        -- nil = use default fallback chain
        conflict_sign = nil,          -- Unresolved: DiagnosticSignWarn -> #f0883e
        conflict_sign_resolved = nil, -- Resolved: Comment -> #6e7681
        conflict_sign_accepted = nil, -- Accepted: GitSignsAdd -> DiagnosticSignOk -> #3fb950
        conflict_sign_rejected = nil, -- Rejected: GitSignsDelete -> DiagnosticSignError -> #f85149
      },

      -- Diff view behavior
      diff = {
        disable_inlay_hints = true,         -- Disable inlay hints in diff windows for cleaner view
        max_computation_time_ms = 5000,     -- Maximum time for diff computation (VSCode default)
        hide_merge_artifacts = false,       -- Hide merge tool temp files (*.orig, *.BACKUP.*, *.BASE.*, *.LOCAL.*, *.REMOTE.*)
        original_position = "left",         -- Position of original (old) content: "left" or "right"
        conflict_ours_position = "right",   -- Position of ours (:2) in conflict view: "left" or "right"
        cycle_next_hunk = true,             -- Wrap around when navigating hunks (]c/[c): false to stop at first/last
      },

      -- Explorer panel configuration
      explorer = {
        position = "left",  -- "left" or "bottom"
        width = 40,         -- Width when position is "left" (columns)
        height = 15,        -- Height when position is "bottom" (lines)
        indent_markers = true,  -- Show indent markers in tree view (│, ├, └)
        initial_focus = "explorer",  -- Initial focus: "explorer", "original", or "modified"
        icons = {
          folder_closed = "",  -- Nerd Font folder icon (customize as needed)
          folder_open = "",    -- Nerd Font folder-open icon
        },
        view_mode = "list",    -- "list" or "tree"
        file_filter = {
          ignore = {},  -- Glob patterns to hide (e.g., {"*.lock", "dist/*"})
        },
      },

      -- History panel configuration (for :CodeDiff history)
      history = {
        position = "bottom",  -- "left" or "bottom" (default: bottom)
        width = 40,           -- Width when position is "left" (columns)
        height = 15,          -- Height when position is "bottom" (lines)
        initial_focus = "history",  -- Initial focus: "history", "original", or "modified"
        view_mode = "list",   -- "list" or "tree" for files under commits
      },

      -- Keymaps in diff view
      keymaps = {
        view = {
          quit = "q",                    -- Close diff tab
          toggle_explorer = "<leader>b",  -- Toggle explorer visibility (explorer mode only)
          next_hunk = "]c",   -- Jump to next change
          prev_hunk = "[c",   -- Jump to previous change
          next_file = "]f",   -- Next file in explorer/history mode
          prev_file = "[f",   -- Previous file in explorer/history mode
          diff_get = "do",    -- Get change from other buffer (like vimdiff)
          diff_put = "dp",    -- Put change to other buffer (like vimdiff)
          open_in_prev_tab = "gf", -- Open current buffer in previous tab (or create one before)
          toggle_stage = "-", -- Stage/unstage current file (works in explorer and diff buffers)
        },
        explorer = {
          select = "<CR>",    -- Open diff for selected file
          hover = "K",        -- Show file diff preview
          refresh = "R",      -- Refresh git status
          toggle_view_mode = "i",  -- Toggle between 'list' and 'tree' views
          stage_all = "S",    -- Stage all files
          unstage_all = "U",  -- Unstage all files
          restore = "X",      -- Discard changes (restore file)
        },
        history = {
          select = "<CR>",    -- Select commit/file or toggle expand
          toggle_view_mode = "i",  -- Toggle between 'list' and 'tree' views
        },
        conflict = {
          accept_incoming = "<leader>ct",  -- Accept incoming (theirs/left) change
          accept_current = "<leader>co",   -- Accept current (ours/right) change
          accept_both = "<leader>cb",      -- Accept both changes (incoming first)
          discard = "<leader>cx",          -- Discard both, keep base
          next_conflict = "]x",            -- Jump to next conflict
          prev_conflict = "[x",            -- Jump to previous conflict
          diffget_incoming = "2do",        -- Get hunk from incoming (left/theirs) buffer
          diffget_current = "3do",         -- Get hunk from current (right/ours) buffer
        },
      },
    },
  }
}
