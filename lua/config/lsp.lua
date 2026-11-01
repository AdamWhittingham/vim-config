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

-- docker_language_server's Dockerfile linting needs Docker installed, so
-- only use it for Compose files and use dockerls for Dockerfiles
vim.lsp.config('docker_language_server', {
  filetypes = { 'yaml.docker-compose' },
})

vim.lsp.log.set_level(vim.log.levels.WARN)

-- Server name => executable it needs. Most come from the Brewfile.
-- vim.lsp.enable fails silently when the executable is missing, so check
-- first and warn about anything that needs installing.
local servers = {
  ansiblels              = 'ansible-language-server',
  bashls                 = 'bash-language-server',
  docker_language_server = 'docker-language-server',
  dockerls               = 'docker-langserver',
  eslint                 = 'vscode-eslint-language-server',
  gopls                  = 'gopls',
  jsonls                 = 'vscode-json-language-server',
  lua_ls                 = 'lua-language-server',
  ruby_lsp               = 'ruby-lsp',
  vtsls                  = 'vtsls',
  yamlls                 = 'yaml-language-server',
}

local missing = {}
for server, executable in pairs(servers) do
  if vim.fn.executable(executable) == 1 then
    vim.lsp.enable(server)
  else
    table.insert(missing, executable)
  end
end

if #missing > 0 then
  table.sort(missing)
  vim.schedule(function()
    vim.notify(
      'Language servers not installed: ' .. table.concat(missing, ', ') .. '\nRun `make deps` in ' .. vim.fn.stdpath('config'),
      vim.log.levels.WARN
    )
  end)
end
