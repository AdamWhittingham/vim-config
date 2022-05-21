local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')
local gps = require("nvim-gps")

gps.setup()

local force_inactive = {
  filetypes = {},
  buftypes = {},
  bufnames = {}
}

local components = {
  active = {{}, {} },
  inactive = {{}, {}},
}

force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame',
  'alpha'
}

force_inactive.buftypes = {
  'terminal'
}

LEFT = 1;
RIGHT = 2;

local add_left = function (component_config)
  table.insert(components.active[LEFT], component_config)
end

local add_right = function (component_config)
  table.insert(components.active[RIGHT], component_config)
end


-------------------------------------------
-- Left
-------------------------------------------

add_left({
  provider = '  ',
  hl = function()
    local val = {}

    val.fg = vi_mode_utils.get_mode_color()
    val.style = 'bold'

    return val
  end,
  right_sep = ' '
})

add_left({
  provider = {
    name = "file_info",
    opts = {
      type = 'relative',
      colored_icon = false,
    }
  },
  short_provider = {
    name = 'file_info',
    opts = {
      type = 'relative-short',
      colored_icon = false,
    }
  },
  hl = {
    fg = 'white',
    bg = '#102070',
  },
  left_sep = 'slant_left',
  right_sep = {'slant_right_2', ' '},
})

add_left({
  provider = 'file_size',
  enabled = function()
    return vim.fn.getfsize(vim.fn.expand('%:p')) > 0
  end,
  right_sep = {
    str = '  ',
    hl = { style = 'bold' }
  },
})

add_left({
  enabled = function()
    return gps.is_available()
  end,
  provider = function()
    return gps.get_location({})
  end,
  short_provider = function()
    return gps.get_location({
      depth = 3,
      separator = ''
    })
  end,
  hl = {
    fg = 'white',
    bg = 'bg'
  }
})


-------------------------------------------
-- Right
-------------------------------------------

add_right({
  provider = 'diagnostic_errors',
  enabled = function()
    return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
  end,
  hl = {
    fg = 'red',
    style = 'bold'
  },
  right_sep = ' '
})

add_right({
  provider = 'diagnostic_warnings',
  enabled = function()
    return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
  end,
  hl = {
    fg = 'orange',
    style = 'bold'
  },
  right_sep = {
    str = ' ',
    hl = { style = 'bold' }
  },
})

add_right({
  provider = 'git_diff_added',
  hl = {
    fg = 'green',
    bg = 'bg'
  }
})

add_right({
  provider = 'git_diff_changed',
  hl = {
    fg = 'orange',
    bg = 'bg'
  }
})

add_right({
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'bg'
  },
})


add_right({
  provider = {
    name = 'position',
    opts = { padding = true },
  },
  hl = {
    fg = 'lightgrey',
    bg = 'bg',
  },
  left_sep = {
    str = '  ',
    hl = { style = 'bold' }
  },
})


add_right({
  provider = {
    name = 'scroll_bar',
    opts = {
      reverse = true,
    },
  },
  hl = {
    fg = '#102070',
    bg = '#2050BF',
  },
  left_sep = ' '
})

-- INACTIVE

-- fileType
components.inactive[1][1] = {
  provider = 'file_type',
  hl = {
    fg = 'NONE',
    bg = 'cyan'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'cyan',
    }
  },
  right_sep = {
    {
      str = '',
      hl = {
        fg = 'cyan',
      }
    },
    ' '
  }
}

require('feline').setup({
  components = components,
  force_inactive = force_inactive,
})
