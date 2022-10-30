require('mini.indentscope').setup(
  {
    symbol = "│",
    draw = {
      animation = function()
        return 0
      end,
    },
    options = {
      try_as_border = true
    }
  }
)
