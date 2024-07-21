local wk = require("which-key")

local cmd = function(command)
  return "<Esc><Cmd>"..command.."<CR>"
end

---------------------------------
-- Leader key = <space>
---------------------------------
vim.keymap.set("", "<space>", "<Nop>", { noremap = true, silent = true })

---------------------------------
-- Window/Tab/Buffer commands
---------------------------------
wk.add({
  { "<leader>w",  group = "Windows (panes/splits)" },
  { "<leader>we",  cmd[[e]],                 desc = "Reload" },
  { "<leader>ww",  cmd[[w]],                 desc = "Write" },
  { "<leader>wq",  cmd[[x]],                 desc = "Write & Quit" },
  { "<leader>wQ",  cmd[[wq!]],               desc = "Discard & Quit" },

  { "<leader>wt", group = "Tabs" },
  { "<leader>wtq", cmd[[tabclose]],          desc = "Close tab" },
  { "<leader>wtn", cmd[[tabNext]],           desc = "Next tab" },
  { "<leader>wtp", cmd[[tabPrev]],           desc = "Previous tab" },

  { "<leader>ws",  cmd[[vsplit]],            desc = "Split vertically" },
  { "<leader>wS",  cmd[[split]],             desc = "Split horizontally" },
  { "<C-h>",       cmd[[TmuxNavigateLeft]],  desc = "Focus left" },
  { "<C-l>",       cmd[[TmuxNavigateRight]], desc = "Focus right" },
  { "<C-j>",       cmd[[TmuxNavigateDown]],  desc = "Focus down" },
  { "<C-k>",       cmd[[TmuxNavigateUp]],    desc = "Focus up" },
})

---------------------------------
-- Navigation
---------------------------------

wk.add({
  { "<leader><leader>", cmd[[b#]],                                                                  desc = "Previous buffer" },
  { "<leader>*",        cmd[[Telescope grep_string]],                                               desc = "Search for word" },
  { "<leader>,",        cmd[[Oil]],                                                                 desc = "Show directory" },
  { "<leader>.",        cmd[[Telescope buffers]],                                                   desc = "Switch buffers" },
  { "<leader>?",        cmd[[Telescope keymaps]],                                                   desc = "Search vim keymaps" },
  { "<leader>f",        cmd[[Telescope find_files]],                                                desc = "Find files" },
  { "<leader>F",        cmd[[lua require("telescope").extensions.live_grep_args.live_grep_args()]], desc = "Find in files" },
  { "<leader>G",        cmd[[Telescope resume]],                                                    desc = "Show previous search" },
  { "<leader>h",        cmd[[nohlsearch]],                                                          desc = "Toggle search highlight" },
  { "<leader>j",        cmd[[Telescope jumplist]],                                                  desc = "Show Jumplist" },
  { "<leader>m",        cmd[[Telescope marks]],                                                     desc = "Show marks" },
  { "<leader>P",        cmd[[Telescope yank_history theme=dropdown]],                               desc = "Show yank ring" },
  { "<leader>u",        cmd[[UndotreeToggle]],                                                      desc = "Show the undo tree" },

  { "<leader>p", group = "Paths" },
  { "<leader>pa", "<Esc><Cmd>CopyAbsolutePath<CR>", desc = "Copy absolute path" },
  { "<leader>pd", "<Esc><Cmd>CopyDirectoryPath<CR>", desc = "Copy directory path" },
  { "<leader>pf", "<Esc><Cmd>CopyFileName<CR>", desc = "Copy file name" },
  { "<leader>pg", '<Esc><Cmd>lua require"gitlinker".get_buf_range_url("n", {})<CR>', desc = "Copy the URL to github/gitlab" },
  { "<leader>pl", "<Esc><Cmd>CopyRelativePathAndLine<CR>", desc = "Copy Relative path and line number" },
  { "<leader>pr", "<Esc><Cmd>CopyRelativePath<CR>", desc = "Copy relative path" },
})

---------------------------------
-- Text manipulation
---------------------------------
wk.add({
  { "[",        group = "Prev" },
  { "[<space>", "O<Esc>j",                    desc = "Add line above" },
  { "[e",       cmd[[m -2]],                  desc = "Move line up" },
  { "[c",       cmd[[Gitsigns prev_hunk]],    desc = "Prev change" },

  { "[g",       "g;",                         desc = "Edit" },
  { "[p",       "<Plug>(YankyCycleForward)",  desc = "Swap to next paste" },

  { "]",        group = "Next" },
  { "]<space>", "o<Esc>k",                    desc = "Add line below" },
  { "]c",       cmd[[Gitsigns next_hunk]],    desc = "Next change" },
  { "]e",       cmd[[m +1]],                  desc = "Move line down" },
  { "]g",       "g,",                         desc = "Edit" },
  { "]p",       "<Plug>(YankyCycleBackward)", desc = "Swap to prev paste" },

  { "p",        "<Plug>(YankyPutAfter)",      desc = "Paste" },
  { "P",        "<Plug>(YankyPutBefore)",     desc = "Paste before" },

  { "ys",       desc = "Add{motion}{char}" },
  { "cs",       desc = "Change surrounding {char} <replacement>" },
  { "ds",       desc = "Delete surrounding {char}" },
  { "S",        cmd[[lua MiniSurround.add('visual')]], desc = "Add surrounding visual", mode = "x"},

  { "<leader>S",  cmd[[lua require('treesj').join()]],                                  desc = "Join structure" },
  { "<leader>s",  cmd[[lua require('treesj').split()]],                                 desc = "Split structure" },
  { "<leader>sj", cmd[[lua require('treesj').join({ join = { recursive = true } })]],   desc = "Join structure recursively" },
  { "<leader>sk", cmd[[lua require('treesj').split({ split = { recursive = true } })]], desc = "Split structure recursively" },

  { "<leader>sG", cmd[[lua MiniTrailspace.trim_last_lines()]], desc = "Strip trailing empty lines" },
  { "<leader>sw", cmd[[lua MiniTrailspace.trim()]],            desc = "Strip trailing whitespace" },

  { "gJ",         desc = "Join lines" },
  { "gb",         desc = "Block comment {motion}" },
  { "gc",         desc = "Linewise comment {motion}" },

  { "gt",         cmd[[lua _G.translate()]],                   desc = "Translate and replace", mode = "v" },
  { "q",          desc = "Record macro" },
  { "<leader>i",  "m`gg=G``",                                  desc = "Reindent file" },
  { "<leader>sp", cmd[[Telescope spell_suggest]],              desc = "Suggest spelling fixes" },

  { "<",          "<gv",                                       desc = "Dedent (reselect)",     mode = "v"},
  { ">",          ">gv",                                       desc = "Indent (reselect)",     mode = "v"},

  {"<leader>y",   [["+y]],                                     desc = "Yank to OS clipboard",  mode = "nv"},
})


---------------------------------
-- Diffs & Versioning
---------------------------------
wk.add({
  { "<leader>c",  group = "Changes" },
  { "<leader>cA", cmd[[Gitsigns stage_buffer]],                                      desc = "Add all changes in file" },
  { "<leader>cB", cmd[[Telescope git_bcommits]],                                     desc = "Show commit history for current file" },
  { "<leader>cR", cmd[[Gitsigns reset_buffer]],                                      desc = "Reset file" },
  { "<leader>cU", cmd[[Gitsigns reset_buffer_index]],                                desc = "Undo all changes in file" },
  { "<leader>ca", cmd[[Gitsigns stage_hunk]],                                        desc = "Add change to stage" },
  { "<leader>cb", cmd[[lua require"gitsigns".toggle_current_line_blame()]], desc = "Toggle blame" },
  { "<leader>cd", cmd[[Gitsigns preview_hunk]],                                      desc = "Diff change" },
  { "<leader>cu", cmd[[Gitsigns reset_hunk]],                                        desc = "Undo change" },

  { "<leader>C",  group = "Changes (branch-level)" },
  { "<leader>CC", cmd[[Telescope git_branches]],                                     desc = "Show branch switcher" },
  { "<leader>CD", cmd[[Telescope git_status]],                                       desc = "Current git status" },
  { "<leader>Cc", cmd[[Telescope git_commits]],                                      desc = "Show commit history" },
  { "<leader>Cb", cmd[[GitConflictChooseBoth]],                                      desc = "Conflict: Choose Both" },
  { "<leader>Cn", cmd[[GitConflictChooseNone]],                                      desc = "Conflict: Choose None" },
  { "<leader>Co", cmd[[GitConflictChooseOurs]],                                      desc = "Conflict: Choose Ours" },
  { "<leader>Ct", cmd[[GitConflictChooseTheirs]],                                    desc = "Conflict: Choose Theirs" },
})

---------------------------------
-- Language aware navigation
---------------------------------
wk.add({
  {"<C-]>",       cmd[[lua vim.lsp.buf.definition()]],    desc = "Jump to definition" },
  {"gd",          cmd[[lua vim.lsp.buf.definition()]],    desc = "Jump to definition" },
  { "K",          cmd[[Lspsaga hover_doc]],               desc = "Symbol doc" },
  { "<leader>{",  cmd[[Lspsaga peek_definition]],         desc = "Peek definition" },
  { "<leader>]",  cmd[[Lspsaga finder]],                  desc = "Find references and definitions" },

  { "<leader>l",  group = "Language tools" },
  { "<leader>lD", cmd[[Telescope diagnostics]],           desc = "List diagnostics" },
  { "<leader>lK", cmd[[Lspsaga hover_doc]],               desc = "Show lspsaga hover" },
  { "<leader>la", cmd[[lua vim.lsp.buf.code_action()]],   desc = "Show code actions" },
  { "<leader>ld", cmd[[lua _G.toggle_diagnostics()]],     desc = "Toggle disagnostics" },
  { "<leader>lf", cmd[[lua vim.lsp.buf.format()]],        desc = "Format" },
  { "<leader>lk", cmd[[lua vim.lsp.buf.hover()]],         desc = "Show hover" },
  { "<leader>ll", cmd[[Lspsaga outline]],                 desc = "Show LSP outline for file" },
  { "<leader>lo", cmd[[Lspsaga show_line_diagnostics]],   desc = "Show line disagnostics" },
  { "<leader>lp", cmd[[Lspsaga peek_definition]],         desc = "Peek definition" },
  { "<leader>lq", cmd[[lua vim.diagnostic.setloclist()]], desc = "Quickfix diagnostics" },
  { "<leader>lr", cmd[[Lspsaga rename]],                  desc = "LSP Rename" },
  { "<leader>ls", cmd[[Telescope lsp_document_symbols]],  desc = "Doc symbols" },
})

---------------------------------
-- Debugging
---------------------------------
wk.add({
  { "<leader>d",  group = "Debug" },
  { "<leader>dD", cmd[[lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')]], desc = "Conditional Breakpoint" },
  { "<leader>dK", cmd[[lua require'dap'.terminate()]],                                   desc = "Terminate" },
  { "<leader>dQ", cmd[[lua require'dap'.close()]],                                       desc = "Quit" },
  { "<leader>dU", cmd[[lua require'dapui'.toggle()]],                                    desc = "Toggle UI" },
  { "<leader>dc", cmd[[lua require'dap'.continue()]],                                    desc = "Continue" },
  { "<leader>dd", cmd[[lua require'dap'.toggle_breakpoint()]],                           desc = "Toggle Breakpoint" },
  { "<leader>de", cmd[[lua require'dapui'.eval(vim.fn.input '[Expression] > ')]],        desc = "Evaluate Input" },
  { "<leader>dg", cmd[[lua require'dap'.continue()]],                                    desc = "Start" },
  { "<leader>dh", cmd[[lua require'dap.ui.widgets'.hover()]],                            desc = "Hover Variables" },
  { "<leader>di", cmd[[lua require'dap'.step_in()]],                                     desc = "Step Into" },
  { "<leader>dl", cmd[[Telescope dap list_breakpoints]],                                 desc = "List breakpoints" },
  { "<leader>dn", cmd[[lua require'dap'.continue()]],                                    desc = "Continue to Next" },
  { "<leader>do", cmd[[lua require'dap'.step_out()]],                                    desc = "Step Out" },
  { "<leader>dq", cmd[[lua require'dap'.disconnect()]],                                  desc = "Disconnect" },
  { "<leader>dr", cmd[[lua require'dap'.run_to_cursor()]],                               desc = "Run to Cursor" },
  { "<leader>du", cmd[[lua require'dap'.step_over()]],                                   desc = "Step Over" },

  { "<F10>",   cmd[[lua require'dap'.step_over()]],     desc = "Step Over" },
  { "<F11>",   cmd[[lua require'dap'.step_into()]],     desc = "Step Into" },
  { "<F5>",    cmd[[lua require'dap'.continue()]],      desc = "Start" },
  { "<F6>",    cmd[[lua require'dap'.run_to_cursor()]], desc = "Run to cursor" },
  { "<S-F11>", cmd[[lua require'dap'.step_out()]],      desc = "Step Out" },

  { "<F2>", cmd[[Inspect]], desc = "Highlight under cursor" },
})
