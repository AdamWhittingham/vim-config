-- Core Config
require "config.options"
require "config.keymaps" -- Load before plugins so lazy loading doesn't got nuts
require "config.lazy" -- Lazy loaded, so require plugins early
require "config.utils"
require "config.language_options"
require "config.text_manipulation"

-- Development
require "config.languages"
require "config.debugging"
require "config.git"
require "config.testing"

-- UI
require "config.lsp.ui"
require "config.startup_screen"
require "config.statusline"
require "config.navigation"
require "config.indentation_guidelines"
require "config.colorizer"
require "config.diff"
