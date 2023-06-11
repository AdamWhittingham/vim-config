local M = {}

local navic = require("nvim-navic")

M.init = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

M.on_attach = function(client, bufnr)
  -- :Format => LSP formatting
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_seq_sync()' ]]

  -- Setup highlight usages when LSP supports it
  local cap = client.server_capabilities
  if cap.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", {clear = true})
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
      desc = "Highlight usages",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
      desc = "Clear highlighted References",
    })
  end

  if cap.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return M
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

M.setup = function(servers)
  local lspconfig = require("lspconfig")
  M.init()

  for _, server in ipairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    }

    local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)
    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end

    lspconfig[server].setup(opts)
  end

end

return M
