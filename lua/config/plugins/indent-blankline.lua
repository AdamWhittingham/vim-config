return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "▏",
        tab_char = " ",
      },
      scope = {
        enabled = true,
        exclude = {
          node_type = { ruby = { "module", "class" } },
        }
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
        },
      },
    },
  },
}
