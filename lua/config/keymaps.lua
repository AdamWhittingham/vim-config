-- Helper functions
local default_opts = { noremap = true, silent = true }

local bind_opts = function(opts)
  opts = opts or {}
  local out_opts = default_opts
  for k,v in pairs(opts) do out_opts[k] = v end
  return out_opts
end

local keymap = vim.api.nvim_set_keymap

local normal = function(keys, command, opts)
  keymap("n", keys, command.."<CR>", bind_opts(opts))
end

local visual = function(keys, command, opts)
  keymap("v", keys, command, bind_opts(opts))
end

local leader = function(keys, command, opts)
  keymap("n", "<leader>"..keys, command.."<CR>", bind_opts(opts))
end

local cmd = function(command)
  return "<Esc><Cmd>"..command.."<CR>"
end

local luacmd = function(command)
  return "<Esc><Cmd>lua "..command
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
wk.register({ w = { name = "Window", } }, { prefix = "<leader>" })

leader("ww", ":w", { desc = "Write" })
leader("we", ":e", { desc = "Reload" })
leader("wq", ":x", { desc = "Write & quit" })
leader("wa", ":wa", { desc = "Write all" })
leader("wQ", ":q!", { desc = "Discard & quit" })
leader("qq", ":q", { desc = "Quit" })

---------------------------------
-- Window splitting & movement
---------------------------------

-- Move between panes
normal("<C-h>", "<C-w>h", { desc = "Move to window left" })
normal("<C-l>", "<C-w>l", { desc = "Move to window right" })
normal("<C-j>", "<C-w>j", { desc = "Move to window below" })
normal("<C-k>", "<C-w>k", { desc = "Move to window above" })

-- Split panes
leader("ws", ":vsplit", { desc = "Split window vertically"})
leader("wS", ":split", { desc = "Split window horizontally"})

---------------------------------
-- Text navigation
---------------------------------

leader("h", ":nohlsearch", { desc = "Toggle search highlight" })
leader("m", ":Telescope marks", { desc = "List marks" })
normal("m", luacmd[[set_mark()]], { desc = "Set mark" })
leader("j", ":Telescope jumps", { desc = "Jumplist" })
leader("ll", ":Telescope diagnostics", { desc = "List diagnostics" })
--
-- Nicer movement through the change list (where you have edited)
normal("[g", "g;", { desc = "Prev edit"})
normal("]g", "g,", { desc = "Next edit"})

---------------------------------
-- Text manipulation
---------------------------------

-- Add add blank line above/below current line
normal("[<space>", "O<Esc>", { desc = "Add space before line"})
normal("]<space>", "o<Esc>2k", { desc = "Add space after line"})

-- Move current line up or down
normal("[e", ":m -2<cr>k", { desc = "Move line up" })
normal("]e", ":m +1<cr>k", { desc = "Move line down" })

-- Stay in indent mode
visual("<", "<gv", { desc = "Dedent selection"})
visual(">", ">gv", { desc = "Indent selection"})

-- Reindent the current file
leader("i", "m`gg=G``", { desc = "Reindent file" })

-- Split/Join constructs
leader("s", ":SplitjoinSplit", { desc = "Split construct" })
leader("S", ":SplitjoinJoin", { desc = "Join construct" })

-- Yank ring setup
normal("p", "<Plug>(YankyPutAfter)", { desc = "Paste" })
normal("P", "<Plug>(YankyPutBefore)", {desc = "Paste before"})
normal("[p", "<Plug>(YankyCycleBackward)", {desc = "Swap to prev paste" })
normal("]p", "<Plug>(YankyCycleForward)", {desc = "Swap to next paste" })
leader("P", cmd[[Telescope yank_history]], { desc = "Show yank ring" })

-- OS Clipboard yank
normal("<leader>y", "\"+y", { desc = "Yank to clipboard" })
visual("<leader>y", "\"+y", { desc = "Yank to clipboard" })

-- Case conversions
normal("gaU", luacmd[[require('textcase').current_word('to_upper_case')]] , { desc = "Convert to UPPER CASE" } )
normal("gau", luacmd[[require('textcase').current_word('to_lower_case')]] , { desc = "Convert to lower case" } )
normal("ga_", luacmd[[require('textcase').current_word('to_snake_case')]] , { desc = "Convert to snake_case" } )
normal("ga-", luacmd[[require('textcase').current_word('to_dash_case')]] , { desc = "Convert to dash-case" } )
normal("gaC", luacmd[[require('textcase').current_word('to_constant_case')]] , { desc = "Convert to CONSTANT_CASE" } )
normal("ga.", luacmd[[require('textcase').current_word('to_dot_case')]] , { desc = "Convert to dot.case" } )
normal("gac", luacmd[[require('textcase').current_word('to_camel_case')]] , { desc = "Convert to CamelCase" } )
normal("gaP", luacmd[[require('textcase').current_word('to_pascal_case')]] , { desc = "Convert to PascalCase" } )
normal("gat", luacmd[[require('textcase').current_word('to_title_case')]] , { desc = "Convert to Title Case" } )
normal("gap", luacmd[[require('textcase').current_word('to_path_case')]] , { desc = "Convert to path/case" } )
normal("gas", luacmd[[require('textcase').current_word('to_phrase_case')]] , { desc = "Convert to sentence case" } )

wk.register({
  g = {
    J = { "Join lines" },
    b = { "Block comment {motion}" },
    c = { "Linewise comment {motion}" },
  },
  ["q"] = { "Record macro" },
  ["Q"] = { "Replay macro" },
})

---------------------------------
-- Diffs & Versioning
---------------------------------
wk.register({ c = { name = "Change", } }, { prefix = "<leader>" })

leader("u", ":UndotreeToggle", { desc = "Undo tree" })

-- Move to the next/prev change in this file
normal("]c", '<cmd>Gitsigns next_hunk', { desc = "Next change"})
normal("[c", '<cmd>Gitsigns prev_hunk', { desc = "Prev change"})

-- Control Changes/Hunks
leader("ca", "<cmd>Gitsigns stage_hunk", { desc = "Add change to stage" })
leader("cA", '<cmd>Gitsigns stage_buffer', { desc = "Add all changes in file" })
leader("cu", "<cmd>Gitsigns reset_hunk", { desc = "Undo change" })
leader("cU", '<cmd>Gitsigns reset_buffer_index', { desc = "Undo all changes in file" })
leader("cd", '<cmd>Gitsigns preview_hunk', { desc = "Diff change" })
leader("cb", '<cmd>lua require"gitsigns".toggle_current_line_blame()', { desc = "Toggle blame" })
leader("cR", '<cmd>Gitsigns reset_buffer', { desc = "Reset file" })

-- Diff viewing
leader("cv", cmd[[:DiffviewToggle]], { desc = "Show merge view"})

---------------------------------
-- File navigation
---------------------------------

-- Opening and finding files
leader("f", ":Telescope find_files", { desc = "Find files" })
leader("F", ":Telescope live_grep", { desc = "Find in files" })
leader("G", ":Telescope resume", { desc = "Show previous search" })
leader("*", ":Telescope grep_string", { desc = "Search for word" })

-- Switching buffers
leader(".", ":Telescope buffers", { desc = "Show buffers" })
leader("<leader>", ":b#", { desc = "Previous buffer" })

---------------------------------
-- Language aware navigation
---------------------------------
wk.register({ l = { name = "Language Server", } }, { prefix = "<leader>" })

-- Jump to definition or references
normal("<C-{>", cmd[[Lspsaga lsp_finder]], { desc = "Find references and definitions" })
leader("]", cmd[[Lspsaga lsp_finder]], { desc = "Find references and definitions" })
normal("<C-}>", cmd[[Lspsaga peek_definition]], { desc = "Preview definition" })
leader("}", cmd[[Lspsaga peek_definition]], { desc = "Preview definition" })
normal("<C-]>", luacmd[[vim.lsp.buf.definition()]], { desc = "Jump to definition" })

-- Show signature help, info/docs & diagnostics
leader("K", cmd[[Lspsaga hover_doc]])
leader("ll", cmd[[LSoutlineToggle]])
leader("ls", cmd[[Lspsaga signature_help]], ({desc = "Signaure help"}))
leader("li", luacmd[[vim.lsp.buf.hover()]], {desc = "LSP info"})
leader("ld", luacmd[[_G.toggle_diagnostics()]], {desc = "Toggle disagnostics"})
leader("lo", luacmd[[vim.diagnostic.open_float()]], {desc = "Show disagnostic float"})
leader("lr", cmd[[Lspsaga rename]], {desc = "LSP Rename"})

-- LSP code manipulations
vim.keymap.set("n", "<leader>la", cmd"Lspsaga code_action", bind_opts({desc = "Code action"}))
vim.keymap.set("v", "<leader>la", cmd"Lspsaga range_code_action", bind_opts({desc = "Code action"}))
leader("lf", cmd[[lua vim.lsp.buf.formatting_seq_sync()]], { desc = "Format" })

-- [d and ]d to traverse diagnostics - <leader>q to add all to the quickfix list
normal("[d", luacmd'vim.diagnostic.goto_prev({ border = "rounded" })', { desc = "Prev diagnostic" })
normal("]d", luacmd'vim.diagnostic.goto_next({ border = "rounded" })', { desc = "Next diagnostic" })
leader("q", luacmd"vim.diagnostic.setloclist()", { desc = "Quickfix list diagnostics" })


---------------------------------
-- Test helpers
---------------------------------

-- Leader t/T to send the current file/line to rspec via tmux windows
leader("t", [[:call InvokeViaTmux("rspec", expand("%:p"))]], { desc = "Run tests for this file" })
leader("T", [[:call InvokeViaTmux("rspec", expand("%:p") . ":" . line('.'))]], { desc = "Run tests for this line"})

leader("pr", ":CopyRelativePath", { desc = "Copy relative path" })
leader("pa", ":CopyAbsolutePath", { desc = "Copy absolute path" })
leader("pf", ":CopyFileName", { desc = "Copy file name"})
leader("pd", ":CopyDirectoryPath", { desc = "Copy directory path"})
leader("pl", ":CopyRelativePathAndLine", { desc = "Copy Relative path and line number"})

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
