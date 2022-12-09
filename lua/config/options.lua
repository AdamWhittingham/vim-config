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

vim.cmd [[
try
  colorscheme adCode
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

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
