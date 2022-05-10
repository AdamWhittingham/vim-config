local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("config.lsp.handlers").setup()
require "config.lsp.null-ls"

lspconfig.bashls.setup {}
lspconfig.cssls.setup {}
lspconfig.dockerls.setup {}
lspconfig.gopls.setup {}
lspconfig.html.setup {}
lspconfig.solargraph.setup {}
lspconfig.sumneko_lua.setup {}
lspconfig.yamlls.setup {}
