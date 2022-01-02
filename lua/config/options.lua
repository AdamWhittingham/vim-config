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

-- UI
opt.conceallevel = 0
opt.cursorline = true
opt.number = true
opt.hlsearch = true
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd "colorscheme adCode"
