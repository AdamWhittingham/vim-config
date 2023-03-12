-- Helper functions
local default_opts = { noremap = true, silent = true }

local bind_opts = function(opts)
  opts = opts or {}
  local out_opts = default_opts
  for k, v in pairs(opts) do out_opts[k] = v end
  return out_opts
end

local keymap = vim.api.nvim_set_keymap

local normal = function(keys, command, opts)
  keymap("n", keys, command .. "<CR>", bind_opts(opts))
end

local visual = function(keys, command, opts)
  keymap("v", keys, command, bind_opts(opts))
end

local cmd = function(command)
  return "<Esc><Cmd>"..command.."<CR>"
end

local luacmd = function(command)
  return "<Esc><Cmd>lua " .. command .. "<CR>"
end

local wk = require("which-key")

---------------------------------
-- Leader key = <space>
---------------------------------
keymap("", "<space>", "<Nop>", default_opts)

---------------------------------
-- Window/Tab/Buffer commands
---------------------------------
wk.register({
  w = {
    name = "Window/Writes",
    w = { cmd [[:w]], "Write" },
    e = { cmd [[:e]], "Reload" },
    q = { cmd [[:x]], "Write & Quit" },
    Q = { cmd [[:q!]], "Discard & Quit" },
    b = { cmd [[:bd]], "Close buffer"},
    t = { cmd [[:tabclose]], "Close tab"},
    s = { cmd [[:vsplit]], "Split vertically"},
    S = { cmd [[:split]], "Split horizontally"},
  },
}, { prefix = "<leader>" })

---------------------------------
-- Window splitting & movement
---------------------------------

-- Move between panes
normal("<C-h>", cmd[[TmuxNavigateLeft]], { desc = "Move to window left" })
normal("<C-l>", cmd[[TmuxNavigateRight]], { desc = "Move to window right" })
normal("<C-j>", cmd[[TmuxNavigateDown]], { desc = "Move to window below" })
normal("<C-k>", cmd[[TmuxNavigateUp]], { desc = "Move to window above" })

---------------------------------
-- Text navigation
---------------------------------

wk.register({
  j = { cmd [[:Telescope jumplist]], "Show Jumplist" },
  h = { cmd[[:nohlsearch]], "Toggle search highlight" },
  m = { cmd [[:Telescope marks]], "Show marks" },
  ["sw"] = { luacmd[[MiniTrailspace.trim()]], "Strip trailing whitespace"},
  ["sG"] = { luacmd[[MiniTrailspace.trim_last_lines()]], "Strip trailing empty lines"},
}, { prefix = "<leader>" })

wk.register({
  m = { set_mark, "Set mark"}
})

---------------------------------
-- Text manipulation
---------------------------------
wk.register({
  ['['] = {
    name = "Prev",
    ["<space>"] = { "O<Esc>j", "Add line above"},
    e = { ":m -2<cr>", "Move line up" },
    g = { "g;", "Edit" },
    p = { "<Plug>(YankyCycleForward)", "Swap to next paste" },
  },
  [']'] = {
    name = "Next",
    ["<space>"] = { "o<Esc>k", "Add line below" },
    e = { ":m +1<cr>", "Move line down" },
    g = { "g,", "Edit" },
    p = { "<Plug>(YankyCycleBackward)", "Swap to prev paste" },
  },
  p = {"<Plug>(YankyPutAfter)", "Paste" },
  P = {"<Plug>(YankyPutBefore)", "Paste before" },
})

-- Stay in indent mode
visual("<", "<gv", { desc = "Dedent selection" })
visual(">", ">gv", { desc = "Indent selection" })

-- OS Clipboard yank
normal("<leader>y", "\"+y", { desc = "Yank to clipboard" })
visual("<leader>y", "\"+y", { desc = "Yank to clipboard" })

wk.register({
  i = { "m`gg=G``", "Reindent file" }, -- Reindent the current file
  P = { cmd [[Telescope yank_history theme=dropdown]], "Show yank ring" } -- Yank ring setup
}, { prefix = "<leader>" })

wk.register({
  g = {
    J = { "Join lines" },
    b = { "Block comment {motion}" },
    c = { "Linewise comment {motion}" },
    C = {
      name = "Case conversions",
      U = { luacmd[[require('textcase').current_word('to_upper_case')]], "Convert to UPPER CASE" },
      u = { luacmd[[require('textcase').current_word('to_lower_case')]], "Convert to lower case" },
      C = { luacmd[[require('textcase').current_word('to_constant_case')]], "Convert to CONSTANT_CASE" },
      c = { luacmd[[require('textcase').current_word('to_camel_case')]], "Convert to CamelCase" },
      P = { luacmd[[require('textcase').current_word('to_pascal_case')]], "Convert to PascalCase" },
      t = { luacmd[[require('textcase').current_word('to_title_case')]], "Convert to Title Case" },
      p = { luacmd[[require('textcase').current_word('to_path_case')]], "Convert to path/case" },
      s = { luacmd[[require('textcase').current_word('to_phrase_case')]], "Convert to sentence case" },
      ['.']= { luacmd[[require('textcase').current_word('to_dot_case')]], "Convert to dot.case" },
      ['_']= { luacmd[[require('textcase').current_word('to_snake_case')]], "Convert to snake_case" },
      ['-']= { luacmd[[require('textcase').current_word('to_dash_case')]], "Convert to dash-case" },
    },
    t = { luacmd[[_G.translate()]], "Translate and replace"},
  },
  q = { "Record macro" },
})

wk.register({
  g = {
    t = { luacmd[[_G.translate()]], "Translate and replace"},
  },
}, { mode = "v"})

---------------------------------
-- Diffs & Versioning
---------------------------------
wk.register({
  ['['] = {
    name = "Prev",
    c = { cmd[[Gitsigns prev_hunk]], "Change"},
    x = { cmd[[GitConflictPrevConflict]], "Conflict" }
  },
  [']'] = {
    name = "Next",
    c = { cmd[[Gitsigns next_hunk]], "Change"},
    x = { cmd[[GitConflictNextConflict]], "Conflict" }
  }
})

wk.register({
  c = {
    name = "Changes",
    a = { cmd[[Gitsigns stage_hunk]],                               "Add change to stage" },
    A = { cmd[[Gitsigns stage_buffer]],                             "Add all changes in file" },
    u = { cmd[[Gitsigns reset_hunk]],                               "Undo change" },
    U = { cmd[[Gitsigns reset_buffer_index]],                       "Undo all changes in file" },
    d = { cmd[[Gitsigns preview_hunk]],                             "Diff change" },
    b = { cmd[[lua require"gitsigns".toggle_current_line_blame()]], "Toggle blame" },
    R = { cmd[[Gitsigns reset_buffer]],                             "Reset file" },
    o = { cmd[[GitConflictChooseOurs]],                             "Conflict: Choose Ours"},
    t = { cmd[[GitConflictChooseTheirs]],                           "Conflict: Choose Theirs"},
    B = { cmd[[GitConflictChooseBoth]],                             "Conflict: Choose Both"},
    N = { cmd[[GitConflictChooseNone]],                             "Conflict: Choose None"},
  },
  s = { "Split/join construct" },
  sp = { cmd[[:Telescope spell_suggest]], "Suggest spelling fixes" },
  u = { cmd[[:UndotreeToggle]], "Show the undo tree" },
}, { prefix = "<leader>" })

---------------------------------
-- File navigation
---------------------------------

wk.register({
  f = {cmd [[:Telescope find_files]], "Find files" },
  -- F = {cmd [[:Telescope live_grep]],  "Find in files" },
  F = { luacmd [[ require("telescope").extensions.live_grep_args.live_grep_args() ]], "Find in files" },
  G = {cmd [[:Telescope resume]],  "Show previous search" },
  ["*"] = {cmd [[:Telescope grep_string]], "Search for word" },
  ["."] = {cmd [[:Telescope buffers]], "Show buffers" },
  [" "] = { cmd [[:b#]], "Previous buffer" },
}, { prefix = "<leader>" })

---------------------------------
-- Language aware navigation
---------------------------------

-- LSP Tools
wk.register({
  l = {
    name = "Language tools",
    d = { luacmd [[_G.toggle_diagnostics()]],            "Toggle disagnostics" },
    l = { cmd [[LSoutlineToggle]],                       "Show LSP outline for file" },
    p = { cmd [[Lspsaga peek_definition]],               "Peek definition" },
    o = { cmd [[Lspsaga show_line_diagnostics]],         "Show line disagnostics" },
    r = { cmd [[Lspsaga rename]],                        "LSP Rename" },
    a = { cmd [[Lspsaga code_action]],                   "Show code actions" },
    k = { luacmd [[vim.lsp.buf.hover()]],                "Show hover" },
    K = { luacmd [[Lspsaga hover_doc]],                  "Show lspsaga hover" },
    f = { cmd [[lua vim.lsp.buf.formatting_seq_sync()]], "Format" },
    D = { cmd [[:Telescope diagnostics]],                "List diagnostics"},
    q = { luacmd [[vim.diagnostic.setloclist()]],        "Quickfix diagnostics" },
  },
  ["]"] = { cmd[[Lspsaga lsp_finder]],                 "Find references and definitions" },
  ["{"] = { cmd[[Lspsaga peek_definition]],            "Peek definition" },
}, { prefix = "<leader>" })

vim.keymap.set("n", "K", cmd[[Lspsaga hover_doc]], {desc = "Hover doc"})

wk.register({
  ['['] = {
    name = "Prev",
    d = { cmd[[Lspsaga diagnostic_jump_prev]], "Diagnostic"},
    D = { luacmd[[vim.diagnostic.goto_prev()]], "Diagnostic"},
  },
  [']'] = {
    name = "Next",
    d = { cmd[[Lspsaga diagnostic_jump_next]], "Diagnostic"},
    D = { luacmd[[vim.diagnostic.goto_next()]], "Diagnostic"},
  },
  ["<C-]>"] = { luacmd [[vim.lsp.buf.definition()]], "Jump to definition" }
})

---------------------------------
-- Test helpers
---------------------------------

-- Leader t/T to send the current file/line to rspec via tmux windows
-- Mapped per language in language_options

wk.register({
  p = {
    name = "Paths",
    g = { luacmd[[require"gitlinker".get_buf_range_url("n", {})]], "Copy the URL to github/gitlab"},
    r = { cmd[[:CopyRelativePath]], "Copy relative path" },
    a = { cmd[[:CopyAbsolutePath]], "Copy absolute path" },
    f = { cmd[[:CopyFileName]], "Copy file name" },
    d = { cmd[[:CopyDirectoryPath]], "Copy directory path" },
    l = { cmd[[:CopyRelativePathAndLine]], "Copy Relative path and line number" },
  }
}, { prefix = "<leader>" })

---------------------------------
-- Debugging
---------------------------------

wk.register({
  d = {
    name = "Debug",
    d = { luacmd "require'dap'.toggle_breakpoint()", "Toggle Breakpoint" },
    b = { luacmd "require'dap'.toggle_breakpoint()", "Toggle Breakpoint" },
    B = { luacmd("require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')"), "Conditional Breakpoint" },
    l = { cmd [[:Telescope dap list_breakpoints]], "Search breakpoints"},

    g = { luacmd("require'dap'.continue()"), "Start" },
    n = { luacmd("require'dap'.continue()"), "Continue to Next" },

    s = { luacmd("require'dap'.step_over()"), "Step Over" },
    i = { luacmd("require'dap'.step_in()"), "Step Into" },
    o = { luacmd("require'dap'.step_out()"), "Step Out" },

    q = { luacmd("require'dap'.disconnect()"), "Disconnect" },
    Q = { luacmd("require'dap'.close()"), "Quit" },
    K = { luacmd("require'dap'.terminate()"), "Terminate" },

    R = { luacmd("require'dap'.run_to_cursor()"), "Run to Cursor" },
    E = { luacmd("require'dapui'.eval(vim.fn.input '[Expression] > ')"), "Evaluate Input" },
    U = { luacmd("require'dapui'.toggle()"), "Toggle UI" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    -- e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    -- g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    -- S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    -- P = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
  },
}, { prefix = "<leader>" })

wk.register({
  ["<F5>"] = { luacmd("require'dap'.continue()"), "Start" },
  ["<F6>"] = { luacmd("require'dap'.run_to_cursor()"), "Run to cursor" },
  ["<F10>"] = { luacmd("require'dap'.step_over()"), "Step Over" },
  ["<F11>"] = { luacmd("require'dap'.step_into()"), "Step Into" },
  ["<S-F11>"] = { luacmd("require'dap'.step_out()"), "Step Out" },
})

---------------------------------
-- Misc bindings
---------------------------------

wk.register({
  ["<F2>"] = { luacmd([[_G.highlight_under_cursor()]]), "Highlight under cursor" },
})
