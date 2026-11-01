-- Defaults
vim.lsp.config('*', {
  root_markers = { '.git' },
})

-- ruby_lsp is the default (see `vim.lsp.enable` below) and runs via the asdf
-- shim from the project root, so it picks up the project's Ruby & bundle.
-- Solargraph is kept for projects on Ruby < 3, use `:lsp enable solargraph`
vim.lsp.config('solargraph', {
  cmd = { 'asdf', 'exec', 'solargraph', 'stdio' },
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
  init_options = { formatting = true },
  filetypes = { 'ruby', 'eruby' },
  root_markers = { 'Gemfile', '.git' },
})

vim.lsp.config('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

vim.lsp.config('yamlls', {
  filetypes = { 'yaml', 'yaml.ansible', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
        url = "", -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
})

vim.lsp.enable('gopls')
vim.lsp.enable('jsonls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('yamlls')
