local servers = {
  'bashls',
  'jsonls',
  'cssls',
  'html',
  'dockerls',
  'solargraph',
  'yamlls',
  'sumneko_lua',
  'gopls',
}

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = servers
})

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local lsp_handlers = require("config.lsp.handlers")
require "config.lsp.null-ls"

lsp_handlers.setup()

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = function(client, bufnr)
      lsp_handlers.on_attach(client, bufnr)
    end
  }
end

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

