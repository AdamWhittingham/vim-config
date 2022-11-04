local on_save_go = function()
  vim.lsp.buf.format()
  vim.lsp.buf.code_action({
    context = {only = {"source.organizeImports"}},
    apply = true,
  })
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = on_save_go,
})

local has_dapgo, dapgo = pcall(require, "dap-go")
if has_dapgo then
  dapgo.setup()
end
