local colorizer_ok, colorizer = pcall(require, "colorizer")
if not colorizer_ok then
  return
end

colorizer.setup({
  -- Customise attachment to files
    '*',
  },
  -- Default opts for all files
  {
    names = false,
    mode = 'virtualtext',
  }
)

-- Set a filetype for palette files so Colorizer attaches on open
vim.cmd [[ au BufReadPost *.palette setlocal ft=palette ]]
