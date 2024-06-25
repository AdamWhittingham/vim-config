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
}
