local function configure()
  local colors = {
    fg_a  = '#ffffff',
    fg_b  = '#dddddd',
    fg_c  = '#cccccc',
    black = '#080808',
    bg_a  = '#10408F',
    bg_b  = '#002080',
    bg_c  = '#081028',
  }

  local ad_code = {
    normal = {
      a = { fg = colors.fg_a, bg = colors.bg_a },
      b = { fg = colors.fg_b, bg = colors.bg_b },
      c = { fg = colors.fg_c, bg = colors.bg_c },
    },

    inactive = {
      a = { fg = colors.fg_a, bg = colors.bg_a },
      b = { fg = colors.fg_b, bg = colors.bg_b },
      c = { fg = colors.fg_c},
    },
  }

  return {
    options = {
      theme = ad_code,
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
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
      lualine_b = {
        'filesize',
      },
      lualine_c = {
        { 'diagnostics', symbols = {error = '', warn = '', info = '', hint = ''}, update_in_insert = true },
        { 'navic' },
      },
      lualine_x = {
        { 'diff', symbols = {added = '', modified = '', removed = ''} },
      },
      lualine_y = {
        'branch',
      },
      lualine_z = {
        'progress',
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },

    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },

    tabline = {},
    extensions = {},
  }
end

return {
  -- show code hierarchy of item under cursor
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      separator = " » ",
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      "nvim-navic",
    },
    config = configure()
  }
}
