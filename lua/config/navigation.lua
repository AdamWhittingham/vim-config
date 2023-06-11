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

require('mini.bracketed').setup({
  comment    = { suffix = '#', options = {} },-- default 'c' clashes with next/prex change
  oldfile    = { suffix = '', options = {} }, -- disable oldfiles to keep o free for future use
  yank       = { suffix = '', options = {} }, -- disable yank as Yanky does a more complete job
})
require('mini.cursorword').setup()
require('mini.jump').setup()
