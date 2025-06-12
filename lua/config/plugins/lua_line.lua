local colors = {
  fg_a  = '#8888FF',
  bg_a  = '#001060',

  fg_a_i  = '#AAAAFF',
  bg_a_i  = '#2000A0',
  fg_a_v  = '#AAAAFF',
  bg_a_v  = '#5000A0',

  fg_b  = '#ffffff',
  bg_b  = '#10408F',

  fg_c  = '#cccccc',
  bg_c  = '#081028',
}

local ad_code = {
  normal = {
    a = { fg = colors.fg_a, bg = colors.bg_a },
    b = { fg = colors.fg_b, bg = colors.bg_b },
    c = { fg = colors.fg_c, bg = colors.bg_c },
  },

  visual = {
    a = { fg = colors.fg_a_v, bg = colors.bg_a_v },
    b = { fg = colors.fg_b, bg = colors.bg_b },
    c = { fg = colors.fg_c, bg = colors.bg_c },
  },

  insert = {
    a = { fg = colors.fg_a_i, bg = colors.bg_a_i },
    b = { fg = colors.fg_b, bg = colors.bg_b },
    c = { fg = colors.fg_c, bg = colors.bg_c },
  },


  inactive = {
    a = { fg = colors.fg_a, bg = colors.bg_a },
    b = { fg = colors.fg_b, bg = colors.bg_b },
    c = { fg = colors.fg_c, bg = colors.bg_c },
  },
}

local line_config = {
  options = {
    theme = ad_code,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      'branch',
    },
    lualine_b = {
      {
        'filename',
        separator = { right = '', left = '' },
        path = 4,
        symbols = {
          modified = '•',      -- Text to show when the file is modified.
          readonly = '',
          unnamed = '󰢤', -- Text to show for unnamed buffers.
          newfile = '',     -- Text to show for newly created file before first write
        },
      },
    },
    lualine_c = {
      { 'diagnostics', symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}, update_in_insert = true },
    },
    lualine_x = {
      { 'diff', symbols = {added = ' ', modified = ' ', removed = ' '} },
    },
    lualine_y = {
      'filesize',
    },
    lualine_z = {
      'progress',
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = { 'filename' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },

  tabline = {},
  extensions = {},
}

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = line_config,
  }
}
