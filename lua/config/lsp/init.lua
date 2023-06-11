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
  table.insert(servers, "ruby_ls")
  table.insert(servers, "solargraph")
end

if vim.fn.executable('docker') == 1 then
  table.insert(servers, "dockerls")
  table.insert(servers, "docker_compose_language_service")
end

local mason = require("mason")
local mason_lsp = require("mason")

mason.setup()

mason_lsp.setup({
  ensure_installed = servers
})

require("config.lsp.handlers").setup(servers)

local lspsaga_ok, lspsaga = pcall(require, "lspsaga")
if not lspsaga_ok then
  return
end

lspsaga.setup({
  lightbulb = { enable = false },
  symbol_in_winbar = { enable = false },
  finder = {
    keys = {
      expand_or_jump = "<cr>"
    },
  },
})

local lspsig_ok, lspsig = pcall(require, "lsp_signature")
if not lspsig_ok then
  return
end

lspsig.setup({
  bind = true,
  doc_lines = 5,
  max_height = 6,
  max_width = 60,
  hint_prefix = " ",
  hi_parameter = "LspSignatureActiveParameter",
  floating_window = false,
})
