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

local leader = function(keys, command, opts)
  keymap("n", "<leader>" .. keys, command .. "<CR>", bind_opts(opts))
end

local raw_cmd = function(command)
  return "<Esc><Cmd>"..command
end

local cmd = function(command)
  return raw_cmd(command).."<CR>"
end

local raw_luacmd = function(command)
  return "<Esc><Cmd>lua " .. command
end

local luacmd = function(command)
  return raw_luacmd(command) .. "<CR>"
end

local which_key_status_ok, wk = pcall(require, "which-key")
if not which_key_status_ok then
  return
end

---------------------------------
-- Leader key = <space>
---------------------------------
keymap("", "<space>", "<Nop>", default_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
normal("<C-h>", "<C-w>h", { desc = "Move to window left" })
normal("<C-l>", "<C-w>l", { desc = "Move to window right" })
normal("<C-j>", "<C-w>j", { desc = "Move to window below" })
normal("<C-k>", "<C-w>k", { desc = "Move to window above" })

---------------------------------
-- Text navigation
---------------------------------

wk.register({
  w = {
    name = "Window/Writes",
    m = { cmd [[:Telescope marks]], "Show marks" },
    j = { cmd [[:Telescope jumplist]], "Show Jumplist" },
  },
  h = { cmd[[:nohlsearch]], "Toggle search highlight" },
}, { prefix = "<leader>" })

normal("m", luacmd [[set_mark()]], { desc = "Set mark" })

--
-- Nicer movement through the change list (where you have edited)
normal("[g", "g;", { desc = "Prev edit" })
normal("]g", "g,", { desc = "Next edit" })

---------------------------------
-- Text manipulation
---------------------------------

-- Add add blank line above/below current line
normal("[<space>", "O<Esc>", { desc = "Add space before line" })
normal("]<space>", "o<Esc>2k", { desc = "Add space after line" })

-- Move current line up or down
normal("[e", ":m -2<cr>k", { desc = "Move line up" })
normal("]e", ":m +1<cr>k", { desc = "Move line down" })

-- Stay in indent mode
visual("<", "<gv", { desc = "Dedent selection" })
visual(">", ">gv", { desc = "Indent selection" })

-- Reindent the current file
leader("i", "m`gg=G``", { desc = "Reindent file" })

-- Yank ring setup
normal("p", "<Plug>(YankyPutAfter)", { desc = "Paste" })
normal("P", "<Plug>(YankyPutBefore)", { desc = "Paste before" })
normal("[p", "<Plug>(YankyCycleForward)", { desc = "Swap to next paste" })
normal("]p", "<Plug>(YankyCycleBackward)", { desc = "Swap to prev paste" })
leader("P", raw_cmd [[Telescope yank_history]], { desc = "Show yank ring" })

-- OS Clipboard yank
normal("<leader>y", "\"+y", { desc = "Yank to clipboard" })
visual("<leader>y", "\"+y", { desc = "Yank to clipboard" })

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
  },
  q = { "Record macro" },
})

---------------------------------
-- Diffs & Versioning
---------------------------------

-- Move to the next/prev change in this file
normal("]c", '<cmd>Gitsigns next_hunk', { desc = "Next change" })
normal("[c", '<cmd>Gitsigns prev_hunk', { desc = "Prev change" })

wk.register({
  c = {
    name = "Change",
    a = { cmd[[Gitsigns stage_hunk]],                               "Add change to stage" },
    A = { cmd[[Gitsigns stage_buffer]],                             "Add all changes in file" },
    u = { cmd[[Gitsigns reset_hunk]],                               "Undo change" },
    U = { cmd[[Gitsigns reset_buffer_index]],                       "Undo all changes in file" },
    d = { cmd[[Gitsigns preview_hunk]],                             "Diff change" },
    b = { cmd[[lua require"gitsigns".toggle_current_line_blame()]], "Toggle blame" },
    R = { cmd[[Gitsigns reset_buffer]],                             "Reset file" },
    v = { cmd [[:DiffviewToggle]],                                  "Show merge view" },
  },
  s = { cmd[[:SplitjoinSplit]], "Split construct" },
  S = { cmd[[:SplitjoinJoin]], "Join construct" },
  sp = { cmd[[:Telescope spell_suggest]], "Suggest spelling fixes" },
  u = { cmd[[:UndotreeToggle]], "Show the undo tree" },
}, { prefix = "<leader>" })

---------------------------------
-- File navigation
---------------------------------

wk.register({
  f = {cmd [[:Telescope find_files]], "Find files" },
  F = {cmd [[:Telescope live_grep]],  "Find in files" },
  G = {cmd [[:Telescope resume]],  "Show previous search" },
  ["*"] = {cmd [[:Telescope grep_string]], "Search for word" },
  ["."] = {cmd [[:Telescope buffers]], "Show buffers" },
  [" "] = { cmd [[:b#]], "Previous buffer" },
}, { prefix = "<leader>" })

---------------------------------
-- Language aware navigation
---------------------------------

-- Jump to definition or references
normal("<C-{>", raw_cmd [[Lspsaga lsp_finder]],          { desc = "Find references and definitions" })
leader("]",     raw_cmd [[Lspsaga lsp_finder]],          { desc = "Find references and definitions" })
normal("<C-}>", raw_cmd [[Lspsaga peek_definition]],     { desc = "Preview definition" })
leader("}",     raw_cmd [[Lspsaga peek_definition]],     { desc = "Preview definition" })
normal("<C-]>", raw_luacmd [[vim.lsp.buf.definition()]], { desc = "Jump to definition" })

-- LSP Tools
wk.register({
  l = {
    name = "Language tools",
    d = { luacmd [[_G.toggle_diagnostics()]],            "Toggle disagnostics" },
    l = { cmd [[LSoutlineToggle]],                       "Show LSP outline for file" },
    p = { cmd [[Lspsaga peek_definition]],               "Peek definition" },
    o = { cmd [[Lspsaga show_line_diagnostics]],         "Show disagnostic float" },
    r = { cmd [[Lspsaga rename]],                        "LSP Rename" },
    a = { cmd [[Lspsaga code_action]],                   "Show code actions" },
    k = { cmd [[Lspsaga hover_doc]],                     "Show docs" }, -- or call vim.lsp.bug.hover()
    f = { cmd [[lua vim.lsp.buf.formatting_seq_sync()]], "Format" },
    D = { cmd [[:Telescope diagnostics]],                "List diagnostics"},
    q = { luacmd [[vim.diagnostic.setloclist()]],        "Quickfix diagnostics" },
  }
}, { prefix = "<leader>" })

-- [d and ]d to traverse diagnostics - <leader>q to add all to the quickfix list
normal("[d", raw_luacmd 'vim.diagnostic.goto_prev()', { desc = "Prev diagnostic" })
normal("]d", raw_luacmd 'vim.diagnostic.goto_next()', { desc = "Next diagnostic" })

---------------------------------
-- Test helpers
---------------------------------

-- Leader t/T to send the current file/line to rspec via tmux windows
-- Mapped per language in language_options

-- <Leader>gr to open the current line in the repos website
vim.g.gh_open_command = [[fn() { echo "$@" | pbcopy; }; fn ]]
vim.g.gh_line_map_default = 0
vim.g.gh_line_blame_map_default = 0
vim.g.gh_repo_map = 0
vim.g.gh_line_map = '<leader>pg'

wk.register({
  p = {
    name = "Paths",
    g = "Copy the URL to github/gitlab",
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

leader("d", ":Telescope dap list_breakpoints")

wk.register({
  b = {
    name = "deBug",
    b = { luacmd "require'dap'.toggle_breakpoint()", "Toggle Breakpoint" },
    B = { luacmd("require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')"), "Conditional Breakpoint" },

    g = { luacmd("require'dap'.continue()"), "Start" },
    n = { luacmd("require'dap'.continue()"), "Continue to Next" },

    s = { luacmd("require'dap'.step_in()"), "Step Into" },
    S = { luacmd("require'dap'.step_over()"), "Step Over" },
    u = { luacmd("require'dap'.step_out()"), "Step Out" },
    ["<Left>"] = { luacmd("require'dap'.step_back()"), "Step Back" },
    ["<Down>"] = { luacmd("require'dap'.step_into()"), "Step Into" },
    ["<Right>"] = { luacmd("require'dap'.step_over()"), "Step Over" },
    ["<Up>"] = { luacmd("require'dap'.step_out()"), "Step Out" },

    d = { luacmd("require'dap'.disconnect()"), "Disconnect" },
    q = { luacmd("require'dap'.close()"), "Quit" },
    k = { luacmd("require'dap'.terminate()"), "Terminate" },

    R = { luacmd("require'dap'.run_to_cursor()"), "Run to Cursor" },
    E = { luacmd("require'dapui'.eval(vim.fn.input '[Expression] > ')"), "Evaluate Input" },
    U = { luacmd("require'dapui'.toggle()"), "Toggle UI" },
    r = { luacmd("require'dap'.repl.toggle()"), "Toggle Repl" },
    -- e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    -- g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    -- h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    -- S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    -- P = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
  },
}, { prefix = "<leader>" })

---------------------------------
-- Colorscheme Creation helpers
---------------------------------

normal("<F10>", ":TSHighlightCapturesUnderCursor")
