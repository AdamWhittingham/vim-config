local M = {}

local servers = {
  'bashls',
  'cssls',
  'html',
  'jsonls',
  'lua_ls',
  'yamlls',
}

if vim.fn.executable('go') == 1 then
  table.insert(servers, "gopls")
end

if vim.fn.executable('ruby') == 1 then
  table.insert(servers, "solargraph")
end

if vim.fn.executable('node') == 1 then
  table.insert(servers, "ts_ls")
end

if vim.fn.executable('python') == 1 then
  table.insert(servers, "pylsp")
end

if vim.fn.executable('docker') == 1 then
  table.insert(servers, "dockerls")
  table.insert(servers, "docker_compose_language_service")
end

M.servers = servers
M.handlers = require("config.lsp.handlers")

-- Setup Server customisations
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

vim.lsp.config('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

vim.lsp.config('yamlls', {
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

M.setup = function()
  M.handlers.setup(servers)
end

return M
