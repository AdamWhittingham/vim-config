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
  tab = "»•"
}

-- UI
opt.conceallevel = 0
opt.cursorline = true
opt.number = true
opt.hlsearch = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 3
opt.sidescrolloff = 3
vim.cmd "colorscheme adCode"
