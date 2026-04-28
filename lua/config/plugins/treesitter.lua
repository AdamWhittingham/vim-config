return {
  -- Treesitter Syntax parsing and highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
    init = function()
      local ensureInstalled = {
        "bash",
        "comment",
        "css",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "ruby",
        "scss",
        "sql",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      }
      local alreadyInstalled = require('nvim-treesitter.config').get_installed()
      local parsersToInstall = vim.iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
      require('nvim-treesitter').install(parsersToInstall)
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      max_lines = 5,
      min_window_height = 32,
    }
  },

  {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      opts = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']f'] = '@function.outer',
            [']{'] = '@class.outer',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']}'] = '@class.outer',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[{'] = '@class.outer',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[{'] = '@class.outer',
          },
        },
      }
    },

    -- Show details of treesitter and highlighting
    {
      "nvim-treesitter/playground",
      lazy = true,
      cmd = "TSPlaygroundToggle",
    },

    "andymass/vim-matchup",                       -- Extend % for more languages
  }
