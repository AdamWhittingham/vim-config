-- Helper functions
local default_opts = { noremap = true, silent = true }

local keymap = function(mode, keys, command, opts)
  opts = opts or default_opts
  vim.api.nvim_set_keymap(mode, keys, command, opts)
end

local normal = function(keys, command)
  keymap("n", keys, command.."<CR>", default_opts)
end

local visual = function(keys, command)
  keymap("v", keys, command, default_opts)
end

local leader = function(keys, command)
  keymap("n", "<leader>"..keys, command.."<CR>", default_opts)
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
leader("wq", ":x")

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
leader("m", ":Telescope marks")
normal("m", ":lua set_mark()")
leader("j", ":Telescope jumplist")
leader("ll", ":Telescope diagnostics")

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
  ["<leader>i"] = { "Reindent the whole file" },
  ["<leader>s"] = { "Split the current code construct" },
  ["<leader>S"] = { "Compress the current code construct" },
  ["<"] = { "Move selection left" },
  [">"] = { "Move selection right" },
  ["gs"] = { "Switch code construct" },
  ["gS"] = { "Expand code construct" },
  ["gJ"] = { "Contract code construct" },
  ["gb"] = { "Block comment {motion}" },
  ["gc"] = { "Linewise comment {motion}" },
  ["q"] = { "Select buffer and record macro" },
  ["Q"] = { "Select buffer and replay macro" },
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
leader("d", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser() theme=get_ivy")
leader("D", "<cmd>lua require 'lua/config/telescope/directory_grep'.live_grep_in_folder()")
leader("f", ":Telescope find_files")
leader("F", ":Telescope live_grep")
leader("g", ":Telescope jumplist")
leader("G", ":Telescope resume")
leader("*", ":Telescope grep_string theme=dropdown layout_config={width=0.75}")

-- Switching buffers
leader(".", ":Telescope buffers theme=get_dropdown sort_mru=true layout_config={width=0.75}")
leader("<leader>", ":b#")

wk.register({
  ["<leader>."] = { "Find open buffer" },
  ["<leader>*"] = "String under the cursor in files",
  ["<leader><space>"] = { "Switch to the last open buffer" },
  ["<leader>i"] = { "Indent all lines" },
  ["<leader>s"] = { "Switch between common modes" },
  ["<leader>d"] = { "Directory browser" },
  ["<leader>D"] = { "Directory-filtered search" },
  ["<leader>f"] = { "Find files by name" },
  ["<leader>F"] = { "Find text in files" },
  ["<leader>g"] = { "Show recent cursor locations" },
  ["<leader>G"] = { "Resume last telescope select" },
  ["<leader>q"] = { "Show LSP quickfix list" },
})

---------------------------------
-- Language aware navigation
---------------------------------

-- Jump to definition or references
leader("{", ":Telescope lsp_definitions")
leader("}", ":Telescope lsp_references")
normal("<C-]>", "<cmd>lua vim.lsp.buf.definition()")

-- Show signature help, info/docs & diagnostics
leader("ls", "<cmd>lua vim.lsp.buf.signature_help()")
leader("li", "<cmd>lua vim.lsp.buf.hover()")
leader("ld", "<cmd>lua vim.diagnostic.open_float()")

-- LSP code manipulations
leader("lr", "<cmd>lua vim.lsp.buf.rename()")
leader("la", "<cmd>lua vim.lsp.buf.code_action()")
leader("lf", "<cmd>lua vim.lsp.buf.formatting_seq_sync()")

-- [d and ]d to traverse diagnostics - <leader>q to add all to the quickfix list
normal("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })')
normal("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })')
leader("q", "<cmd>lua vim.diagnostic.setloclist()")

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

wk.register({
  b = {
    name = "deBug",
    ["<Left>"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    ["<Down>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    ["<Right>"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    ["<Up>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    P = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    k = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
  },
}, { prefix = "<leader>" })

---------------------------------
-- Colorscheme Creation helpers
---------------------------------

normal("<F10>", ":TSHighlightCapturesUnderCursor")
