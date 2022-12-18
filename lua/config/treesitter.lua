local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "dockerfile",
    "elm",
    "gitignore",
    "go",
    "gomod",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "proto",
    "php",
    "python",
    "regex",
    "ruby",
    "scss",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { }, -- List of parsers to ignore installing
  autopairs = { enable = true },
  autotag = { enable = true },
  highlight = {
    enable = true,
    disable = {}, -- list of languages that will be disabled
    additional_vim_regex_highlighting = {}, -- list of languages to use vim regex highlights with
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  playground = {
    enable = true,
  },
  textobjects = {
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
        [']['] = '@function.outer',
        [']{'] = '@class.outer',
      },
      goto_next_end = {
        [']]'] = '@function.outer',
        [']}'] = '@class.outer',
      },
      goto_previous_start = {
        ['[['] = '@function.outer',
        ['[{'] = '@class.outer',
      },
      goto_previous_end = {
        ['[]'] = '@function.outer',
        ['[{'] = '@class.outer',
      },
    },
  },
}
