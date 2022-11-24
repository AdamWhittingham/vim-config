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
