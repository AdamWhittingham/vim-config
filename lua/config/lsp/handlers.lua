local M = {}

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

M.init = function()
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local borderStyle = "rounded"

  local config = {
    virtual_text = false,
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = borderStyle,
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
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
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

M.setup = function(servers)
  local lspconfig = require("lspconfig")
  M.init()

  for _, server in ipairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    }

    lspconfig[server].setup(opts)
  end
end

return M
