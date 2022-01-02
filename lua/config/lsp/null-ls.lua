local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local fmt = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diag = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    fmt.trim_whitespace.with({
      filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux', 'ruby', 'javascript' },
    }),
    fmt.prettier.with({ extra_args = { "--no-semi" } }),
    --fmt.prettierd,
    fmt.eslint_d,
    fmt.gofmt,
    diag.eslint_d,
  },
})
