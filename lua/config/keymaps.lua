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
-- Navigation
---------------------------------

wk.register({
  j      = { cmd[[:Telescope jumplist]], "Show Jumplist" },
  h      = { cmd[[:nohlsearch]], "Toggle search highlight" },
  m      = { cmd[[:Telescope marks]], "Show marks" },
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
  sa = "Add<motion><character>",
  sc = "Change<current><replacement>",
  sd = "Delete<current>",
})

-- Stay in indent mode
visual("<", "<gv", { desc = "Dedent selection" })
visual(">", ">gv", { desc = "Indent selection" })

-- OS Clipboard yank
normal("<leader>y", "\"+y", { desc = "Yank to clipboard" })
visual("<leader>y", "\"+y", { desc = "Yank to clipboard" })

wk.register({
  i = { "m`gg=G``", "Reindent file" },
  P = { cmd [[Telescope yank_history theme=dropdown]], "Show yank ring" },
  S = { luacmd[[require('treesj').join()]], "Join structure" },
  s = { luacmd[[require('treesj').split()]], "Split structure" },
  sk = { luacmd[[require('treesj').split({ split = { recursive = true } })]], "Split structure recursively"},
  sj = { luacmd[[require('treesj').join({ join = { recursive = true } })]], "Join structure recursively"},
  sp = { cmd[[:Telescope spell_suggest]], "Suggest spelling fixes" },
}, { prefix = "<leader>" })

wk.register({
  g = {
    J = { "Join lines" },
    b = { "Block comment {motion}" },
    c = { "Linewise comment {motion}" },
    C = { cmd [[TextCaseOpenTelescope]], "Case changes" },
    t = { luacmd[[_G.translate()]], "Translate and replace"},
  },
  q = { "Record macro" },
})

wk.register({
  g = {
    C = { cmd [[TextCaseOpenTelescope]], "Case changes" },
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
    -- x = { cmd[[GitConflictPrevConflict]], "Conflict" }
  },
  [']'] = {
    name = "Next",
    c = { cmd[[Gitsigns next_hunk]], "Change"},
    -- x = { cmd[[GitConflictNextConflict]], "Conflict" }
  }
})

wk.register({
  c = {
    name = "Changes",
    a = { cmd[[Gitsigns stage_hunk]],                               "Add change to stage" },
    A = { cmd[[Gitsigns stage_buffer]],                             "Add all changes in file" },
    b = { cmd[[lua require"gitsigns".toggle_current_line_blame()]], "Toggle blame" },
    B = { cmd[[Telescope git_bcommits]],                            "Show commit history for current file"},
    u = { cmd[[Gitsigns reset_hunk]],                               "Undo change" },
    U = { cmd[[Gitsigns reset_buffer_index]],                       "Undo all changes in file" },
    d = { cmd[[Gitsigns preview_hunk]],                             "Diff change" },
    R = { cmd[[Gitsigns reset_buffer]],                             "Reset file" },
  },
  C = {
    name = "Changes (branch-level)",
    C = { cmd[[Telescope git_branches]],                            "Show branch switcher"},
    c = { cmd[[Telescope git_commits]],                             "Show commit history"},
    D = { cmd[[Telescope git_status]],                              "Current git status"},
    o = { cmd[[GitConflictChooseOurs]],                             "Conflict: Choose Ours"},
    t = { cmd[[GitConflictChooseTheirs]],                           "Conflict: Choose Theirs"},
    b = { cmd[[GitConflictChooseBoth]],                             "Conflict: Choose Both"},
    n = { cmd[[GitConflictChooseNone]],                             "Conflict: Choose None"},
  },
  u = { cmd[[:UndotreeToggle]], "Show the undo tree" },
}, { prefix = "<leader>" })

---------------------------------
-- File navigation
---------------------------------

wk.register({
  f = {cmd [[Telescope find_files]], "Find files" },
  -- F = {cmd [[:Telescope live_grep]],  "Find in files" },
  F = { luacmd [[require("telescope").extensions.live_grep_args.live_grep_args() ]], "Find in files" },
  G = {cmd [[Telescope resume]],  "Show previous search" },
  ["*"] = {cmd [[Telescope grep_string]], "Search for word" },
  ["."] = { luacmd [[require("telescope.builtin").buffers() ]], "Switch buffers" },
  [","] = {cmd [[:Oil]], "Show directory" },
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
    l = { cmd [[Lspsaga outline]],                       "Show LSP outline for file" },
    p = { cmd [[Lspsaga peek_definition]],               "Peek definition" },
    o = { cmd [[Lspsaga show_line_diagnostics]],         "Show line disagnostics" },
    r = { cmd [[Lspsaga rename]],                        "LSP Rename" },
    a = { luacmd [[vim.lsp.buf.code_action()]],          "Show code actions" },
    k = { luacmd [[vim.lsp.buf.hover()]],                "Show hover" },
    K = { cmd [[Lspsaga hover_doc]],                     "Show lspsaga hover" },
    f = { cmd [[lua vim.lsp.buf.format()]],              "Format" },
    D = { cmd [[Telescope diagnostics]],                 "List diagnostics"},
    s = { cmd [[Telescope lsp_document_symbols]],        "Doc symbols"},
    q = { luacmd [[vim.diagnostic.setloclist()]],        "Quickfix diagnostics" },
  },
  ["]"] = { cmd[[Lspsaga finder]],                       "Find references and definitions" },
  ["{"] = { cmd[[Lspsaga peek_definition]],              "Peek definition" },
}, { prefix = "<leader>" })

vim.keymap.set("n", "K", cmd[[Lspsaga hover_doc]], {desc = "Hover doc"})

wk.register({
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
    D = { luacmd("require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')"), "Conditional Breakpoint" },
    l = { cmd [[:Telescope dap list_breakpoints]], "List breakpoints"},

    -- Somehow all of these are in my muscle memory... will try to consolidate
    c = { luacmd("require'dap'.continue()"), "Continue"},
    g = { luacmd("require'dap'.continue()"), "Start" },
    n = { luacmd("require'dap'.continue()"), "Continue to Next" },

    i = { luacmd("require'dap'.step_in()"), "Step Into" },
    o = { luacmd("require'dap'.step_out()"), "Step Out" },
    u = { luacmd("require'dap'.step_over()"), "Step Over" },

    q = { luacmd("require'dap'.disconnect()"), "Disconnect" },
    Q = { luacmd("require'dap'.close()"), "Quit" },
    K = { luacmd("require'dap'.terminate()"), "Terminate" },

    r = { luacmd("require'dap'.run_to_cursor()"), "Run to Cursor" },
    e = { luacmd("require'dapui'.eval(vim.fn.input '[Expression] > ')"), "Evaluate Input" },
    U = { luacmd("require'dapui'.toggle()"), "Toggle UI" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
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
  ["<F2>"] = { cmd[[Inspect]], "Highlight under cursor" },
})

-- Remap adding surrounding to Visual mode selection
vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

-- Make special mapping for "add surrounding for line"
vim.keymap.set('n', 'yss', 'ys_', { remap = true })
