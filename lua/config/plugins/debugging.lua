local dapui_opts = {
  layouts = {
    {
      elements = {
        'repl',
        'scopes',
      },
      size = 10,
      position = 'bottom',
    },
    {
      elements = {
        'stacks',
        'breakpoints',
        'watches',
      },
      size = 40,
      position = 'left',
    },
  },
  controls = {
    element = "scopes"
  }
}

return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    -- fancy UI for the debugger
    {
      "rcarriga/nvim-dap-ui",
      opts = dapui_opts,
      config = function(_, opts)
        require("dap.ext.vscode").load_launchjs()
        require('telescope').load_extension('dap')

        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup(opts)

        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end

        vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

        vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapBreakpoint', linehl='', numhl='DapBreakpoint'})
        vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='DapBreakpointConditional', linehl='', numhl='DapBreakpointConditional'})
        vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='DapBreakpointRejected', linehl='', numhl='DapBreakpointRejected'})
        vim.fn.sign_define('DapStopped', {text='', texthl='DapStopped', linehl='DapStoppedLine', numhl='DapStopped'})
      end,
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    -- mason.nvim integration
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "mason.nvim",
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        automatic_installation = true,
        handlers = {},
        ensure_installed = {},
      },
    },

    "leoluz/nvim-dap-go",                          -- Bindings for Delve, the go debugger
    "suketa/nvim-dap-ruby",                        -- Bindings for ruby-debug
  },
}
