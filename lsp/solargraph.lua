return {
  cmd = { 'asdf', 'exec', 'solargraph', 'stdio' },
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
  init_options = { formatting = true },
  filetypes = { 'ruby', 'erb' },
  root_markers = { '.git' },
}
