local components = require('feline.presets')["default"]

components.active[1][3] = {
    provider = {
      name = "file_info",
      opts = {
        type = 'full-path',
        colored_icon = false,
      }
    },
    short_provider = {
        name = 'file_info',
        opts = {
          type = 'short-path',
          colored_icon = false,
        }
    },
    hl = {
        fg = 'white',
        bg = '#102070',
    },
    left_sep = 'slant_left',
    right_sep = {'slant_right_2', ' '},
}

require('feline').setup(components)
