-- Defaults
vim.lsp.config('*', {
  root_markers = { '.git' },
})

local lsp_setup = function (name, lsp_config)
  vim.lsp.config(name, lsp_config)
  vim.lsp.enable(name)
end

lsp_setup('tsserver', {
  cmd = {'typescript-language-server', '--stdio'},
  filetypes = { 'typescript' },
  root_dir = vim.fs.root(0, {'package.json', '.git'}),
})

lsp_setup('solargraph', {
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

lsp_setup('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

lsp_setup('lua_ls', {
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

lsp_setup('yamlls', {
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

