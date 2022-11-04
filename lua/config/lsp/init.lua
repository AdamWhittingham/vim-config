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

require("config.lsp.handlers").setup()

for _, server in ipairs(servers) do
  local opts = {
    on_attach = require("config.lsp.handlers").on_attach,
    capabilities = require("config.lsp.handlers").capabilities,
  }

  local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  lspconfig[server].setup(opts)
end

local lspsaga_ok, lspsaga = pcall(require, "lspsaga")
if not lspsaga_ok then
  return
end

lspsaga.init_lsp_saga({
  code_action_lightbulb = { enable = false },
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
