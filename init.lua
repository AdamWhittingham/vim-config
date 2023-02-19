-- Core Config
require "config.options"
require "config.keymaps" -- Load before plugins so lazy loading doesn't got nuts
require "config.plugins" -- Lazy loaded, so require plugins early
require "config.utils"
require "config.language_options"
require "config.treesitter"
require "config.text_manipulation"

-- Development
require "config.lsp"
require "config.languages"
require "config.debugging"
require "config.git"
require "config.testing"

require "config.autocomplete"

-- UI
require "config.startup_screen"
require "config.navigation"
require "config.indentation_guidelines"
require "config.colorizer"
require "config.telescope"
require "config.diff"
