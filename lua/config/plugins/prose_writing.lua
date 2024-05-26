return {
  -- Easily call Google Translate and replace in-editor
  {
    "uga-rosa/translate.nvim",
    event = "VeryLazy",
  },

  -- Use Vale for prose linting
  {
    "marcelofern/vale.nvim",
    lazy = true,
    ft = "markdown",
    config = function(_, _)
      require("vale").setup({
        bin="/usr/local/bin/vale",
        vale_config_path="$HOME/.adshell/vale/vale.ini",
      })
    end
  },

  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('render-markdown').setup({
        headings = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        dash = '—',
        bullets = { '●', '○', '◆', '◇' },
        checkbox = {
          unchecked = '󰄱 ',
          checked = ' ',
        },
        quote = '┃',
        callout = {
          note = '  Note',
          tip = '  Tip',
          important = '󰅾  Important',
          warning = '  Warning',
          caution = '󰳦  Caution',
        },
        conceal = {
          default = vim.opt.conceallevel:get(),
          rendered = 3,
        },
        table_style = 'full',
        highlights = {
          heading = {
            backgrounds = {
              "@markup.heading.1.markdown",
              "@markup.heading.2.markdown",
              "@markup.heading.3.markdown",
            },
            foregrounds = {
              "@markup.heading.1.markdown",
              "@markup.heading.2.markdown",
              "@markup.heading.3.markdown",
              "@markup.heading.4.markdown",
              "@markup.heading.5.markdown",
              "@markup.heading.6.markdown",
            },
          },
          code = 'CodeBlock',
        },
      })

    end
  }
}
