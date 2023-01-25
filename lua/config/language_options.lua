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

-- Set custom syntax for .env files to conceal values
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {".env", ".powenv"},
  command = "set ft=env conceallevel=2",
})
