-- Defaults
vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.lsp.enable('bashls')
vim.lsp.enable('gopls')
vim.lsp.enable('jsonls')
vim.lsp.enable('lua')
vim.lsp.enable('solargraph')
vim.lsp.enable('yamlls')
