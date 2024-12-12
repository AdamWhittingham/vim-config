local debug_counter = 0

local counter_func = function()
    debug_counter = debug_counter + 1
    return '[' .. tostring(debug_counter) .. ']'
end

return {
  "andrewferrier/debugprint.nvim",
  opts = {
    keymaps = {
      normal = {
        plain_below = "g?p",
        plain_above = "g?P",
        variable_below = "g?o",
        variable_above = "g?O",
        delete_debug_prints = "g?d",
        variable_below_alwaysprompt = "",
        variable_above_alwaysprompt = "",
        textobj_below = "",
        textobj_above = "",
        toggle_comment_debug_prints = "",
      },
      insert = {
        plain = "<C-G>p",
        variable = "<C-G>v",
      },
      visual = {
        variable_below = "g?v",
        variable_above = "g?V",
      },
    },
    commands = {
      toggle_comment_debug_prints = "ToggleCommentDebugPrints",
      delete_debug_prints = "DeleteDebugPrints",
      reset_debug_prints_counter = "ResetDebugPrintsCounter",
    },
    print_tag = "DEBUG",
    display_location = false,
    move_to_debugline = true,
    display_snippet = false,
    display_counter = counter_func,
  },
}
