-- Turn on wrapping and spell checking for human text-centric formats
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = {
      "gitcommit",
      "markdown",
    },
    command = [[setlocal wrap spell]],
  }
)

-- Detect filetypes Neovim doesn't, so the right language servers attach
vim.filetype.add({
  extension = {
    bash = 'bash',
    j2 = 'jinja',
  },
  pattern = {
    -- Ansible (attaches ansiblels as well as yamlls)
    ['.*/playbooks/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/playbook[^/]*%.ya?ml'] = 'yaml.ansible',
    ['.*/site%.ya?ml'] = 'yaml.ansible',
    ['.*/roles/[^/]+/[^/]+/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/group_vars/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/host_vars/.*%.ya?ml'] = 'yaml.ansible',

    -- Docker Compose
    ['.*/compose[^/]*%.ya?ml'] = 'yaml.docker-compose',
    ['.*/docker%-compose[^/]*%.ya?ml'] = 'yaml.docker-compose',
  },
})

-- Set custom syntax for .env files to conceal values
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {".env", ".powenv"},
  command = "set ft=env conceallevel=2",
})

-- Golang
-- Go has robust formatting standards, so lets be a good citizen & apply them on save.
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "On save, format Go and organize imports",

  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({async = false})
    vim.lsp.buf.code_action({
      context = {only = {"source.organizeImports"}},
      apply = true,
    })
  end
})
