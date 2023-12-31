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

-- Golang
-- Go has robust formatting standards, so lets be a good citizen & apply them on save.
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "On save, format Go and organize imports",

  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format()
    vim.lsp.buf.code_action({
      context = {only = {"source.organizeImports"}},
      apply = true,
    })
  end
})
