local projectionist_config = function ()
  vim.cmd [[
  let g:projectionist_heuristics ={
  \  "spec/*.rb": {
  \     "app/*.rb":                   { "alternate": "spec/{}_spec.rb",                                         "type": "source"},
  \     "app/javascript/src/*.js":    { "alternate": "spec/javascript/{}.test.js",                              "type": "source"},
  \     "app/javascript/src/*.jsx":   { "alternate": "spec/javascript/{}.test.js",                              "type": "source"},
  \     "lib/*.rb":                   { "alternate": "spec/{}_spec.rb",                                         "type": "source"},
  \     "spec/*_spec.rb":             { "alternate": ["app/{}.rb","lib/{}.rb"],                                 "type": "test"},
  \     "spec/javascript/*.test.js":  { "alternate": ["app/javascript/src/{}.js", "app/javascript/src/{}.jsx"], "type": "test"},
  \  },
  \ "*_test.go": {
  \    "*.go":       { "alternate": "{}_test.go", "type": "test" },
  \    "*_test.go":  { "alternate": "{}.go",      "type": "source" },
  \  },
  \ "*.erb": {
  \    "*.html.erb": { "alternate": "{}.text.erb", "type": "text" },
  \    "*.text.erb": { "alternate": "{}.html.erb", "type": "html" },
  \ }
  \}
]]
end

return {
  -- Map tools and actions based on the project
  {
    "tpope/vim-projectionist",
    config = projectionist_config,
    event = "VeryLazy",
  },

  -- Seemless movement between panes and tmux
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- Quick shortcuts for copying the file name, path and/or line number
  {
    "AdamWhittingham/vim-copy-filename",
    event = "VeryLazy",
  },

  -- Generate and copy the github/gitlab repo URL for the current line
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = "VeryLazy",
    opts = { mapping = nil }
  },
}
