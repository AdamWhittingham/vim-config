return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },
      disable_filetype = { "TelescopePrompt" },
    }
  },
  {
    "windwp/nvim-ts-autotag",
    config = true,
  },
  {
    "RRethy/nvim-treesitter-endwise",
  }
}
