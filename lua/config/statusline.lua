local lsp = require('feline.providers.lsp')
local gps = require("nvim-navic")

vim.opt.laststatus = 3

gps.setup({
  separator = " » ",
})

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

-- Override Feline colours with AdCode values
local colors = {
  fg       = '#FAFAFA',
  bg       = '#07071A',
  blue     = '#40B0FF',
  cyan     = '#06B0B0',
  darkblue = '#102070',
  green    = '#50DF40',
  magenta  = '#F4628D',
  orange   = '#FFB633',
  red      = '#E9475A',
  purple   = '#9C4FFF',
  yellow   = '#FFFF40',
}

local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.red,
    VISUAL = colors.magenta,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.purple,
    ['V-REPLACE'] = colors.purple,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.green,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.yellow
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
    return {
      name = require('feline.providers.vi_mode').get_mode_highlight_name(),
      fg = require('feline.providers.vi_mode').get_mode_color(),
      style = 'bold'
    }
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
    fg = colors.fg,
    bg = colors.darkblue,
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
      separator = '.'
    })
  end
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
    fg = colors.red,
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
    fg = colors.orange,
    style = 'bold'
  },
  right_sep = {
    str = '  ',
    hl = { style = 'bold' }
  },
})

add_right({
  provider = 'git_branch',
})

add_right({
  provider = 'git_diff_added',
  hl = { fg = colors.green }
})

add_right({
  provider = 'git_diff_changed',
  hl = { fg = colors.orange }
})

add_right({
  provider = 'git_diff_removed',
  hl = { fg = colors.red }
})


add_right({
  provider = {
    name = 'position',
    opts = { padding = true },
  },
  hl = { fg = 'lightgrey' },
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
    fg = colors.darkblue,
    bg = colors.blue
  },
  left_sep = ' '
})

-------------------------------------------
-- INACTIVE MODE
-------------------------------------------
components.inactive[1][1] = {
  provider = 'file_type',
  hl = { bg = colors.darkblue },
  left_sep = {
    str = ' ',
    hl = { fg = colors.darkblue }
  },
  right_sep = {
    {
      str = '',
      hl = { fg = colors.darkblue }
    },
    ' '
  }
}

return {
  components = components,
  force_inactive = force_inactive,
  vi_mode_colors = vi_mode_colors,
}
