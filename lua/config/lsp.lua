-- Defaults
vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.lsp.config('solargraph', {
  cmd = { 'asdf', 'exec', 'solargraph', 'stdio' },
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
  init_options = { formatting = true },
  filetypes = { 'ruby', 'erb' },
  root_markers = { '.git' },
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
  settings = {
    yamlls = {
      cmd = { 'yaml-language-server', '--stdio' },
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
vim.lsp.enable('solargraph')
vim.lsp.enable('yamlls')
