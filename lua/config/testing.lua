require("neotest").setup({
  running = {
    concurrent = false
  },
  adapters = {
    require('neotest-rspec'),
    require('neotest-go'),
    require('neotest-jest')({
      jestCommand = "npm test --",
      jestConfigFile = "custom.jest.config.ts",
      env = { CI = true },
      cwd = function(_path)
        return vim.fn.getcwd()
      end,
    }),
  },
  icons = {
    running = "ﰌ"
  },
  highlights = {
    running = "TestRunning",
    passed = "TestPassed",
    failed = "TestFailed",
  }
})
