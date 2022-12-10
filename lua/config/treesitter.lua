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
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
      'xml',
      'php',
      'markdown',
      'glimmer','handlebars','hbs',
      'erb'
    },
    skip_tags = {
      'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
      'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
    }
  },
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
}
