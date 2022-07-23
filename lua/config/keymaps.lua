-- Helper functions
local default_opts = { noremap = true, silent = true }

local keymap = function(mode, keys, command, opts)
  opts = opts or default_opts
  vim.api.nvim_set_keymap(mode, keys, command, opts)
end

local normal = function(keys, command)
  keymap("n", keys, command.."<CR>", default_opts)
end

local visual = function(keys, command, opts)
  opts = opts or default_opts
  keymap("v", keys, command, opts)
end

local leader = function(keys, command)
  keymap("n", "<leader>"..keys, command.."<CR>", default_opts)
end

local luacmd = function(command)
  return "<Esc><Cmd>lua "..command.."<CR>"
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
-- Window save and reload
---------------------------------
leader("ww", ":w")
leader("we", ":e")
leader("wx", ":x")
leader("wQ", ":q!")

-- Replace Q (Ex Mode) with replay macro
keymap("n", "Q", "@", default_opts)

---------------------------------
-- Window splitting & movement
---------------------------------

-- Move between panes
normal("<C-h>", "<C-w>h")
normal("<C-l>", "<C-w>l")
normal("<C-j>", "<C-w>j")
normal("<C-k>", "<C-w>k")

-- Split panes
leader("ws", ":vsplit")
leader("wS", ":split")

wk.register({
  w = {
    name = "Window",
    s = "Split (vertically)",
    S = "Split (horizontally)",
    w = "Write buffer",
    e = "Reload buffer",
    x = "Write buffer and quit",
  }
}, { prefix = "<leader>" })

---------------------------------
-- Text navigation
---------------------------------

leader("h", ":nohlsearch")
leader("m", ":FzfLua marks")
normal("m", ":lua set_mark()")
leader("j", ":FzfLua jumps")
leader("ll", ":FzfLua lsp_document_diagnostics")

-- Nicer movement through the change list (where you have edited)
keymap("n", "[g", "g;", default_opts)
keymap("n", "]g", "g,", default_opts)

---------------------------------
-- Text manipulation
---------------------------------

-- Add add blank line above/below current line
normal("[<space>", "O<Esc>")
normal("]<space>", "o<Esc>2k")

-- Move current line up or down
normal("[e", ":m -2<cr>k")
normal("]e", ":m +1<cr>k")

-- Stay in indent mode
visual("<", "<gv")
visual(">", ">gv")

-- Reindent the current file
leader("i", "m`gg=G``")

-- Split/Join constructs
leader("s", ":SplitjoinSplit")
leader("S", ":SplitjoinJoin")

-- Yank ring setup
normal("p", "<Plug>(YankyPutAfter)")
normal("P", "<Plug>(YankyPutBefore)")
normal("]p", "<Plug>(YankyCycleForward)")
normal("[p", "<Plug>(YankyCycleBackward)")

-- OS Clipboard yank
vim.api.nvim_set_keymap("n", "<leader>y", "\"+y", default_opts)
vim.api.nvim_set_keymap("v", "<leader>y", "\"+y", default_opts)

wk.register({
  ["[<space>"] = { "Add blank line above" },
  ["]<space>"] = { "Add blank line below" },
  ["[e"] = { "Move line up" },
  ["]e"] = { "Move line down" },
  ["[c"] = { "Jump to previous change in file" },
  ["]c"] = { "Jump to next change in file" },
  ["[d"] = { "Previous diagnostic message" },
  ["]d"] = { "Next diagnostic message" },
  ["[g"] = { "Previous cursor position" },
  ["]g"] = { "Next cursor position" },
  ["[p"] = { "Swap paste to previous yank" },
  ["]p"] = { "Swap paste to next yank" },
  ["<"] = { "Move selection left" },
  [">"] = { "Move selection right" },
  g = {
    s = { "Switch code construct" },
    S = { "Expand code construct" },
    J = { "Contract code construct" },
    b = { "Block comment {motion}" },
    c = { "Linewise comment {motion}" },
  },
  ["q"] = { "Select buffer and record macro" },
  ["Q"] = { "Select buffer and replay macro" },
  ["<leader>y"] = { "Yank to system clipboad"},
})

---------------------------------
-- Diffs & Versioning
---------------------------------

leader("u", ":UndotreeToggle")

-- Move to the next/prev change in this file
normal("]c", '<cmd>Gitsigns next_hunk')
normal("[c", '<cmd>Gitsigns prev_hunk')

-- Control Changes/Hunks
leader("ca", "<cmd>Gitsigns stage_hunk")
leader("cu", "<cmd>Gitsigns reset_hunk")
leader("cd", '<cmd>Gitsigns preview_hunk')
leader("cb", '<cmd>lua require"gitsigns".toggle_current_line_blame()')
leader("cA", '<cmd>Gitsigns stage_buffer')
leader("cU", '<cmd>Gitsigns reset_buffer_index')
leader("cR", '<cmd>Gitsigns reset_buffer')

wk.register({
  c = {
    name = "Change",
    a = "Add this change to staging",
    A = "Add all changes in this file to staging",
    u = "Undo change",
    d = "Diff of the change",
    b = "Toggle git blame",
  }
}, { prefix = "<leader>" })

---------------------------------
-- File navigation
---------------------------------

-- Opening and finding files
leader("f", ":FzfLua files")
leader("F", ":FzfLua live_grep_native")
leader("G", ":FzfLua resume")
leader("*", ":FzfLua grep_cword")

-- Switching buffers
leader(".", ":FzfLua buffers")
leader("<leader>", ":b#")

wk.register({
  ["."] = { "Find open buffer" },
  ["*"] = "String under the cursor in files",
  ["<space>"] = { "Switch to the last open buffer" },
  i = { "Indent all lines" },
  s = { "Switch between common modes" },
  S = { "Compress the current code construct" },
  d = { "Directory browser" },
  D = { "Directory-filtered search" },
  f = { "Find files by name" },
  F = { "Find text in files" },
  j = { "Show recent cursor locations" },
  G = { "Resume last search" },
  q = { "Show LSP quickfix list" },
}, {prefix = "<leader>"})

---------------------------------
-- Language aware navigation
---------------------------------

-- Jump to definition or references
leader("{", "Code definitions")
leader("}", "Code references")
normal("<C-]>", "<cmd>lua vim.lsp.buf.definition()")

-- Show signature help, info/docs & diagnostics
leader("ls", "<cmd>lua vim.lsp.buf.signature_help()")
leader("li", "<cmd>lua vim.lsp.buf.hover()")
leader("ld", luacmd("require('lsp_lines').toggle()"))

-- LSP code manipulations
leader("lr", "<cmd>lua vim.lsp.buf.rename()")
leader("la", "<cmd>lua vim.lsp.buf.code_action()")
leader("lf", "<cmd>lua vim.lsp.buf.formatting_seq_sync()")

-- [d and ]d to traverse diagnostics - <leader>q to add all to the quickfix list
normal("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })')
normal("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })')
leader("q", "<cmd>lua vim.diagnostic.setloclist()")

-- Remaps for the refactoring operations currently offered by the plugin
visual("<leader>rb", luacmd("require('refactoring').refactor('Extract Block')") )
visual("<leader>re", luacmd("require('refactoring').refactor('Extract Function')") )
visual("<leader>rf", luacmd("require('refactoring').refactor('Extract Function To File')") )
visual("<leader>rv", luacmd("require('refactoring').refactor('Extract Variable')") )
visual("<leader>ri", luacmd("require('refactoring').refactor('Inline Variable')") )
normal("<leader>ri", luacmd("require('refactoring').refactor('Inline Variable')") ) -- same but for item under cursor

wk.register({
  l = {
    name = "Language Server",
    r = "rename",
    a = "actions",
    f = "format",
    d = "diagnostics",
    s = "signature help",
    i = "info or docs",
  }
}, { prefix = "<leader>" })

wk.register({
  r = {
    name = "Refactor",
    b = "Extract block",
    e = "Extract method",
    f = "Extract function to file",
    i = "Extract inline variable",
    v = "Extract variable",
  }
}, { prefix = "<leader>", mode = "v" })

---------------------------------
-- Test helpers
---------------------------------

-- Leader t/T to send the current file/line to rspec via tmux windows
leader("t", [[:call InvokeViaTmux("rspec", expand("%:p"))]])
leader("T", [[:call InvokeViaTmux("rspec", expand("%:p") . ":" . line('.'))]])

leader("pr", ":CopyRelativePath")
leader("pa", ":CopyAbsolutePath")
leader("pf", ":CopyFileName")
leader("pd", ":CopyDirectoryPath")
leader("pl", ":CopyRelativePathAndLine")

-- <Leader>gr to open the current line in the repos website
vim.g.gh_open_command = [[fn() { echo "$@" | pbcopy; }; fn ]]
vim.g.gh_line_map_default = 0
vim.g.gh_line_blame_map_default = 0
vim.g.gh_repo_map = 0
vim.g.gh_line_map = '<leader>pg'

wk.register({
  t = { "Run tests for this file" },
  T = { "Run tests for this line" },
  p = {
    name = "Paths",
    r = "Copy the relative path",
    a = "Copy the absolute path",
    f = "Copy the file name",
    d = "Copy the directory path",
    l = "Copy the relative path and line",
    g = "Copy the URL to github/gitlab",
  }
}, { prefix = "<leader>" })

---------------------------------
-- Debugging
---------------------------------

leader("d", ":FzfLua dap_breakpoints")

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
