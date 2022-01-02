-- Helper functions
local default_opts = { noremap = true, silent = true }

local keymap = function(mode, keys, command, opts)
	opts = opts or default_opts
	vim.api.nvim_set_keymap(mode, keys, command, opts)
end

local normal = function(keys, command)
	keymap("n", keys, command.."<CR>", default_opts)
end

local insert = function(keys, command)
	keymap("i", keys, command, default_opts)
end

local visual = function(keys, command)
	keymap("v", keys, command, default_opts)
end

local leader = function(keys, command)
	keymap("n", "<leader>"..keys, command.."<CR>", default_opts)
end

---------------------------------
-- Leader key = <space>
---------------------------------
keymap("", "<space>", "<Nop>", default_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

---------------------------------
-- Text navigation
---------------------------------

leader("h", ":nohlsearch")
leader("m", ":Telescope marks")
normal("m", "`")

---------------------------------
-- Text manipulation
---------------------------------

-- Add add blank line above/below current line
normal("]<space>", "m`o<Esc>``")
normal("[<space>", "m`O<Esc>``")

-- Move current line up or down
normal("[e", ":m -2<cr>")
normal("]e", ":m +1<cr>")

-- Stay in indent mode
visual("<", "<gv")
visual(">", ">gv")

-- <Leader>i to reindent the current file
leader("i", "m`gg=G``")

-- Split/Join constructs
leader("s", ":SplitjoinSplit")
leader("S", ":SplitjoinJoin")

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

---------------------------------
-- File navigation
---------------------------------

-- Opening and finding files
leader("d", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser() theme=ivy")
leader("f", ":Telescope find_files")
leader("F", ":Telescope live_grep")

-- Switching buffers
leader(".", ":Telescope buffers theme=get_dropdown sort_mru=true layout_config={width=0.75}")
leader("<leader>", ":b#")

---------------------------------
-- Language aware navigation
---------------------------------

-- Jump to definition or references
leader("{", ":Telescope lsp_definitions")
leader("}", ":Telescope lsp_references")

-- Show signature help on C-s
normal("<C-s>", "<cmd>lua vim.lsp.buf.signature_help()")
insert("<C-s>", "<cmd>lua vim.lsp.buf.signature_help()")

-- Show code docs on K
normal("K", "<cmd>lua vim.lsp.buf.hover()")

-- LSP code manipulations
leader("<leader>r", "<cmd>lua vim.lsp.buf.rename()")
leader("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()")

-- gi and <leader>gi to show diagnostics
leader("gi", "<cmd>lua vim.diagnostic.open_float()")
normal("gi", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })')

-- [d and ]d to traverse diagnostics - <leader>q to add all to the ruickfix list
normal("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })')
normal("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })')
leader("q", "<cmd>lua vim.diagnostic.setloclist()")

---------------------------------
-- Test helpers
---------------------------------

-- Leader t/T to send the current file/line to rspec via tmux windows
leader("t", [[:call InvokeViaTmux("rspec", expand("%:p"))]])
leader("T", [[:call InvokeViaTmux("rspec", expand("%:p") . ":" . line('.'))]])

leader("cp", ":CopyRelativePath")
leader("cP", ":CopyAbsolutePath")
leader("cf", ":CopyFileName")
leader("cd", ":CopyDirectoryPath")
leader("cr", ":CopyRelativePathAndLine")

-- <Leader>gr to open the current line in the repos website
vim.g.gh_open_command = [[fn() { echo "$@" | pbcopy; }; fn ]]
vim.g.gh_line_map = '<leader>cg'

---------------------------------
-- Colorscheme Creation helpers
---------------------------------

normal("<F10>", ":TSHighlightCapturesUnderCursor")
