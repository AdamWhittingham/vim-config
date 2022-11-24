-- Turn on wrapping and spell checking for human text-centric formats
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = {
      "gitcommit",
      "markdown",
    },
    command = [[setlocal wrap spell]],
  }
)

-- Bind test tools in Ruby
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = { "ruby" },
    command = [[setlocal wrap spell]],
  }
)

local api = vim.api

-- windows to close with "q"
api.nvim_create_autocmd(
  "FileType",
  { pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })


local which_key_status_ok, wk = pcall(require, "which-key")
if not which_key_status_ok then
  return
end


----
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.schedule(TestRunner)
  end,
})

function TestRunner()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
  local test_keymaps = {}

  -- local fName = vim.fn.expand "%:p:t"
  -- local fAbsPath = vim.fn.expand "%:p"
  -- local fRelPath = vim.fn.expand "%:."
  -- local fRelPathLine = fRelPath .. ':' .. vim.fn.line('.')

  if ft == "ruby" then
    test_keymaps = {
      t = { [[:call InvokeViaTmux("rspec", expand("%:p"))<CR>]], "Test file" },
      T = { [[:call InvokeViaTmux("rspec", expand("%:p") . ":" . line('.'))<CR>]], "Test line" },
    }
  elseif ft == "go" then
    test_keymaps = {
      t = { [[:call InvokeViaTmux("go test", expand("%:p"))<CR>]], "Test file" },
      T = { [[:call InvokeViaTmux("go test", expand("%:p") . ":" . line('.'))<CR>]], "Test line" },
    }
  end

  if next(test_keymaps) ~= nil then
    wk.register(
      test_keymaps,
      { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>" }
    )
  end
end
