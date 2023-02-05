local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

local autopairs_status_ok, autopair_completion = pcall(require, "nvim-autopairs.completion.cmp")
if not autopairs_status_ok then
  return
end

-----------------------------------------------
-- Configure bracket and block autocompletions
-----------------------------------------------

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


-----------------------------------------------
-- Configure Commenting
-----------------------------------------------
require('mini.comment').setup()
