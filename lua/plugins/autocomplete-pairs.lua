return {
  -- Autopairs, integrates with both cmp and treesitter
  {
    "windwp/nvim-autopairs",
    config =function ()
      local npairs = require("nvim-autopairs")
      npairs.setup {
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
        disable_filetype = { "TelescopePrompt" },
      }

      npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
      npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
    end
  },

  'windwp/nvim-ts-autotag',    -- Auto close HTML and XML tags too

}
