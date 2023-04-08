-- NOTE: This file is loaded BEFORE any plugins
-- and should only be used to configure core neovim options

-- Set leader outside of keymaps to ensure that plugins know what to bind to
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- File management
opt.backup = false
opt.swapfile = false
opt.undofile = true

-- Text layout
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.wrap = false
opt.list = true
opt.listchars = {
  trail = "•",
  nbsp = "␣",
  tab = "» "
}

-- UI
opt.timeoutlen = 250
opt.conceallevel = 0
opt.cursorline = true
opt.number = true
opt.hlsearch = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 3
opt.sidescrolloff = 3
opt.updatetime=500
opt.winbar = ''
opt.mouse = ''
opt.breakindent = true
opt.updatetime = 250
opt.completeopt = 'menuone,noselect'

local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", command = "set cursorline", group = cursorGrp }
)
vim.api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Diff
opt.diffopt = opt.diffopt + "linematch:60"
