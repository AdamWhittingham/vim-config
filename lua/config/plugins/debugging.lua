return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
  },

  {"leoluz/nvim-dap-go", config = true },
  {"suketa/nvim-dap-ruby", config = true},
}
