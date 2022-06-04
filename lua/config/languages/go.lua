function org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit)
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

local group = vim.api.nvim_create_augroup("lang-go", {})
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  command = "lua vim.lsp.buf.formatting_seq_sync()",
  pattern = {"*.go"},
  group = group,
})

local has_dapgo, dapgo = pcall(require, "dap-go")
if has_dapgo then
  dapgo.setup()
end
