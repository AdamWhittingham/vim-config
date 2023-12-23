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
  table.insert(servers, "tsserver")
end

if vim.fn.executable('python3') == 1 then
  table.insert(servers, "pylsp")
end

if vim.fn.executable('docker') == 1 then
  table.insert(servers, "dockerls")
  table.insert(servers, "docker_compose_language_service")
end

M.servers = servers
M.handlers = require("config.lsp.handlers")

M.setup = function()
  M.handlers.setup(servers)
end

return M
